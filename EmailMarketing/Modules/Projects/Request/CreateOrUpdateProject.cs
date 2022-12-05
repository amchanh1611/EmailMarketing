using EmailMarketing.Modules.Projects.Enities;
using EmailMarketing.Persistences.Repositories;
using FluentValidation;

namespace EmailMarketing.Modules.Projects.Request
{
    public class CreateOrUpdateProject
    {
        public string? Name { get; set; }
        public int? ServicePackageId { get; set; }
        public DateTime? DateStart { get; set; } = DateTime.Now;
        public DateTime? DateEnd { get; set; }
        public ProjectStatus? Status { get; set; } = ProjectStatus.Lock;
    }
    public class CreateProjectRequest : CreateOrUpdateProject
    {
        public int? OwnerId { get; set; }
        public string? CodeContract { get; set; }
    }
    public class UpdateProjectRequest : CreateOrUpdateProject { }
    public class CreateOrUpdateProjectValidator : AbstractValidator<CreateOrUpdateProject>
    {
        public CreateOrUpdateProjectValidator(IRepositoryWrapper repository)
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("{PropertyName} is required");

            RuleFor(x => x.ServicePackageId).NotNull().NotEqual(0).WithMessage("{PropertyName} is required")
                .Must((_, packageId) =>
                {
                    return repository.ServicePackage.FindByCondition(x => x.Id == packageId).Any();
                }).WithMessage("{PropertyName} does not exists in system");
            RuleFor(x => x.DateStart).NotNull().WithMessage("{PropertyName} is required");
            RuleFor(x => x.DateEnd).NotNull().WithMessage("{PropertyName} is required")
                .GreaterThan(x => x.DateStart).WithMessage("{PropertyName} greater than {ComparisonProperty}");
            RuleFor(x => x.Status).NotNull().WithMessage("{PropertyName} is required")
                .IsInEnum().WithMessage("Invalid {PropertyValue}");
        }
    }
    public class CreateProjectValidator : AbstractValidator<CreateProjectRequest>
    {
        public CreateProjectValidator(IRepositoryWrapper repository)
        {
            RuleFor(x => x).SetValidator(new CreateOrUpdateProjectValidator(repository));
            RuleFor(x => x.OwnerId).NotNull().NotEqual(0).WithMessage("{PropertyName} is required")
                .Must((_, ownerId) =>
                {
                    return repository.User.FindByCondition(x => x.Id == ownerId).Any();
                }).WithMessage("{PropertyName} does not exists in system");
            RuleFor(x => x.CodeContract).NotEmpty().WithMessage("{PropertyName} is required")
                .Must((_, codeContract) =>
                {
                    return !(repository.Project.FindByCondition(x => x.CodeContract == codeContract!.Trim()).Any());
                }).WithMessage("{PropertyName} already exists");

        }
    }
    public class UpdateProjectValidator : AbstractValidator<UpdateProjectRequest>
    {
        public UpdateProjectValidator(IRepositoryWrapper repository,IHttpContextAccessor httpContextAccessor)
        {
            RuleFor(x => x).SetValidator(new CreateOrUpdateProjectValidator(repository));
        }
    }
}
