using EmailMarketing.Common.RepositoriesBase;
using EmailMarketing.Modules.Projects.Enities;
using EmailMarketing.Modules.Roles.Entities;
using EmailMarketing.Modules.ServiecesPackage.Enities;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Persistences.Context;
using Microsoft.EntityFrameworkCore.Storage;

namespace EmailMarketing.Persistences.Repositories
{
    public interface IUserRepository : IRepositoryBase<User>
    { }

    public interface IRoleRepository : IRepositoryBase<Role>
    { }

    public interface IPermissionRepository : IRepositoryBase<Permission>
    { }

    public interface IRolePermissionRepository : IRepositoryBase<RolePermission>
    { }

    public interface IServicePackageRepository : IRepositoryBase<ServicePackage>
    { }

    public interface IProjectRepository : IRepositoryBase<Project>
    { }

    public interface IRepositoryWrapper
    {
        IUserRepository User { get; }
        IRoleRepository Role { get; }
        IRolePermissionRepository RolePermission { get; }
        IPermissionRepository Permission { get; }
        IServicePackageRepository ServicePackage { get; }
        IProjectRepository Project { get; }

        void Save();

        IDbContextTransaction Transaction();
    }

    public class UserRepository : RepositoryBase<User>, IUserRepository
    {
        public UserRepository(AppDbContext context) : base(context)
        {
        }
    }

    public class RoleRepository : RepositoryBase<Role>, IRoleRepository
    {
        public RoleRepository(AppDbContext context) : base(context)
        {
        }
    }

    public class PermissionRepository : RepositoryBase<Permission>, IPermissionRepository
    {
        public PermissionRepository(AppDbContext context) : base(context)
        {
        }
    }

    public class RolePermissionRepository : RepositoryBase<RolePermission>, IRolePermissionRepository
    {
        public RolePermissionRepository(AppDbContext context) : base(context)
        {
        }
    }

    public class ServicePackageRepository : RepositoryBase<ServicePackage>, IServicePackageRepository
    {
        public ServicePackageRepository(AppDbContext context) : base(context)
        {
        }
    }

    public class ProjectRepository : RepositoryBase<Project>, IProjectRepository
    {
        public ProjectRepository(AppDbContext context) : base(context)
        {
        }
    }

    public class RepositoryWrapper : IRepositoryWrapper
    {
        private IUserRepository user;
        private IRoleRepository role;
        private IRolePermissionRepository rolePermission;
        private IPermissionRepository permission;
        private IServicePackageRepository servicePackage;
        private IProjectRepository project;
        private readonly AppDbContext context;

        public RepositoryWrapper(AppDbContext context)
        {
            this.context = context;
        }

        public IUserRepository User
        {
            get
            {
                if (user is null)
                {
                    user = new UserRepository(context);
                }
                return user;
            }
        }

        public IRoleRepository Role
        {
            get
            {
                if (this.role is null)
                {
                    this.role = new RoleRepository(context);
                }
                return this.role;
            }
        }

        public IRolePermissionRepository RolePermission
        {
            get
            {
                if (rolePermission is null)
                {
                    rolePermission = new RolePermissionRepository(context);
                }
                return rolePermission;
            }
        }

        public IPermissionRepository Permission
        {
            get
            {
                if (permission is null)
                {
                    permission = new PermissionRepository(context);
                }
                return permission;
            }
        }

        public IServicePackageRepository ServicePackage
        {
            get
            {
                if (servicePackage is null)
                {
                    servicePackage = new ServicePackageRepository(context);
                }
                return servicePackage;
            }
        }
        public IProjectRepository Project
        {
            get
            {
                if(project is null)
                {
                    project = new ProjectRepository(context);
                }
                return project;
            }
        }

        public void Save()
        {
            context.SaveChanges();
        }

        public IDbContextTransaction Transaction()
        {
            return context.Database.BeginTransaction();
        }
    }
}