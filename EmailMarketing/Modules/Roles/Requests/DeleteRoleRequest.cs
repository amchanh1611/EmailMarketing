using EmailMarketing.Persistences.Repositories;
using FluentValidation;

namespace EmailMarketing.Modules.Roles.Requests
{
    public class DeleteRoleRequest
    {
        public List<int>? RoleIds { get; set; }
    }
    public class DeleteRoleValidator : AbstractValidator<DeleteRoleRequest>
    {
        public DeleteRoleValidator(IRepositoryWrapper repository)
        {
            RuleFor(x => x.RoleIds).Must((_, roleIds) =>
            {
                return repository.Role.FindByCondition(x => roleIds!.Contains(x.Id)).Count() == roleIds!.Count();
            }).WithMessage("{PropertyName} does not exist in system");
        }
    }
}
