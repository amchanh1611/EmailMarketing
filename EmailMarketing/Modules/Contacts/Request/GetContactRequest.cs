using EmailMarketing.Common;
using EmailMarketing.Persistences.Repositories;
using FluentValidation;
using System.Security.Claims;

namespace EmailMarketing.Modules.Contacts.Request
{
    public class GetContactRequest : GetRequestBase
    {
    }
    public class GetContactInGroupRequest : GetRequestBase
    {
    }
    public class GetContactInGroupValidator : AbstractValidator<GetContactInGroupRequest>
    {
        public GetContactInGroupValidator(IRepositoryWrapper repository,IHttpContextAccessor httpContextAccessor)
        {
            RuleFor(x => x).Must((_, request) =>
            {
                Claim? claim = httpContextAccessor.HttpContext!.User.FindFirst(ClaimTypes.NameIdentifier);
                int userId = int.Parse(claim!.Value);
                int groupId = int.Parse(httpContextAccessor.HttpContext!.GetRouteValue("groupId")!.ToString()!);
                return repository.GroupContact.FindByCondition(x => x.Id == groupId && x.UserId == userId).Any();
            }).WithMessage("GroupContact does not exist in system");
        }
    }
}
