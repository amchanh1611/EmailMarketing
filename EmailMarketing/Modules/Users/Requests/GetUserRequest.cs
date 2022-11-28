using EmailMarketing.Common;

namespace EmailMarketing.Modules.Users.Requests
{
    public class GetUserRequest : GetRequestBase
    {
        public string? Fillter { get; set; }
    }
}
