using AutoMapper;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Requests;
using EmailMarketing.Modules.Users.Response;
using EmailMarketing.Persistences.Repositories;
using ProjectExample.Persistence.PaggingBase;
using ProjectExample.Persistence.SearchBase;
using ProjectExample.Persistence.Sort;

namespace EmailMarketing.Modules.Users.Services
{
    public interface IUserServices
    {
        PaggingResponse<UserGetResponse> Get(GetUserRequest request);

        void Create(CreateUserRequest request);

        void Delete(int userId);

        void Update(int userId, UpdateUserRequest request);

        UserGetDetailResponse GetDetail(int userId);
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
            repository.User.Delete(user);
            repository.Save();
        }

        public PaggingResponse<UserGetResponse> Get(GetUserRequest request)
        {
            IQueryable<User> userQuery = repository.User.FindAll();

            userQuery = SearchingBase<User>.ApplySearch(userQuery, request.InfoSearch);

            userQuery = SortingBase<User>.ApplySort(userQuery, request.Orderby);

            PaggingResponse<User> user = PaggingBase<User>.ApplyPaging(userQuery, request.Current, request.PageSize);

            List<UserGetResponse> response = mapper.Map<List<User>, List<UserGetResponse>>(user.Data);

            return new PaggingResponse<UserGetResponse>(response, user.PageInfo);
        }

        public UserGetDetailResponse GetDetail(int userId)
        {
            User user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault();
            return mapper.Map<User, UserGetDetailResponse>(user);
        }

        public void Update(int userId, UpdateUserRequest request)
        {
            User user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault();
            User userUpdate = mapper.Map<UpdateUserRequest, User>(request,user);
            repository.User.Update(userUpdate);
            repository.Save();
        }
    }
}