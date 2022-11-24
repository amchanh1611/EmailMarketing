﻿using EmailMarketing.Modules.Users.Entities;

namespace EmailMarketing.Modules.Roles.Entities
{
    public class Role
    {
        public int Id { get; set; }
        public string Name { get; set; } = default!;
        public UserType UserType { get; set; }
        public ICollection<User> Users { get; set; } = default!;
        public ICollection<RolePermission> RolePermissions { get; set; } = default!;
    }
    public class Permission
    {
        public string Code { get; set; } = default!;
        public string Name { set; get; } = default!;
        public string UserType { get; set; } = default!;
        public ICollection<RolePermission> RolePermissions { get; set; } = default!;
    }
    public class RolePermission
    {
        public int RoleId { get; set; }
        public string PermissionCode { get; set; } = default!;
        public Role? Role { get; set; }
        public Permission? Permission { get; set; }
    }
    public enum UserType
    {
        Admin = 1,
        System,
        Customer
    }
}