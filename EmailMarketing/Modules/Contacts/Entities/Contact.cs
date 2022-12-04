using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Operations.Entities;
namespace EmailMarketing.Modules.Contacts.Entities
{
    public class Contact
    {
        public int Id { get; set; }
        public string Name { get; set; } = default!;
        public string Email { get; set; } = default!;
        public ContactMale? Male { get; set; } = ContactMale.Orther;
        public int? GroupContactId { get; set; }
        public int UserId { get; set; }
        public GroupContact? GroupContact { get; set; }
        public User? User { get; set; }
    }
    public class GroupContact
    {
        public int Id { get; set; }
        public string Name { get; set; } = default!;
        public int UserId { get; set; }
        public User? User { get; set; }
        public ICollection<Contact> Contacts { get; set; } = default!;
        public ICollection<Operation> Operations { get; set; } = default!;
    }
    public enum ContactMale
    {
        Male = 1,
        Female,
        Orther
    }
}
