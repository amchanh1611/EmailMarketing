using EmailMarketing.Modules.Roles.Entities;
using System.Text.Json.Serialization;

namespace EmailMarketing.Modules.Users.Entities
{
    public class User
    {
        public int Id { get; set; }
        public string Name { get; set; } = default!;
        public string Email { get; set; } = default!;
        [JsonIgnore]
        public string Password { get; set; } = default!;
        public int RoleId { get; set; }
        public string? Phone { get; set; }
        public Male? Male { get; set; }
        public DateTime CreatedDate { get; set; } = DateTime.Now;
        public UserStatus Status { get; set; } = UserStatus.Active;
        public string? Avatar { get; set; } 
        public Role? Role { get; set; } 
    }

    public enum UserStatus
    {
        Active = 1,
        Lock = 2
    }
    public enum Male
    {
        Male = 1,
        Female,
        Other
    }
}