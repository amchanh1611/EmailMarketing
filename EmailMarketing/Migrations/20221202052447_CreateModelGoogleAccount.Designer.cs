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
    [Migration("20221202052447_CreateModelGoogleAccount")]
    partial class CreateModelGoogleAccount
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.11")
                .HasAnnotation("Relational:MaxIdentifierLength", 64);

            modelBuilder.Entity("EmailMarketing.Modules.Contacts.Entities.Contact", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<int?>("GroupContactId")
                        .HasColumnType("int");

                    b.Property<sbyte?>("Male")
                        .HasColumnType("tinyint");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<int>("UserId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("GroupContactId");

                    b.HasIndex("UserId");

                    b.ToTable("contact", (string)null);
                });

            modelBuilder.Entity("EmailMarketing.Modules.Contacts.Entities.GroupContact", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<int>("UserId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("group_contact", (string)null);
                });

            modelBuilder.Entity("EmailMarketing.Modules.Projects.Enities.Project", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("CodeContract")
                        .IsRequired()
                        .HasColumnType("varchar(50)");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("datetime(6)");

                    b.Property<DateTime>("DateEnd")
                        .HasColumnType("datetime(6)");

                    b.Property<DateTime>("DateStart")
                        .HasColumnType("datetime(6)");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<int>("OwnerId")
                        .HasColumnType("int");

                    b.Property<int>("ServicePackageId")
                        .HasColumnType("int");

                    b.Property<int>("Status")
                        .HasColumnType("int");

                    b.Property<int>("Used")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("OwnerId");

                    b.HasIndex("ServicePackageId");

                    b.ToTable("project", (string)null);
                });

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

            modelBuilder.Entity("EmailMarketing.Modules.ServiecesPackage.Enities.ServicePackage", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<int>("Quantity")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.ToTable("service_packages", (string)null);
                });

            modelBuilder.Entity("EmailMarketing.Modules.Users.Entities.GoogleAccount", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("Text");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("Text");

                    b.Property<string>("RefreshToken")
                        .IsRequired()
                        .HasColumnType("varchar(512)");

                    b.Property<int>("UserId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("UserId");

                    b.ToTable("google_account", (string)null);
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

            modelBuilder.Entity("EmailMarketing.Modules.Contacts.Entities.Contact", b =>
                {
                    b.HasOne("EmailMarketing.Modules.Contacts.Entities.GroupContact", "GroupContact")
                        .WithMany("Contacts")
                        .HasForeignKey("GroupContactId")
                        .OnDelete(DeleteBehavior.SetNull);

                    b.HasOne("EmailMarketing.Modules.Users.Entities.User", "User")
                        .WithMany("Contacts")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("GroupContact");

                    b.Navigation("User");
                });

            modelBuilder.Entity("EmailMarketing.Modules.Contacts.Entities.GroupContact", b =>
                {
                    b.HasOne("EmailMarketing.Modules.Users.Entities.User", "User")
                        .WithMany("GroupContacts")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("User");
                });

            modelBuilder.Entity("EmailMarketing.Modules.Projects.Enities.Project", b =>
                {
                    b.HasOne("EmailMarketing.Modules.Users.Entities.User", "User")
                        .WithMany("Projects")
                        .HasForeignKey("OwnerId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.HasOne("EmailMarketing.Modules.ServiecesPackage.Enities.ServicePackage", "ServicePackage")
                        .WithMany("Projects")
                        .HasForeignKey("ServicePackageId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.Navigation("ServicePackage");

                    b.Navigation("User");
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

            modelBuilder.Entity("EmailMarketing.Modules.Users.Entities.GoogleAccount", b =>
                {
                    b.HasOne("EmailMarketing.Modules.Users.Entities.User", "User")
                        .WithMany("GoogleAccounts")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("User");
                });

            modelBuilder.Entity("EmailMarketing.Modules.Users.Entities.User", b =>
                {
                    b.HasOne("EmailMarketing.Modules.Roles.Entities.Role", "Role")
                        .WithMany("Users")
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.NoAction)
                        .IsRequired();

                    b.Navigation("Role");
                });

            modelBuilder.Entity("EmailMarketing.Modules.Contacts.Entities.GroupContact", b =>
                {
                    b.Navigation("Contacts");
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

            modelBuilder.Entity("EmailMarketing.Modules.ServiecesPackage.Enities.ServicePackage", b =>
                {
                    b.Navigation("Projects");
                });

            modelBuilder.Entity("EmailMarketing.Modules.Users.Entities.User", b =>
                {
                    b.Navigation("Contacts");

                    b.Navigation("GoogleAccounts");

                    b.Navigation("GroupContacts");

                    b.Navigation("Projects");
                });
#pragma warning restore 612, 618
        }
    }
}
