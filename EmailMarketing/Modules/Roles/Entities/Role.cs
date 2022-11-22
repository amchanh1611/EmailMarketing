using EmailMarketing.Modules.Users.Entities;

namespace EmailMarketing.Modules.Roles.Entities
{
    public class Role
    {
        public int Id { get; set; }
        public string? Name { get; set; } = default!;
        public ICollection<User> Users { get; set; } = default!;
    }
}