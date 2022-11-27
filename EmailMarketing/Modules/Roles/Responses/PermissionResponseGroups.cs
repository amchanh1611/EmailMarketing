namespace EmailMarketing.Modules.Roles.Responses
{
    public class PermissionResponse
    {
        public string? Modules { get; set; }
        public List<Permissions>? Permissions { get; set; }

    }
    public class Permissions
    {
        public string Code { get; set; } = default!;
        public string Name { set; get; } = default!;
    }
}
