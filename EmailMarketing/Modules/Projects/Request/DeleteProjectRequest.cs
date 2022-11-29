using EmailMarketing.Modules.Projects.Enities;
using EmailMarketing.Persistences.Repositories;
using FluentValidation;

namespace EmailMarketing.Modules.Projects.Request
{
    public class DeleteProjectRequest
    {
    }
    public class DeleteProjectValidator : AbstractValidator<DeleteProjectRequest>
    { 
        public DeleteProjectValidator(IRepositoryWrapper repository, IHttpContextAccessor httpContextAccessor)
        {
            RuleFor(x => x).Must((_, requset) =>
            {
                int projectId = int.Parse(httpContextAccessor.HttpContext!.GetRouteValue("projectId")!.ToString()!);
                return !repository.Project.FindByCondition(x => x.Id == projectId && (x.DateStart <= DateTime.Now||x.DateEnd>=DateTime.Now)).Any();
            }).WithMessage("The project has started");
        }
    }
}
