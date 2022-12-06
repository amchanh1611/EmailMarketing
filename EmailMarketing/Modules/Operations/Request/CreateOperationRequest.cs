using EmailMarketing.Modules.Contacts.Entities;
using EmailMarketing.Modules.Operations.Entities;
using EmailMarketing.Modules.Projects.Enities;
using EmailMarketing.Persistences.Repositories;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
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
    public class CreateOperationDetailRequest
    {
        public int OperationId { get; set; }
        public int ContactId { get; set; }
        public OperationStatus Status { get; set; }
        public string StatusMessage { get; set; } = default!;
    }
    public class ReadLoadSendMailRequest
    {

    }
    public class ReadLoadSendMailValidator : AbstractValidator<ReadLoadSendMailRequest>
    {
        public ReadLoadSendMailValidator(IRepositoryWrapper repository, IHttpContextAccessor httpContextAccessor)
        {
            RuleFor(x => x).Must((_, request) =>
            {
                int operationId = int.Parse(httpContextAccessor.HttpContext!.GetRouteValue("operationId")!.ToString()!);
                Operation? operation = repository.Operation.FindByCondition(z => z.Id == operationId).FirstOrDefault();
                Project ? project = repository.Project.FindByCondition(z => z.Id == operation!.ProjectId).Include(x => x.ServicePackage).FirstOrDefault();
                List<OperationDetail> operationDetails = repository.OperationDetail
                .FindByCondition(x => x.OperationId == operationId && (x.Status == OperationStatus.Fail || x.Status == OperationStatus.Processing))
                .ToList();

                return operationDetails.Count() <= (project!.ServicePackage.Quantity - project.Used);
            }).WithMessage("The number of service packages allowed has been exceeded");
        }
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
            RuleFor(x => x).Must((_, request) =>
            {
                GroupContact? group = repository.GroupContact.FindByCondition(z => z.Id == request.GroupContactId).Include(x=>x.Contacts).FirstOrDefault(); 
                Project? project = repository.Project.FindByCondition(z => z.Id == request.ProjectId).Include(x=>x.ServicePackage).FirstOrDefault();
                return group!.Contacts.Count() <= (project!.ServicePackage.Quantity - project.Used);
            }).WithMessage("The number of service packages allowed has been exceeded");
            RuleFor(x => x.Name).NotEmpty().WithMessage("{PropertyName} is required");
            RuleFor(x => x.Subject).NotEmpty().WithMessage("{PropertyName} is required");
            RuleFor(x => x.Content).NotEmpty().WithMessage("{PropertyName} is required");
        }
    }
}
