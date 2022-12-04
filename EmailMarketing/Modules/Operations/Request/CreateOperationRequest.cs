using EmailMarketing.Persistences.Repositories;
using FluentValidation;
using System.Security.Claims;

namespace EmailMarketing.Modules.Operations.Request
{
    public class CreateOperationRequest
    {
        //public string? RefreshToken { get; set; }
        public int? ProjectId { get; set; }
        public string? Name { get; set; }
        public int? GoogleAccountId { get; set; }
        public string? Subject { get; set; } 
        public int? GroupContactId { get; set; }
        public string? Content { get; set; } = default!;
        public DateTime? DateSend { get; set; }
    }
    public class CreateOperationValidator : AbstractValidator<CreateOperationRequest>
    {
        public CreateOperationValidator(IRepositoryWrapper repository, IHttpContextAccessor httpContextAccessor)
        {
            Claim? claim = httpContextAccessor.HttpContext!.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            RuleFor(x => x.ProjectId).NotNull().WithMessage("{PropertyName} is required")
                .Must((_, projectId) => { return repository.Project.FindByCondition(x => x.Id == projectId && x.OwnerId == userId).Any(); })
                .WithMessage("Project does not exist in system");
            RuleFor(x => x.GoogleAccountId).NotNull().WithMessage("{PropertyName} is required")
                .Must((_, googleAccountId) => 
                { 
                    return repository.GoogleAccount.FindByCondition(x => x.Id == googleAccountId && x.UserId == userId).Any();
                }).WithMessage("GoogleAccount does not exist in system");
            RuleFor(x => x.GroupContactId).NotNull().WithMessage("{PropertyName} is required")
                .Must((_, groupContactId) => 
                {
                    return repository.GroupContact.FindByCondition(x => x.Id == groupContactId && x.UserId == userId).Any(); 
                }).WithMessage("GroupContact does not exist in system");
            //RuleFor(x=>x.RefreshToken).NotEmpty().WithMessage("{PropertyName} is required")
            //    .Must((_, refreshToken) =>
            //    {
            //        return repository.GoogleAccount.FindByCondition(x => x.RefreshToken == refreshToken && x.UserId == userId).Any();
            //    }).WithMessage("{PropertyName} does not exist in system");
            RuleFor(x => x.Name).NotEmpty().WithMessage("{PropertyName} is required");
            RuleFor(x => x.Subject).NotEmpty().WithMessage("{PropertyName} is required");
            RuleFor(x => x.Content).NotEmpty().WithMessage("{PropertyName} is required");
        }
    }
}
