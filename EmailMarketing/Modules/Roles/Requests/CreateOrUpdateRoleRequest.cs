using EmailMarketing.Modules.Roles.Entities;
using EmailMarketing.Persistences.Repositories;
using FluentValidation;

namespace EmailMarketing.Modules.Roles.Requests
{
    public class CreateOrUpdateRoleRequest
    {
        public string? Name { get; set; }
        public UserType? UserType { get; set; }
        public List<string>? PermissionCodes { get; set; }
    }
    public class UpdateRoleRequest : CreateOrUpdateRoleRequest { }

    public class CreateRoleRequest : CreateOrUpdateRoleRequest { }

    public class CreateOrUpdateRoleRequestValidator : AbstractValidator<CreateOrUpdateRoleRequest>
    {
        public CreateOrUpdateRoleRequestValidator(IRepositoryWrapper repository)
        {
            RuleFor(role => role.Name).NotEmpty().WithMessage("{PropertyName} is required");
            RuleFor(role => role.UserType).NotEmpty()
                .IsInEnum()
                .WithMessage("{PropertyName} is required");
            RuleFor(role => role.PermissionCodes).NotNull().WithMessage("{PropertyName} is required")
                .Must((_, perCode) =>
                {
                    return repository.Permission.FindByCondition(x => perCode!.Contains(x.Code)).Count() == (perCode!.Count());
                })
                .WithMessage("Permission does not exists");
        }
    }

    public class CreateRoleRequestValidator : AbstractValidator<CreateRoleRequest>
    {
        public CreateRoleRequestValidator(IRepositoryWrapper repository)
        {
            RuleFor(role => role).SetValidator(new CreateOrUpdateRoleRequestValidator(repository));
        }
    }
    public class UpdateRoleRequestValidator : AbstractValidator<UpdateRoleRequest>
    {
        public UpdateRoleRequestValidator(IRepositoryWrapper repository)
        {
            RuleFor(role => role).SetValidator(new CreateOrUpdateRoleRequestValidator(repository));
        }
    }
}