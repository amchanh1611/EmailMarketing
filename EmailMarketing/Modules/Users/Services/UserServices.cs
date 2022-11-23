using AutoMapper;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Requests;
using EmailMarketing.Persistences.Repositories;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using ProjectExample.Persistence.PaggingBase;
using ProjectExample.Persistence.SearchBase;
using ProjectExample.Persistence.Sort;

namespace EmailMarketing.Modules.Users.Services
{
    public interface IUserServices
    {
        PaggingResponse<User> Get(GetUserRequest request);

        void Create(CreateUserRequest request);

        void Delete(int userId);

        void UpdateStatus(int userId, UpdateUserStatus request);
        void UpdateEmail(int userId, UpdateUserEmail request);

        User GetDetail(int userId);
    }

    public class UserServices : IUserServices
    {
        private readonly IMapper mapper;
        private readonly IRepositoryWrapper repository;

        public UserServices(IRepositoryWrapper repository, IMapper mapper)
        {
            this.repository = repository;
            this.mapper = mapper;
        }

        public void Create(CreateUserRequest request)
        {
            User user = mapper.Map<CreateUserRequest, User>(request);
            repository.User.Create(user);
            repository.Save();
        }

        public void Delete(int userId)
        {
            User user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault();
            repository.User.Delete(user!);
            repository.Save();
        }

        public PaggingResponse<User> Get(GetUserRequest request)
        {

            IQueryable<User> userQuery = repository.User.FindAll().Include(x=>x.Role);

            userQuery = SearchingBase<User>.ApplySearch(userQuery, request.InfoSearch);

            userQuery = SortingBase<User>.ApplySort(userQuery, request.Orderby);

            return PaggingBase<User>.ApplyPaging(userQuery, request.Current, request.PageSize);
        }

        public User GetDetail(int userId)
        {
            return repository.User.FindByCondition(x => x.Id == userId).Include(x=>x.Role).FirstOrDefault();
            
        }

        public void UpdateEmail(int userId, UpdateUserEmail request)
        {
            User user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault();
            User userUpdate = mapper.Map<UpdateUserEmail, User>(request,user);
            repository.User.Update(userUpdate);
            repository.Save();
        }

        public void UpdateStatus(int userId, UpdateUserStatus request)
        {
            User user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault();
            User userUpdate = mapper.Map<UpdateUserStatus, User>(request, user!);
            repository.User.Update(userUpdate);
            repository.Save();
        }
    }
}