using AutoMapper;
using EmailMarketing.Common.Pagination;
using EmailMarketing.Common.Search;
using EmailMarketing.Common.Sort;
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

        PaggingResponse<Role> Get(GetRoleRequest request);

        List<PermissionOfRoleResponse> PermissionOfRole(int roleId);

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
                repository.Role.Create(mapper.Map<CreateRoleRequest, Role>(request));
                repository.Save();
                Role? role = repository.Role.FindByCondition(x => x.Name == request.Name && x.UserType == request.UserType).FirstOrDefault();

                foreach (string permissionCode in request.PermissionCodes!)
                {
                    repository.RolePermission.Create(new RolePermission { RoleId = role!.Id, PermissionCode = permissionCode });
                }
                repository.Save();
                throw new Exception();
                transaction.Commit();
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                throw new Exception();
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
                })
                .ToList();
        }

        public List<PermissionOfRoleResponse> PermissionOfRole(int roleId)
        {
            return repository.RolePermission
                .FindByCondition(x => x.RoleId == roleId)
                .Include(x => x.Role)
                .GroupBy(x => x.RoleId)
                .Select(grp => new PermissionOfRoleResponse
                {
                    RoleId = grp.Key,
                    PermissionCodes = grp.Select(x => x.PermissionCode).ToList()
                })
                .ToList()!;
        }

        public void UpdateRole(int roleId, UpdateRoleRequest request)
        {
            using IDbContextTransaction trans = repository.Transaction();
            try
            {
                Role? role = repository.Role.FindByCondition(x => x.Id == roleId).FirstOrDefault();
                repository.Role.Update(mapper.Map(request, role)!);
                repository.Save();

                if (request.PermissionCodes is null)
                    trans.Commit();
                else
                {
                    List<RolePermission> rolePermission = repository.RolePermission
                   .FindByCondition(x => x.RoleId == roleId)
                   .ToList();

                    foreach (string permission in request.PermissionCodes!)
                    {
                        repository.RolePermission.Create(new RolePermission { RoleId = role!.Id, PermissionCode = permission });
                    }

                    foreach (RolePermission permission in rolePermission)
                    {
                        repository.RolePermission.Delete(permission);
                    }
                }
               

                //List<string> rolePermissionString = repository.RolePermission
                //    .FindByCondition(x => x.RoleId == roleId)
                //    .Select(x => x.PermissionCode)
                //    .ToList();

                //List<string> collection = rolePermissionString.Union(request.PermissionCodes).ToList();

                //List<string> collectionDelete = collection.Except(request.PermissionCodes).ToList();
                //foreach (string permissionDelete in collectionDelete)
                //{
                //    repository.RolePermission.Delete(new RolePermission { RoleId = role!.Id, PermissionCode = permissionDelete });
                //}
                //List<string> collectionAdd = collection.Except(rolePermissionString).ToList();
                //foreach (string permissionAdd in collectionAdd)
                //{
                //    repository.RolePermission.Create(new RolePermission { RoleId = role!.Id, PermissionCode = permissionAdd });
                //}

                repository.Save();
                trans.Commit();
            }
            catch (Exception ex)
            {
                trans.Rollback();
            }
        }
    }
}