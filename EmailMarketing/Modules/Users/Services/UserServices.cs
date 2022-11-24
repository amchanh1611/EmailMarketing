using AutoMapper;
using EmailMarketing.Common.JWT;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Requests;
using EmailMarketing.Persistences.Repositories;
using Microsoft.EntityFrameworkCore;
using ProjectExample.Common.Extentions;
using ProjectExample.Persistence.PaggingBase;
using ProjectExample.Persistence.SearchBase;
using ProjectExample.Persistence.Sort;
using BC = BCrypt.Net.BCrypt;

namespace EmailMarketing.Modules.Users.Services
{
    public interface IUserServices
    {
        PaggingResponse<User> Get(GetUserRequest request);

        void Create(CreateUserRequest request);

        void Delete(int userId);

        void UpdateStatus(int userId, UpdateUserStatus request);

        void UpdateEmail(int userId, UpdateUserEmail request);

        User GetDetail(int userId,HttpContext context);

        string Login(string email, string password);

        void UpdateName(int userId, UpdateUserName name);

        bool UpdatePassword(int userId, UpdateUserPassword user);

        Task UpdateAvatarAsync(int userId, UpdateUserAvatar file);
    }

    public class UserServices : IUserServices
    {
        private readonly IMapper mapper;
        private readonly IRepositoryWrapper repository;
        private readonly IJwtUtils jwt;

        public UserServices(IRepositoryWrapper repository, IMapper mapper, IJwtUtils jwt)
        {
            this.repository = repository;
            this.mapper = mapper;
            this.jwt = jwt;
        }

        public void Create(CreateUserRequest request)
        {
            User user = mapper.Map<CreateUserRequest, User>(request);
            repository.User.Create(user);
            repository.Save();
        }

        public void Delete(int userId)
        {
            User user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault()!;
            repository.User.Delete(user!);
            repository.Save();
        }

        public PaggingResponse<User> Get(GetUserRequest request)
        {
            IQueryable<User> userQuery = repository.User.FindAll().Include(x => x.Role).ThenInclude(x=>x.RolePermissions);

            return userQuery.ApplySearch(request.InfoSearch!).ApplySort(request.Orderby!).ApplyPaging(request.Current, request.PageSize);
        }

        public User GetDetail(int userId,HttpContext context)
        {
            User user = repository.User.FindByCondition(x => x.Id == userId).Include(x => x.Role).ThenInclude(x=>x.RolePermissions).FirstOrDefault()!;
            user.Avatar = user.Avatar!.DownloadFile(context);
            return user;
        }

        public string Login(string email, string password)
        {
            User user = repository.User.FindByCondition(x => x.Email == email).FirstOrDefault()!;

            if (user is null || !BC.Verify(password, user.Password))
                return null!
                    ;
            return jwt.GenerateJwtToken(user);
        }

        public async Task UpdateAvatarAsync(int userId, UpdateUserAvatar request)
        {
            User user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault()!;

            user.Avatar = await request.File!.UploadFilesAsync("Avatars");
            
            repository.User.Update(user);
            repository.Save();
        }

        public void UpdateEmail(int userId, UpdateUserEmail request)
        {
            User user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault()!;
            User userUpdate = mapper.Map<UpdateUserEmail, User>(request, user);
            repository.User.Update(userUpdate);
            repository.Save();
        }

        public void UpdateName(int userId, UpdateUserName request)
        {
            User user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault()!;
            User userUpdate = mapper.Map<UpdateUserName, User>(request, user!);
            repository.User.Update(userUpdate);
            repository.Save();
        }

        public bool UpdatePassword(int userId, UpdateUserPassword request)
        {
            User user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault()!;
            if (user is null || !BC.Verify(request.OldPassword, user.Password))
                return false;
            User userUpdate = mapper.Map<UpdateUserPassword, User>(request, user!);
            repository.User.Update(userUpdate);
            repository.Save();
            return true;
        }

        public void UpdateStatus(int userId, UpdateUserStatus request)
        {
            User user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault()!;
            User userUpdate = mapper.Map<UpdateUserStatus, User>(request, user!);
            repository.User.Update(userUpdate);
            repository.Save();
        }
    }
}