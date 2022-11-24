using EmailMarketing.Modules.Roles.Entities;

namespace EmailMarketing.Modules.Roles.Requests
{
    public class CreatePermissionRequest
    {
        public string? Code { get; set; }
        public string? Name { get; set; }
        public List<UserType>? UserType { get; set; }
    }
}