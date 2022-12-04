using EmailMarketing.Modules.Roles.Responses;
using EmailMarketing.Modules.Users.Entities;

namespace EmailMarketing.Modules.Users.Responses
{
    public class UserDetailResponse
    {
        public string? Name { get; set; }
        public string? Email { get; set; }
        public int? RoleId { get; set; }
        public string? RoleName { get; set; }
        public string? Avatar { get; set; }
        public UserStatus Status { get; set; }
        public string? RefreshToken { get; set; }
        public List<PermissionResponse>? Permissions { get; set; } 
    }
}
