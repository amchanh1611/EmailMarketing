using EmailMarketing.Modules.Contacts.Entities;
using EmailMarketing.Modules.Projects.Enities;
using EmailMarketing.Modules.Users.Entities;
namespace EmailMarketing.Modules.Operations.Entities
{
    public class Operation
    {
        public int Id { get; set; }
        public int ProjectId { get; set; }
        public string Name { get; set; } = default!;
        public int GoogleAccountId { get; set; }
        public string Subject { get; set; } = default!;
        public int GroupContactId { get; set; }
        public string Content { get; set; } = default!;
        public DateTime DateSend { get; set; }
        public DateTime CreatedDate { get; set; } = DateTime.Now;
        public int UserId { get; set; }
        public OperationStatus Status { get; set; } = OperationStatus.Processing;
        public User User { get; set; } = default!;
        public Project Project { get; set; } = default!;
        public GoogleAccount GoogleAccount { get; set; } = default!;
        public GroupContact GroupContact { get; set; } = default!;
    }
    public enum OperationStatus
    {
        Complete = 1,
        Fail,
        Processing
    }
}
