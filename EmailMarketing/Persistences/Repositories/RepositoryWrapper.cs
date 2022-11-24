using EmailMarketing.Common.RepositoriesBase;
using EmailMarketing.Modules.Roles.Entities;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Persistences.Context;

namespace EmailMarketing.Persistences.Repositories
{
    public interface IUserRepository : IRepositoryBase<User>
    {
    }

    public interface IRoleRepository : IRepositoryBase<Role>
    {
    }

    public interface IPermissionRepository : IRepositoryBase<Permission>
    {
    }

    public interface IRolePermissionRepository : IRepositoryBase<RolePermission>
    {
    }

    public interface IRepositoryWrapper
    {
        IUserRepository User { get; }
        IRoleRepository Role { get; }
        IRolePermissionRepository RolePermission { get; }
        IPermissionRepository Permission { get; }

        void Save();
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

    public class RepositoryWrapper : IRepositoryWrapper
    {
        private IUserRepository user;
        private IRoleRepository role;
        private IRolePermissionRepository rolePermission;
        private IPermissionRepository permission;
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
                if(permission is null)
                {
                    permission = new PermissionRepository(context);
                }
                return permission;
            }
        }

        public void Save()
        {
            context.SaveChanges();
        }
    }
}