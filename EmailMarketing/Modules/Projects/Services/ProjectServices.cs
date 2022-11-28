using AutoMapper;
using EmailMarketing.Common.Pagination;
using EmailMarketing.Common.Search;
using EmailMarketing.Common.Sort;
using EmailMarketing.Middleware;
using EmailMarketing.Modules.Projects.Enities;
using EmailMarketing.Modules.Projects.Request;
using EmailMarketing.Persistences.Repositories;
using Microsoft.EntityFrameworkCore;

namespace EmailMarketing.Modules.Projects.Services
{
    public interface IProjectServices
    {
        void Create(CreateProjectRequest request);
        void Update(int projectId,UpdateProjectRequest request);
        void Delete(int projectId);
        PaggingResponse<Project> Get(GetProjectRequest request);

    }
    public class ProjectServices : IProjectServices
    {
        private readonly IRepositoryWrapper repository;
        private readonly IMapper mapper;
        public ProjectServices(IRepositoryWrapper repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }

        public void Create(CreateProjectRequest request)
        {
            repository.Project.Create(mapper.Map<CreateProjectRequest, Project>(request));
            repository.Save();
        }

        public void Delete(int projectId)
        {
            Project? project = repository.Project.FindByCondition(x => x.Id == projectId).FirstOrDefault();
            repository.Project.Delete(project);
            repository.Save();
        }

        public PaggingResponse<Project> Get(GetProjectRequest request)
        {
            return repository.Project.FindAll()
                .Include(x => x.User)
                .Include(x => x.ServicePackage)
                .ApplySearch(request.InfoSearch!)
                .ApplySort(request.Orderby)
                .ApplyPagging(request.Current, request.PageSize);
        }

        public void Update(int projectId, UpdateProjectRequest request)
        {
            Project? project = repository.Project.FindByCondition(x => x.Id == projectId).FirstOrDefault();
            if(project is null)
                throw new BadRequestException("User does not exists in system");
            repository.Project.Update(mapper.Map(request, project!));
            repository.Save();
        }
    }
}
