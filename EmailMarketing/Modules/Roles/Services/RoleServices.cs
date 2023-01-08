using AutoMapper;
using EmailMarketing.Common.Pagination;
using EmailMarketing.Common.Search;
using EmailMarketing.Common.Sort;
using EmailMarketing.Middleware;
using EmailMarketing.Modules.Roles.Entities;
using EmailMarketing.Modules.Roles.Requests;
using EmailMarketing.Modules.Roles.Responses;
using EmailMarketing.Persistences.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using System.Text;

namespace EmailMarketing.Modules.Roles.Services
{
    public interface IRoleServices
    {
        void Create(CreateRoleRequest request);

        void CreatePermission(CreatePermissionRequest request);

        void UpdateRole(int roleId, UpdateRoleRequest request);
        void Delete(DeleteRoleRequest request);

        PaggingResponse<Role> Get(GetRoleRequest request);

        PermissionOfRoleResponse PermissionOfRole(int roleId);

        List<PermissionResponse> GetPermission(UserType userType);
    }

    public class RoleServices : IRoleServices
    {
        private readonly IRepositoryWrapper repository;
        private readonly IMapper mapper;

        public RoleServices(IRepositoryWrapper repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }

        public void Create(CreateRoleRequest request)
        {
            using IDbContextTransaction transaction = repository.Transaction();
            try
            {
                Role role = repository.Role.Create(mapper.Map<CreateRoleRequest, Role>(request));
                repository.Save();

                repository.RolePermission.CreateMulti
                    (
                        request.PermissionCodes!.Select(x => new RolePermission { RoleId = role!.Id, PermissionCode = x }
                    ).ToList());

                repository.Save();
                transaction.Commit();
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                throw new BadRequestException("Create fail");
            }
        }

        public void CreatePermission(CreatePermissionRequest request)
        {
            Permission permission = mapper.Map<CreatePermissionRequest, Permission>(request);
            StringBuilder userTypeBuilder = new();
            foreach (UserType userType in request.UserType!)
            {
                userTypeBuilder.Append($"{userType.ToString()},");
            }
            permission.UserType = userTypeBuilder.ToString().TrimEnd(',');
            repository.Permission.Create(permission);
            repository.Save();
        }

        public void Delete(DeleteRoleRequest request)
        {
            List<Role> roles = repository.Role.FindByCondition(x => request.RoleIds!.Contains(x.Id)).ToList();
            repository.Role.DeleteMulti(roles);
            repository.Save();
        }

        public PaggingResponse<Role> Get(GetRoleRequest request)
        {
            return repository.Role.FindAll()
                .ApplySearch(request.InfoSearch!)
                .ApplySort(request.Orderby)
                .ApplyPagging(request.Current, request.PageSize);
        }

        public List<PermissionResponse> GetPermission(UserType userType)
        {
            return repository.Permission
                .FindByCondition(x => x.UserType.Contains(userType.ToString()))
                .GroupBy(key => key.Modules)
                .Select(grp => new PermissionResponse
                {
                    Modules = grp.Key,
                    Permissions = grp.Select(x => new Permissions { Code = x.Code, Name = x.Name }).ToList()
                }).ToList();
        }

        public PermissionOfRoleResponse PermissionOfRole(int roleId)
        {
            return repository.RolePermission
                .FindByCondition(x => x.RoleId == roleId)
                .Include(x => x.Role)
                .Include(x => x.Permission)
                .ToList()
                .GroupBy(x => x.RoleId)
                .Select(grp => new PermissionOfRoleResponse
                {
                    RoleId = grp.Key,
                    Permissions = grp.Select(x => x.Permission)
                    .GroupBy(x => x!.Modules)
                    .Select(grp => new PermissionResponse
                    {
                        Modules = grp.Key,
                        Permissions = grp.Select(x => new Permissions { Code = x!.Code, Name = x.Name }).ToList()
                    }).ToList()
                })
                .FirstOrDefault()!;
        }

        public void UpdateRole(int roleId, UpdateRoleRequest request)
        {
            using IDbContextTransaction trans = repository.Transaction();
            try
            {
                Role? role = repository.Role.FindByCondition(x => x.Id == roleId).Include(x=>x.RolePermissions).FirstOrDefault();

                if (role is null)
                    throw new Exception();

                role = repository.Role.Update(mapper.Map(request, role));

                List<string> permissionOfRole = role.RolePermissions.Select(x => x.PermissionCode).ToList();

                List<string> lstRemove = permissionOfRole.Except(request.PermissionCodes!).ToList();

                repository.RolePermission.DeleteMulti(lstRemove.Select(x => new RolePermission { RoleId = role!.Id, PermissionCode = x }).ToList());

                List<string> lstAdd = request.PermissionCodes!.Except(permissionOfRole).ToList();

                repository.RolePermission.CreateMulti(lstAdd.Select(x => new RolePermission { RoleId = role!.Id, PermissionCode = x }).ToList());

                repository.Save();
                trans.Commit();
            }
            catch (Exception ex)
            {
                trans.Rollback();
                throw new BadRequestException("Update fail");
            }
        }
    }
}