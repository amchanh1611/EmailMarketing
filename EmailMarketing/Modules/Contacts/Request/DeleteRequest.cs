using EmailMarketing.Persistences.Repositories;
using FluentValidation;

namespace EmailMarketing.Modules.Contacts.Request
{
    public class DeleteRequest
    {
        public List<int>? ids { get; set; }
    }
    public class DeleteGroupContactRequest : DeleteRequest { }
    public class DeleteContactRequest : DeleteRequest { }
    public class DeleteGroupContactValidator : AbstractValidator<DeleteGroupContactRequest>
    {
        public DeleteGroupContactValidator(IRepositoryWrapper repository)
        {
            RuleFor(x => x.ids).Must((_, ids) =>
            {
                return repository.GroupContact.FindByCondition(x => ids!.Contains(x.Id)).Count() == ids!.Count();
            }).WithMessage("{PropertyName} does not exist in system");
        }
    }
    public class DeleteContactValidator<T> : AbstractValidator<DeleteContactRequest>
    {
        public DeleteContactValidator(IRepositoryWrapper repository)
        {
            RuleFor(x => x.ids).Must((_, ids) =>
            {
                return repository.Contact.FindByCondition(x => ids!.Contains(x.Id)).Count() == ids!.Count();
            }).WithMessage("{PropertyName} does not exist in system");
        }
    }
}
