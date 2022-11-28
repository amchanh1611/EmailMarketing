using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Persistences.Repositories;
using FluentValidation;
using BC = BCrypt.Net.BCrypt;
using System.Security.Claims;

namespace EmailMarketing.Modules.Users.Requests
{
    public class CreateOrUpdateUserRequest
    {
        public string? Email { get; set; }
        public string? Name { get; set; }
        public string? Password { get; set; }
        public string? Phone { get; set; }
        public Male? Male { get; set; }
        public int? RoleId { get; set; }
    }

    public class CreateUserRequest : CreateOrUpdateUserRequest
    {
    }

    public class UpdateUser
    {
        public UserStatus? Status { get; set; }
        public string? Email { get; set; }
        public int? RoleId { get; set; }
    }
    public class UpdateUserName
    {
        public string? Name { get; set; }
    }
    public class UpdateUserPassword
    {
        public string? OldPassword { get; set; }
        public string? NewPassword { get; set; }
    }
    public class UpdateUserAvatar
    {
        public IFormFile? File { get; set; }
    }
    public class CreateOrUpdateUserRequestValidator : AbstractValidator<CreateOrUpdateUserRequest>
    {
        public CreateOrUpdateUserRequestValidator(IRepositoryWrapper repository)
        {
            RuleFor(user => user.Email).NotEmpty().WithMessage("{PropertyName} is required")
                .EmailAddress().WithMessage("{PropertyName} is not valid")
                .Must((_, email) =>
                {
                    return !repository.User.FindByCondition(x => x.Email == email).Any();
                }).WithMessage("{PropertyName} already exists");

            RuleFor(user => user.Name).NotEmpty().WithMessage("{PropertyName} is required");
            RuleFor(user => user.Password).NotEmpty().WithMessage("{PropertyName} is required")
                .MinimumLength(8).WithMessage("{PropertyName} is at least 8 charracter")
                .Matches("[A-Z]").WithMessage("{PropertyName} must contain at least one uppercase letter.")
                .Matches("[a-z]").WithMessage("{PropertyName} must contain at least one lowercase letter.")
                .Matches("[0-9]").WithMessage("{PropertyName} must contain at least one number.")
                .Matches(@"[""!@$%^&*(){}:;<>,.?/+\-_=|'[\]~\\]").WithMessage("{PropertyName} must contain at least one special character");
            RuleFor(user => user.RoleId).NotEmpty()
                .NotEqual(0)
                .WithMessage("{PropertyName} is required")
                .Must((_, RoleId) => { return repository.Role.FindByCondition(x => x.Id == RoleId).Count() != 0; })
                .WithMessage("{PropertyName} does not exist");
        }
    }

    public class CreateUserRequestValidator : AbstractValidator<CreateUserRequest>
    {
        public CreateUserRequestValidator(IRepositoryWrapper repository)
        {
            RuleFor(user => user).SetValidator(new CreateOrUpdateUserRequestValidator(repository));
        }
    }

    public class UpdateUserValidator : AbstractValidator<UpdateUser>
    {
        public UpdateUserValidator(IRepositoryWrapper repository, IHttpContextAccessor httpContextAccessor)
        {
            RuleFor(user => user.Status).IsInEnum().WithMessage("{PropertyName} doest not exists");
            RuleFor(user => user.Email).NotEmpty().WithMessage("{PropertyName} is required")
              .EmailAddress().WithMessage("{PropertyName} is not valid")
              .Must((_, email) =>
              {
                  int userId = int.Parse(httpContextAccessor.HttpContext!.GetRouteValue("userId")!.ToString()!);
                  return !repository.User.FindByCondition(x =>
                  x.Email == email.Trim()
                  &&
                  x.Id != userId)
                  .Any();
              }).WithMessage("{PropertyName} already exists");
            RuleFor(user => user.RoleId).NotNull().NotEqual(0).WithMessage("{PropertyName} is required")
                .Must((_, roleId) =>
                {
                    return repository.Role.FindByCondition(x => x.Id == roleId).Any();
                });
        }
    }
    public class UpdateUserNameValidator : AbstractValidator<UpdateUserName>
    {
        public UpdateUserNameValidator()
        {
            RuleFor(user => user.Name).NotEmpty().WithMessage("{PropertyName} is required");
        }
    }
    public class UpdateUserPasswordValidator : AbstractValidator<UpdateUserPassword>
    {
        public UpdateUserPasswordValidator(IRepositoryWrapper repository, IHttpContextAccessor httpContextAccessor)
        {
            RuleFor(user => user.OldPassword).NotEmpty().WithMessage("{PropertyName} is required")
                .Must((_,oldPassword)=>
                {
                    Claim? claim = httpContextAccessor.HttpContext!.User.FindFirst(ClaimTypes.NameIdentifier);
                    User? user = repository.User.FindByCondition(x => x.Id == (int.Parse(claim!.Value))).FirstOrDefault();
                    return BC.Verify(oldPassword, user!.Password);
                }).WithMessage("Incorrect {PropertyName}");
            RuleFor(user => user.NewPassword).NotEmpty().WithMessage("{PropertyName} is required")
              .MinimumLength(8).WithMessage("{PropertyName} is at least 8 charracter")
              .Matches("[A-Z]").WithMessage("{PropertyName} must contain at least one uppercase letter.")
              .Matches("[a-z]").WithMessage("{PropertyName} must contain at least one lowercase letter.")
              .Matches("[0-9]").WithMessage("{PropertyName} must contain at least one number.")
              .Matches(@"[""!@$%^&*(){}:;<>,.?/+\-_=|'[\]~\\]").WithMessage("{PropertyName} must contain at least one special character");
        }
    }
    public class UpdateUserAvatarValidator : AbstractValidator<UpdateUserAvatar>
    {
        public UpdateUserAvatarValidator()
        {
            RuleFor(user=>user.File).NotEmpty().WithMessage("{PropertyName} is required");
        }
    }
}