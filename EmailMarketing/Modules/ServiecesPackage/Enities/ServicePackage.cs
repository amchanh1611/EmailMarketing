using EmailMarketing.Modules.Projects.Enities;

namespace EmailMarketing.Modules.ServiecesPackage.Enities
{
    public class ServicePackage
    {
        public int Id { get; set; }
        public string Name { get; set; } = default!;
        public int Quantity { get; set; }
        public ICollection<Project> Projects { get; set; } = default!;
    }
}
