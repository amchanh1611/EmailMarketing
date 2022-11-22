using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Persistences.Repositories;
using FluentValidation;

namespace EmailMarketing.Modules.Users.Requests
{
    public class CreateOrUpdateUserRequest
    {
        public string? Email { get; set; }
        public string? Name { get; set; }
        public string? Password { get; set; }
        public int? RoleId { get; set; }
    }

    public class CreateUserRequest : CreateOrUpdateUserRequest
    {
    }

    public class UpdateUserRequest : CreateOrUpdateUserRequest
    {
        public Status? Status { get; set; }
    }

    public class CreateOrUpdateUserRequestValidator : AbstractValidator<CreateOrUpdateUserRequest>
    {
        public CreateOrUpdateUserRequestValidator(IRepositoryWrapper repository)
        {
            RuleFor(user => user.Email).NotEmpty().WithMessage("{PropertyName} is required")
                .EmailAddress().WithMessage("{PropertyName} is not valid")
                .Must((_, email) =>
                {
                    return repository.User.FindByCondition(x => x.Email == email).Count() == 0;
                }).WithMessage("{PropertyName} already exists");

            RuleFor(user => user.Name).NotEmpty().WithMessage("{PropertyName} is required");
            RuleFor(user => user.Password).NotEmpty().WithMessage("{PropertyName} is required")
                .MinimumLength(8).WithMessage("{PropertyName} is at least 8 charracter")
                .Matches("[A-Z]").WithMessage("{PropertyName} must contain at least one uppercase letter.")
                .Matches("[a-z]").WithMessage("{PropertyName} must contain at least one lowercase letter.")
                .Matches("[0-9]").WithMessage("{PropertyName} must contain at least one number.")
                .Matches(@"[""!@$%^&*(){}:;<>,.?/+\-_=|'[\]~\\]").WithMessage("{PropertyName} must contain at least one special character");
            RuleFor(user => user.RoleId).NotEmpty().WithMessage("{PropertyName} is required");
        }
    }

    public class CreateUserRequestValidator : AbstractValidator<CreateUserRequest>
    {
        public CreateUserRequestValidator(IRepositoryWrapper repository)
        {
            RuleFor(user => user).SetValidator(new CreateOrUpdateUserRequestValidator(repository));
        }
    }

    public class UpdateUserRequestValidator : AbstractValidator<UpdateUserRequest>
    {
        public UpdateUserRequestValidator(IRepositoryWrapper repository)
        {
            RuleFor(user => user).SetValidator(new CreateOrUpdateUserRequestValidator(repository));
        }
    }
}