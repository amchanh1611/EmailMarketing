using EmailMarketing.Persistences.Repositories;
using FluentValidation;

namespace EmailMarketing.Modules.Contacts.Request
{
    public class CreateOrUpdateGroupContact
    {
        public string? Name { get; set; }
    }
    public class CreateGroupContactRequest : CreateOrUpdateGroupContact { }
    public class UpdateGroupContactRequest : CreateOrUpdateGroupContact { }
    public class CreateOrUpdateGroupContactValidator : AbstractValidator<CreateOrUpdateGroupContact>
    {
        public CreateOrUpdateGroupContactValidator(IRepositoryWrapper repository)
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("{PropertyName} is required")
                .Must((_, name) => { return !repository.GroupContact.FindByCondition(x => x.Name == name!.Trim()).Any(); })
                .WithMessage("{PropertyValue} already exist");
        }
    }
}
