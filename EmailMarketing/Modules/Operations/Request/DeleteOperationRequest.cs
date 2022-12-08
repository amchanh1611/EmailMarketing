using EmailMarketing.Persistences.Repositories;
using FluentValidation;

namespace EmailMarketing.Modules.Operations.Request
{
    public class DeleteOperationRequest
    {
        public List<int>? OperationIds { get; set; }
    }
    public class DeleteOperationValidator : AbstractValidator<DeleteOperationRequest>
    {
        public DeleteOperationValidator(IRepositoryWrapper repository)
        {
            RuleFor(x => x.OperationIds).NotNull().WithMessage("{PropertyName} is required")
                .Must((_, operationIds) =>
                {
                    return repository.Operation.FindByCondition(x => operationIds!.Contains(x.Id)).Count() == operationIds!.Count();
                }).WithMessage("Operation does not exist");
        }
    }
}
