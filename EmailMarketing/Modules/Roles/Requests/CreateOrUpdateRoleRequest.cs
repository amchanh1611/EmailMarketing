﻿using EmailMarketing.Modules.Roles.Entities;
using FluentValidation;

namespace EmailMarketing.Modules.Roles.Requests
{
    public class CreateOrUpdateRoleRequest
    {
        public string? Name { get; set; }
        public UserType? UserType { get; set; }
    }
    public class CreateRoleRequest : CreateOrUpdateRoleRequest
    {
    }
    public class CreateOrUpdateRoleRequestValidator : AbstractValidator<CreateOrUpdateRoleRequest>
    {
        public CreateOrUpdateRoleRequestValidator()
        {
            RuleFor(role=>role.Name).NotEmpty().WithMessage("{PropertyName} is required");
            RuleFor(role => role.UserType).NotEmpty()
                .IsInEnum()
                .WithMessage("{PropertyName} is required");
        }
    }
    public class CreateRoleRequestValidator : AbstractValidator<CreateRoleRequest>
    {
        public CreateRoleRequestValidator()
        {
            RuleFor(role => role).SetValidator(new CreateOrUpdateRoleRequestValidator());
        }
    }
}
