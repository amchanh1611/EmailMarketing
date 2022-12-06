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
        Project Create(CreateProjectRequest request);
        void Update(int projectId,UpdateProjectRequest request);
        void UpdateUsed(int projectId);
        void UpdateUsedDaily(int projectId);
        void Delete(int projectId, DeleteProjectRequest request);
        PaggingResponse<Project> Get(GetProjectRequest request);
        PaggingResponse<Project> GetByUser(int userId, GetProjectRequest request);
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

        public Project Create(CreateProjectRequest request)
        {
            Project entity = mapper.Map<CreateProjectRequest, Project>(request);
            repository.Project.Create(entity);
            repository.Save();
            return entity;
        }

        public void Delete(int projectId, DeleteProjectRequest request)
        {
            Project? project = repository.Project.FindByCondition(x => x.Id == projectId).FirstOrDefault();
            repository.Project.Delete(project!);
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

        public PaggingResponse<Project> GetByUser(int userId, GetProjectRequest request)
        {
            return repository.Project.FindByCondition(x=>x.OwnerId==userId)
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

        public void UpdateUsed(int projectId)
        {
            Project? project = repository.Project.FindByCondition(x => x.Id == projectId).FirstOrDefault();
            project!.Used += 1;
            repository.Save();
        }

        public void UpdateUsedDaily(int projectId)
        {
            Project? project = repository.Project.FindByCondition(x => x.Id == projectId).FirstOrDefault();
            project!.Used = 0;
            repository.Save();
        }
    }
}
