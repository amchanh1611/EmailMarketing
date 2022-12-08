using EmailMarketing.Modules.Contacts.Entities;
using EmailMarketing.Modules.Operations.Entities;
using EmailMarketing.Modules.Projects.Enities;
using EmailMarketing.Modules.Roles.Entities;
using EmailMarketing.Modules.ServiecesPackage.Enities;
using EmailMarketing.Modules.Users.Entities;
using Humanizer;
using Microsoft.EntityFrameworkCore;

namespace EmailMarketing.Persistences.Context
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions options) : base(options)
        {
            ChangeTracker.LazyLoadingEnabled = false;
        }
        public DbSet<User> Users { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Permission> Permissions { get; set; }
        public DbSet<RolePermission> RolePermissions { get; set; }
        public DbSet<ServicePackage> ServicePackages { get; set; }
        public DbSet<Project> Projects { get; set; }
        public DbSet<GroupContact> GroupContacts { get; set; }
        public DbSet<Contact> Contacts { get; set; }
        public DbSet<GoogleAccount> GoogleAccounts { get; set; }
        public DbSet<Operation> Operations { get; set; }
        public DbSet<OperationDetail> OperationDetails { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>(entityBuilder =>
            {
                entityBuilder.ToTable(nameof(User).Underscore());
                entityBuilder.HasKey(x => x.Id);
                entityBuilder.Property(x => x.Name).HasColumnType("text");
                entityBuilder.Property(x => x.Email).HasColumnType("text");
                entityBuilder.Property(x => x.Password).HasColumnType("text");
                entityBuilder.Property(x => x.Status).HasColumnType("tinyint");
                entityBuilder.Property(x => x.Avatar).HasColumnType("text");
                entityBuilder.Property(x => x.Male).HasColumnType("tinyint");
                entityBuilder.Property(x => x.Phone).HasColumnType("char(11)");
                entityBuilder.Property(x => x.RefreshToken).HasColumnType("text");
                entityBuilder.HasOne(x => x.Role)
                .WithMany(x => x.Users)
                .HasForeignKey(x => x.RoleId)
                .OnDelete(DeleteBehavior.NoAction);
            });

            modelBuilder.Entity<Role>(entityBuilder =>
            {
                entityBuilder.ToTable(nameof(Role).Underscore());
                entityBuilder.HasKey(x => x.Id);
                entityBuilder.Property(x => x.Name).HasColumnType("varchar(100)");
                entityBuilder.Property(x => x.UserType).HasColumnType("tinyint");
            });
            modelBuilder.Entity<Permission>(entityBuilder =>
            {
                entityBuilder.ToTable(nameof(Permission).Underscore());
                entityBuilder.HasKey(x => x.Code);
                entityBuilder.Property(x => x.Code).HasColumnType("char(25)");
                entityBuilder.Property(x => x.Name).HasColumnType("varchar(50)");
                entityBuilder.Property(x => x.UserType).HasColumnType("char(100)");
                entityBuilder.Property(x => x.Modules).HasColumnType("text");

            });
            modelBuilder.Entity<RolePermission>(entityBuilder =>
            {
                entityBuilder.ToTable(nameof(RolePermission).Underscore());
                entityBuilder.HasKey(x => new { x.RoleId, x.PermissionCode });
                entityBuilder.HasOne(x => x.Role)
                .WithMany(x => x.RolePermissions)
                .HasForeignKey(x => x.RoleId)
                .OnDelete(DeleteBehavior.Cascade);
                entityBuilder.HasOne(x => x.Permission)
                .WithMany(x => x.RolePermissions)
                .HasForeignKey(x => x.PermissionCode)
                .OnDelete(DeleteBehavior.Cascade);
            });
            modelBuilder.Entity<ServicePackage>(entityBuilder =>
            {
                entityBuilder.ToTable(nameof(ServicePackages).Underscore());
                entityBuilder.HasKey(x => x.Id);
                entityBuilder.Property(x => x.Name).HasColumnType("text");
            });
            modelBuilder.Entity<Project>(entityBuilder =>
            {
                entityBuilder.ToTable(nameof(Project).Underscore());
                entityBuilder.HasKey(x => x.Id);
                entityBuilder.Property(x => x.Name).HasColumnType("text");
                entityBuilder.Property(x => x.CodeContract).HasColumnType("varchar(50)");
                entityBuilder.HasOne(x => x.User)
                .WithMany(x => x.Projects)
                .HasForeignKey(x => x.OwnerId)
                .OnDelete(DeleteBehavior.NoAction);
                entityBuilder.HasOne(x => x.ServicePackage)
                .WithMany(x => x.Projects)
                .HasForeignKey(x => x.ServicePackageId)
                .OnDelete(DeleteBehavior.NoAction);
            });
            modelBuilder.Entity<GroupContact>(entityBuilder =>
            {
                entityBuilder.ToTable(nameof(GroupContact).Underscore());
                entityBuilder.HasKey(x => x.Id);
                entityBuilder.Property(x => x.Name).HasColumnType("text");
                entityBuilder.HasOne(x => x.User)
                .WithMany(x => x.GroupContacts)
                .HasForeignKey(x => x.UserId);
            });
            modelBuilder.Entity<Contact>(entityBuilder =>
            {
                entityBuilder.ToTable(nameof(Contact).Underscore());
                entityBuilder.HasKey(x => x.Id);
                entityBuilder.Property(x => x.Name).HasColumnType("text");
                entityBuilder.Property(x => x.Email).HasColumnType("text");
                entityBuilder.Property(x => x.Male).HasColumnType("tinyint");
                entityBuilder.HasOne(x => x.GroupContact)
                .WithMany(x => x.Contacts)
                .HasForeignKey(x => x.GroupContactId)
                .OnDelete(DeleteBehavior.SetNull);
                entityBuilder.HasOne(x => x.User)
                .WithMany(x => x.Contacts)
                .HasForeignKey(x => x.UserId);
            });
            modelBuilder.Entity<GoogleAccount>(entityBuilder =>
            {
                entityBuilder.ToTable(nameof(GoogleAccount).Underscore());
                entityBuilder.HasKey(x => x.Id);
                entityBuilder.Property(x => x.Name).HasColumnType("Text");
                entityBuilder.Property(x => x.Email).HasColumnType("Text");
                entityBuilder.Property(x => x.RefreshToken).HasColumnType("varchar(512)");
                entityBuilder.HasOne(x => x.User)
                .WithMany(x => x.GoogleAccounts)
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);
            });
            modelBuilder.Entity<Operation>(entityBuilder =>
            {
                entityBuilder.ToTable(nameof(Operation).Underscore());
                entityBuilder.HasKey(x => x.Id);
                entityBuilder.Property(x => x.Name).HasColumnType("text");
                entityBuilder.Property(x => x.Subject).HasColumnType("text");
                entityBuilder.Property(x => x.Content).HasColumnType("longtext");
                entityBuilder.Property(x => x.Status).HasColumnType("tinyint");
                entityBuilder.Property(x => x.FileContent).HasColumnType("text");
                entityBuilder.Property(x => x.FileName).HasColumnType("text");
                entityBuilder.HasOne(x => x.Project)
                .WithMany(x => x.Operations)
                .HasForeignKey(x => x.ProjectId)
                .OnDelete(DeleteBehavior.NoAction);
                entityBuilder.HasOne(x => x.User)
                .WithMany(x => x.Operations)
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.NoAction);
                entityBuilder.HasOne(x => x.GoogleAccount)
                .WithMany(x => x.Operations)
                .HasForeignKey(x => x.GoogleAccountId)
                .OnDelete(DeleteBehavior.NoAction);
                entityBuilder.HasOne(x => x.GroupContact)
                .WithMany(x => x.Operations)
                .HasForeignKey(x => x.GroupContactId)
                .OnDelete(DeleteBehavior.NoAction);
            });
            modelBuilder.Entity<OperationDetail>(entityBuilder =>
            {
                entityBuilder.ToTable(nameof(OperationDetail).Underscore());
                entityBuilder.HasKey(x => x.Id);
                entityBuilder.Property(x => x.Status).HasColumnType("tinyint");
                entityBuilder.Property(x => x.StatusMessage).HasColumnType("char(20)");
                entityBuilder.HasOne(x => x.Operation)
                .WithMany(x => x.OperationDetails)
                .HasForeignKey(x => x.OperationId);
                entityBuilder.HasOne(x => x.Contact)
                .WithMany(x => x.OperationDetails)
                .HasForeignKey(x => x.ContactId);
            });
        }
    }
}