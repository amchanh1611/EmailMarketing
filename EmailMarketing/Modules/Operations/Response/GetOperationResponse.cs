using EmailMarketing.Common.Pagination;
using EmailMarketing.Modules.Contacts.Entities;
using EmailMarketing.Modules.Operations.Entities;

namespace EmailMarketing.Modules.Operations.Response
{
    public class GetOperationResponse
    {
        public int? Id { get; set; }
        public string? ProjectName { get; set; }
        public string? Name { get; set; } = default!;
        public string? EmailSend { get; set; }
        public string Subject { get; set; } = default!;
        public DateTime DateSend { get; set; }
        public DateTime CreatedDate { get; set; } = DateTime.Now;
        public int UserId { get; set; }
        public OperationStatus? Status { get; set; }
    }
    public class GetContentOperationResponse
    {
        public int? Id { get; set; }
        public string? Subject { get; set; }
        public string? EmailSend { get; set; }
        public string? Content { get; set; }
        public DateTime? DateSend { get; set; }
    }
}
