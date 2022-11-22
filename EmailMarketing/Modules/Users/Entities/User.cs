using EmailMarketing.Modules.Roles.Entities;

namespace EmailMarketing.Modules.Users.Entities
{
    public class User
    {
        public int Id { get; set; }
        public string? Name { get; set; } 
        public string? Email { get; set; }
        public string? Password { get; set; }
        public int? RoleId { get; set; }
        public Status Status { get; set; } = Status.Active;
        public string? Avatar { get; set; } 
        public Role Role { get; set; } 
    }

    public enum Status
    {
        Active,
        Lock
    }
}