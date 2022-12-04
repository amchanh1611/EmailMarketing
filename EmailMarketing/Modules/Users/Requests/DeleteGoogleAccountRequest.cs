using EmailMarketing.Persistences.Repositories;
using FluentValidation;
using System.Security.Claims;

namespace EmailMarketing.Modules.Users.Requests
{
    public class DeleteGoogleAccountRequest
    {
        public List<int>? GoogleAccountId { get; set; }
    }
    public class DeleteGoogleAccountValidator : AbstractValidator<DeleteGoogleAccountRequest>
    {
        public DeleteGoogleAccountValidator(IRepositoryWrapper repository,IHttpContextAccessor httpContextAccessor)
        {
            RuleFor(x => x.GoogleAccountId).NotNull().WithMessage("{PropertyName} is required")
                .Must((_, googleIds) =>
                {
                    Claim? claim = httpContextAccessor.HttpContext!.User.FindFirst(ClaimTypes.NameIdentifier);
                    int userId = int.Parse(claim!.Value);
                    return repository.GoogleAccount.FindByCondition(x => googleIds!.Contains(x.Id) && x.UserId == userId).Count() == googleIds!.Count();
                }).WithMessage("GoogleAccount does not exist in system");
        }
    }
}
