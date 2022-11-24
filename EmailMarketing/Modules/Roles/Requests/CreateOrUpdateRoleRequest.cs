using EmailMarketing.Modules.Roles.Entities;
using EmailMarketing.Persistences.Repositories;
using FluentValidation;

namespace EmailMarketing.Modules.Roles.Requests
{
    public class CreateOrUpdateRoleRequest
    {
        public string? Name { get; set; }
        public UserType? UserType { get; set; }
        public List<string>? PermissionCode { get; set; }
    }

    public class CreateRoleRequest : CreateOrUpdateRoleRequest
    {
    }

    public class CreateOrUpdateRoleRequestValidator : AbstractValidator<CreateOrUpdateRoleRequest>
    {
        public CreateOrUpdateRoleRequestValidator(IRepositoryWrapper repository)
        {
            RuleFor(role => role.Name).NotEmpty().WithMessage("{PropertyName} is required")
                .Must((_, name) => { return repository.Role.FindByCondition(x => x.Name == name!.Trim(' ')).Count()==0; })
                .WithMessage("Role {PropertyName} already exists in system");
            RuleFor(role => role.UserType).NotEmpty()
                .IsInEnum()
                .WithMessage("{PropertyName} is required");
            RuleFor(role => role.PermissionCode).NotNull().WithMessage("{PropertyName} is required")
                .Must((_, perCode) =>
                {
                    foreach (string code in perCode!)
                    {
                        if ((repository.Permission.FindByCondition(x => x.Code == code.Trim(' ')).Count() != 0) is false)
                            return false;
                    }
                    return true;
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
}