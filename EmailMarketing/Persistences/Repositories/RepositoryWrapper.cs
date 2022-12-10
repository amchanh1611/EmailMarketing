using EmailMarketing.Common.RepositoriesBase;
using EmailMarketing.Modules.Contacts.Entities;
using EmailMarketing.Modules.Operations.Entities;
using EmailMarketing.Modules.Projects.Enities;
using EmailMarketing.Modules.Roles.Entities;
using EmailMarketing.Modules.ServiecesPackage.Enities;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Persistences.Context;
using Microsoft.EntityFrameworkCore.Storage;

namespace EmailMarketing.Persistences.Repositories
{
    public interface IUserRepository : IRepositoryBase<User> { }

    public interface IRoleRepository : IRepositoryBase<Role> { }

    public interface IPermissionRepository : IRepositoryBase<Permission> { }

    public interface IRolePermissionRepository : IRepositoryBase<RolePermission> { }

    public interface IServicePackageRepository : IRepositoryBase<ServicePackage> { }

    public interface IProjectRepository : IRepositoryBase<Project> { }
    public interface IGroupContactRepository : IRepositoryBase<GroupContact> { }
    public interface IContactRepository : IRepositoryBase<Contact> { }
    public interface IGoogleAccountRepository : IRepositoryBase<GoogleAccount> { }
    public interface IOperationRepository : IRepositoryBase<Operation> { }
    public interface IOperationDetailRepository : IRepositoryBase<OperationDetail> { }

    public interface IRepositoryWrapper
    {
        IUserRepository User { get; }
        IRoleRepository Role { get; }
        IRolePermissionRepository RolePermission { get; }
        IPermissionRepository Permission { get; }
        IServicePackageRepository ServicePackage { get; }
        IProjectRepository Project { get; }
        IGroupContactRepository GroupContact { get; }
        IContactRepository Contact { get; }
        IGoogleAccountRepository GoogleAccount { get; }
        IOperationRepository Operation { get; }
        IOperationDetailRepository OperationDetail { get; }
        void Save();

        IDbContextTransaction Transaction();
    }

    public class OperationRepository : RepositoryBase<Operation>, IOperationRepository
    {
        public OperationRepository(AppDbContext context) : base(context) { }
    } 
    public class OperationDetailRepository : RepositoryBase<OperationDetail>, IOperationDetailRepository
    {
        public OperationDetailRepository(AppDbContext context) : base(context) { }
    }

    public class UserRepository : RepositoryBase<User>, IUserRepository
    {
        public UserRepository(AppDbContext context) : base(context) { }
    }

    public class RoleRepository : RepositoryBase<Role>, IRoleRepository
    {
        public RoleRepository(AppDbContext context) : base(context) { }
    }

    public class PermissionRepository : RepositoryBase<Permission>, IPermissionRepository
    {
        public PermissionRepository(AppDbContext context) : base(context) { }
    }

    public class RolePermissionRepository : RepositoryBase<RolePermission>, IRolePermissionRepository
    {
        public RolePermissionRepository(AppDbContext context) : base(context) { }
    }

    public class ServicePackageRepository : RepositoryBase<ServicePackage>, IServicePackageRepository
    {
        public ServicePackageRepository(AppDbContext context) : base(context) { }
    }

    public class ProjectRepository : RepositoryBase<Project>, IProjectRepository
    {
        public ProjectRepository(AppDbContext context) : base(context) { }
    }
    public class GroupContactRepository : RepositoryBase<GroupContact>,IGroupContactRepository
    {
        public GroupContactRepository(AppDbContext context) : base(context) { }
    }

    public class ContactRepository : RepositoryBase<Contact>,IContactRepository
    {
        public ContactRepository(AppDbContext context) : base(context) { }
    }
    public class GoogleAccountRepository : RepositoryBase<GoogleAccount>, IGoogleAccountRepository
    {
        public GoogleAccountRepository(AppDbContext context) : base(context) { }
    }
    public class RepositoryWrapper : IRepositoryWrapper
    {
        private IUserRepository user;
        private IRoleRepository role;
        private IRolePermissionRepository rolePermission;
        private IPermissionRepository permission;
        private IServicePackageRepository servicePackage;
        private IProjectRepository project;
        private IGroupContactRepository groupContact;
        private IContactRepository contact;
        private IGoogleAccountRepository googleAccount;
        private IOperationRepository operation;
        private IOperationDetailRepository operationDetail;
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
                if (role is null)
                {
                    role = new RoleRepository(context);
                }
                return role;
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

        public IGroupContactRepository GroupContact
        {
            get
            {
                if(groupContact is null)
                {
                    groupContact = new GroupContactRepository(context);
                }
                return groupContact;
            }
        }

        public IContactRepository Contact
        {
            get
            {
                if (contact is null)
                {
                    contact = new ContactRepository(context);
                }
                return contact;
            }
        }

        public IGoogleAccountRepository GoogleAccount
        {
            get
            {
                if(googleAccount is null)
                {
                    googleAccount = new GoogleAccountRepository(context);
                }
                return googleAccount;
            }
        }

        public IOperationRepository Operation
        {
            get
            {
                if(operation is null)
                {
                    operation = new OperationRepository(context);
                }
                return operation;
            }
        }
        public IOperationDetailRepository OperationDetail
        {
            get
            {
                if(operationDetail is null)
                {
                    operationDetail = new OperationDetailRepository(context);
                }
                return operationDetail;
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