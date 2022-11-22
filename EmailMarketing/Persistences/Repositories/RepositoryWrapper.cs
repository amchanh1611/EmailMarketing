using EmailMarketing.Common.BacsicClass;
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

    public interface IRepositoryWrapper
    {
        IUserRepository User { get; }
        IRoleRepository Role { get; }

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

    public class RepositoryWrapper : IRepositoryWrapper
    {
        private IUserRepository user;
        private IRoleRepository role;
        private readonly AppDbContext context;

        public RepositoryWrapper(AppDbContext context)
        {
            this.context = context;
        }

        public IUserRepository User
        {
            get
            {
                if (this.user == null)
                {
                    this.user = new UserRepository(context);
                }
                return this.user;
            }
        }

        public IRoleRepository Role
        {
            get
            {
                if (this.role == null)
                {
                    this.role = new RoleRepository(context);
                }
                return this.role;
            }
        }

        public void Save()
        {
            context.SaveChanges();
        }
    }
}