﻿using EmailMarketing.Modules.Roles.Entities;
using EmailMarketing.Modules.Users.Entities;
using Humanizer;
using Microsoft.EntityFrameworkCore;

namespace EmailMarketing.Persistences.Context
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions options) : base(options)
        {

        }
        public DbSet<User> Users { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Permission> Permissions { get; set; }
        public DbSet<RolePermission> RolePermissions { get; set; }
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
                entityBuilder.HasOne(x => x.Role)
                .WithMany(x => x.Users)
                .HasForeignKey(x => x.RoleId);
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
                entityBuilder.Property(x => x.UserType).HasColumnType("char(10)");

            });
            modelBuilder.Entity<RolePermission>(entityBuilder =>
            {
                entityBuilder.ToTable(nameof(RolePermission).Underscore());
                entityBuilder.HasKey(x => new { x.RoleId, x.PermissionCode });
                entityBuilder.HasOne(x => x.Role)
                .WithMany(x => x.RolePermissions)
                .HasForeignKey(x => x.RoleId);
                entityBuilder.HasOne(x => x.Permission)
                .WithMany(x => x.RolePermissions)
                .HasForeignKey(x => x.PermissionCode);
            });
        }
    }
}