using EmailMarketing.Modules.ServiecesPackage.Enities;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Operations.Entities;
namespace EmailMarketing.Modules.Projects.Enities
{
    public class Project
    {
        public int Id { get; set; }
        public string Name { get; set; } = default!;
        public int OwnerId { get; set; }
        public string CodeContract { get; set; } = default!;
        public int ServicePackageId { get; set; }
        public int Used { get; set; } = default!;
        public DateTime CreatedDate { get; set; } = DateTime.Now;
        public DateTime DateStart { get; set; }
        public DateTime DateEnd { get; set; }
        public ProjectStatus Status { get; set; } = ProjectStatus.Lock;
        public User User { get; set; } = default!;
        public ServicePackage ServicePackage { get; set; } = default!;
        public ICollection<Operation> Operations { get; set; } = default!;
    }

    public enum ProjectStatus
    {
        Active = 1,
        Lock
    }
}