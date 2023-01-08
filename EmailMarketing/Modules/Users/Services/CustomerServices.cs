using AutoMapper;
using EmailMarketing.Common.Pagination;
using EmailMarketing.Middleware;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Requests;
using EmailMarketing.Persistences.Repositories;

namespace EmailMarketing.Modules.Users.Services
{
    public interface ICustomerServices
    {
        void Create(CreateCustomerRequest request);
        void Update(int userId, UpdateCustomerRequest request);

    }
    public class CustomerServices : ICustomerServices
    {
        private readonly IMapper mapper;
        private readonly IRepositoryWrapper repository;
        public CustomerServices(IMapper mapper, IRepositoryWrapper repository)
        {
            this.mapper = mapper;
            this.repository = repository;
        }

        public void Create(CreateCustomerRequest request)
        {
            User customer = mapper.Map<CreateCustomerRequest, User>(request);
            customer.RoleId = 3;
            repository.User.Create(customer);
            repository.Save();
        }

        public void Update(int userId, UpdateCustomerRequest request)
        {
            User? user = repository.User.FindByCondition(x => x.Id == userId && x.RoleId == 3).FirstOrDefault();

            if (user is null)
                throw new BadRequestException("Customer does not in system");

            repository.User.Update(mapper.Map(request, user!));
            repository.Save();
        }
    }
}
