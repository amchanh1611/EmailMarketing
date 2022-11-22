using EmailMarketing.Modules.Users.Entities;

namespace EmailMarketing.Modules.Users.Response
{
    public class UserGetResponse :UserResponse
    {
        public Status? Status { get; set; }
    }
    public class UserGetDetailResponse : UserResponse
    {

    }
    public class UserResponse
    {
        public int? Id { get; set; }
        public string? Name { get; set; }
        public string? Email { get; set; }
        public int? RoleId { get; set; }
    }
}
