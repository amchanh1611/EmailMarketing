using AutoMapper;
using EmailMarketing.Modules.Roles.Entities;
using EmailMarketing.Modules.Roles.Requests;
using EmailMarketing.Persistences.Repositories;

namespace EmailMarketing.Modules.Roles.Services
{
    public interface IRoleServices
    {
        void Create(CreateRoleRequest request);
    }
    public class RoleServices : IRoleServices
    {
        private readonly IRepositoryWrapper repository;
        private readonly IMapper mapper;

        public RoleServices(IRepositoryWrapper repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }

        public void Create(CreateRoleRequest request)
        {
            Role role = mapper.Map<CreateRoleRequest, Role>(request);
            repository.Role.Create(role);
            repository.Save();
        }
    }
}
