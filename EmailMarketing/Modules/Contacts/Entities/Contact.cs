namespace EmailMarketing.Modules.Contacts.Entities
{
    public class Contact
    {
        public int Id { get; set; }
        public string Name { get; set; } = default!;
        public string Email { get; set; } = default!;
        public ContactMale? Male { get; set; } = ContactMale.Orther;
        public int? GroupContactId { get; set; }
        public GroupContact? GroupContact { get; set; }
    }
    public class GroupContact
    {
        public int Id { get; set; }
        public string Name { get; set; } = default!;
        public int NumberContact { get; set; } = default!;
        public ICollection<Contact> Contacts { get; set; } = default!;
    }
    public enum ContactMale
    {
        Male = 1,
        Female,
        Orther
    }
}
