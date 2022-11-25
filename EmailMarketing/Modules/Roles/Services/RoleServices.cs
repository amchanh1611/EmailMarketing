using AutoMapper;
using EmailMarketing.Common.Pagination;
using EmailMarketing.Common.Search;
using EmailMarketing.Common.Sort;
using EmailMarketing.Modules.Roles.Entities;
using EmailMarketing.Modules.Roles.Requests;
using EmailMarketing.Persistences.Repositories;
using Microsoft.EntityFrameworkCore;
using System.Text;

namespace EmailMarketing.Modules.Roles.Services
{
    public interface IRoleServices
    {
        void Create(CreateRoleRequest request);
        void CreatePermission(CreatePermissionRequest request);
        PaggingResponse<Role> Get(GetRoleRequest request);
        List<Permission> GetPermission(UserType userType);
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
            Role role = mapper.Map<CreateRoleRequest, Role>(request);
            repository.Role.Create(role);
            repository.Save();
            role = repository.Role.FindByCondition(x => x.Name == request.Name && x.UserType == request.UserType).FirstOrDefault()!;
            foreach(string permissionCode in request.PermissionCode!)
            {
                repository.RolePermission.Create(new RolePermission { RoleId = role.Id, PermissionCode = permissionCode });
            }
            repository.Save();
        }

        public void CreatePermission(CreatePermissionRequest request)
        {
            Permission permission = mapper.Map<CreatePermissionRequest, Permission>(request);
            StringBuilder userTypeBuilder = new();
            foreach(UserType userType in request.UserType!)
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
                .Include(x => x.RolePermissions)
                .ApplySearch(request.InfoSearch!)
                .ApplySort(request.Orderby)
                .ApplyPaging(request.Current, request.PageSize);
        }

        public List<Permission> GetPermission(UserType userType)
        {
            var a = repository.Permission
                .FindByCondition(x => x.UserType.Contains(userType.ToString()))
                .GroupBy(
                x=>x.Modules
                ,x=>x.Code
                ,(key, g) => new {Modules = key,Code=g.ToList()}).ToList(); 
            //return repository.Permission
            //    .FindByCondition(x => x.UserType.Contains(userType.ToString()))
            //    .GroupBy(
            //    x=>x.Modules
            //    ,x=>x.Code
            //    ,(key, g) => new {Modules = key,Code=g.ToList()}).ToList();
        }
    }
}
