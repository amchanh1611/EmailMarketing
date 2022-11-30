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
            int projectId = int.Parse(httpContextAccessor.HttpContext!.GetRouteValue("projectId")!.ToString()!);
            Project? project = repository.Project.FindByCondition(x => x.Id == projectId).FirstOrDefault();
            RuleFor(x => x).Must((_, requset) =>
            {
                return project != null;
            }).WithMessage("User does not exist in system");
            RuleFor(x => x).Must((_, requset) => { return project.DateStart < DateTime.Now; }).WithMessage("The project has started");
        }
    }
}
