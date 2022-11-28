using EmailMarketing.Modules.Roles.Entities;

namespace EmailMarketing.Modules.Roles.Responses
{
    public class RoleResponse
    {
        public int RoleId { get; set; }
        public string? Name { get; set; }
        public UserType? UserType { get; set; }
        public List<Permissions>? Permissions { get; set; }
    }
    public class PermissionOfRoleResponse
    {
        public int RoleId { get; set; }
        public List<PermissionResponse>? Permissions { get; set; }
    }
}
