using EmailMarketing.Modules.Users.Entities;

namespace EmailMarketing.Modules.Users.Responses
{
    public class ProfileResponse
    {
        public string? Name { get; set; }
        public string? Email { get; set; }
        public int? RoleId { get; set; }
        public string? RoleName { get; set; }
        public string? Avatar { get; set; }
        public UserStatus Status { get; set; }
        public List<string>? PermissionCode { get; set; } 
    }
}
