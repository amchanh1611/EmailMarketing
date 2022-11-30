using EmailMarketing.Modules.Contacts.Entities;
using EmailMarketing.Persistences.Repositories;
using FluentValidation;

namespace EmailMarketing.Modules.Contacts.Request
{
    public class CreateOrUpdateContact
    {
        public string? Name { get; set; }
        public string? Email { get; set; }
        public ContactMale? Male { get; set; }
        public int? GroupContactId { get; set; }
    }
    public class CreateContactByExcelRequest
    {
        public IFormFile? File { get; set; }
        public int? GroupContactId { get; set; } 
    }
    public class CreateContactRequest : CreateOrUpdateContact { }
    public class UpdateContactRequest : CreateOrUpdateContact { }
    public class CreateOrUpdateContactValidator : AbstractValidator<CreateOrUpdateContact>
    {
        public CreateOrUpdateContactValidator(IRepositoryWrapper repository)
        {
            RuleFor(x => x.Name).NotEmpty().WithMessage("{PropertyName} is required");
            RuleFor(x => x.Email).NotEmpty().WithMessage("{PropertyName} is required")
                .Must((_, email) => { return !repository.Contact.FindByCondition(x => x.Email == email!.Trim()).Any(); })
                .WithMessage("{PropertyValue} already exist");
            RuleFor(x => x.GroupContactId).Must((_, groupContactId) =>
              {
                  return repository.GroupContact.FindByCondition(x => x.Id == groupContactId).Any();
              }).When(x => x.GroupContactId != null).WithMessage("{PropertyName} doest not exist in system");
        }
    }
    public class CreateContactValidator:AbstractValidator<CreateContactRequest>
    {
        public CreateContactValidator(IRepositoryWrapper repository)
        {
            RuleFor(x => x).SetValidator(new CreateOrUpdateContactValidator(repository));
        }
    } 
    public class UpdateContactValidator : AbstractValidator<UpdateContactRequest>
    {
        public UpdateContactValidator(IRepositoryWrapper repository)
        {
            RuleFor(x => x).SetValidator(new CreateOrUpdateContactValidator(repository));
        }
    }
}
