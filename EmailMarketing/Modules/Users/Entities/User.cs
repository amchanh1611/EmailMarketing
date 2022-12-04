using EmailMarketing.Modules.Contacts.Entities;
using EmailMarketing.Modules.Operations.Entities;
using EmailMarketing.Modules.Projects.Enities;
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
        public UserMale? Male { get; set; } = UserMale.Other;
        public DateTime CreatedDate { get; set; } = DateTime.Now;
        public UserStatus Status { get; set; } = UserStatus.Active;
        public string? Avatar { get; set; }
        public string RefreshToken { get; set; } = default!;
        public Role? Role { get; set; }
        public ICollection<Project> Projects { get; set; } = default!;
        public ICollection<GroupContact> GroupContacts { get; set; } = default!;
        public ICollection<Contact> Contacts { get; set; } = default!;
        public ICollection<GoogleAccount> GoogleAccounts { get; set; } = default!;
        public ICollection<Operation> Operations { get; set; } = default!;
    }

    public enum UserStatus
    {
        Active = 1,
        Lock = 2
    }
    public enum UserMale
    {
        Male = 1,
        Female,
        Other
    }
}