using EmailMarketing.Modules.Operations.Entities;

namespace EmailMarketing.Modules.Users.Entities
{
    public class GoogleAccount
    {
        public int Id { get; set; }
        public string Name { get; set; } = default!;
        public string Email { get; set; } = default!;
        public string RefreshToken { get; set; } = default!;
        public int UserId { get; set; }
        public User User { get; set; } = default!;
        public ICollection<Operation> Operations { get; set; } = default!;
    }
    public class State
    {
        public int UserId { get; set; }
    }
}
