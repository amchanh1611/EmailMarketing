﻿// <auto-generated />
using System;
using EmailMarketing.Persistences.Context;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace EmailMarketing.Migrations
{
    [DbContext(typeof(AppDbContext))]
    [Migration("20221125033712_UpdateDatabase2")]
    partial class UpdateDatabase2
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.11")
                .HasAnnotation("Relational:MaxIdentifierLength", 64);

            modelBuilder.Entity("EmailMarketing.Modules.Roles.Entities.Permission", b =>
                {
                    b.Property<string>("Code")
                        .HasColumnType("char(25)");

                    b.Property<string>("Modules")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("varchar(50)");

                    b.Property<string>("UserType")
                        .IsRequired()
                        .HasColumnType("char(100)");

                    b.HasKey("Code");

                    b.ToTable("permission", (string)null);
                });

            modelBuilder.Entity("EmailMarketing.Modules.Roles.Entities.Role", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("varchar(100)");

                    b.Property<sbyte>("UserType")
                        .HasColumnType("tinyint");

                    b.HasKey("Id");

                    b.ToTable("role", (string)null);
                });

            modelBuilder.Entity("EmailMarketing.Modules.Roles.Entities.RolePermission", b =>
                {
                    b.Property<int>("RoleId")
                        .HasColumnType("int");

                    b.Property<string>("PermissionCode")
                        .HasColumnType("char(25)");

                    b.HasKey("RoleId", "PermissionCode");

                    b.HasIndex("PermissionCode");

                    b.ToTable("role_permission", (string)null);
                });

            modelBuilder.Entity("EmailMarketing.Modules.Users.Entities.User", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("Avatar")
                        .HasColumnType("text");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<sbyte?>("Male")
                        .HasColumnType("tinyint");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("Phone")
                        .HasColumnType("char(11)");

                    b.Property<int>("RoleId")
                        .HasColumnType("int");

                    b.Property<sbyte>("Status")
                        .HasColumnType("tinyint");

                    b.HasKey("Id");

                    b.HasIndex("RoleId");

                    b.ToTable("user", (string)null);
                });

            modelBuilder.Entity("EmailMarketing.Modules.Roles.Entities.RolePermission", b =>
                {
                    b.HasOne("EmailMarketing.Modules.Roles.Entities.Permission", "Permission")
                        .WithMany("RolePermissions")
                        .HasForeignKey("PermissionCode")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("EmailMarketing.Modules.Roles.Entities.Role", "Role")
                        .WithMany("RolePermissions")
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Permission");

                    b.Navigation("Role");
                });

            modelBuilder.Entity("EmailMarketing.Modules.Users.Entities.User", b =>
                {
                    b.HasOne("EmailMarketing.Modules.Roles.Entities.Role", "Role")
                        .WithMany("Users")
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Role");
                });

            modelBuilder.Entity("EmailMarketing.Modules.Roles.Entities.Permission", b =>
                {
                    b.Navigation("RolePermissions");
                });

            modelBuilder.Entity("EmailMarketing.Modules.Roles.Entities.Role", b =>
                {
                    b.Navigation("RolePermissions");

                    b.Navigation("Users");
                });
#pragma warning restore 612, 618
        }
    }
}