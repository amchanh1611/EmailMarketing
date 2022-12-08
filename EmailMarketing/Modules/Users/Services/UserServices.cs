using AutoMapper;
using EmailMarketing.Common.Extensions;
using EmailMarketing.Common.JWT;
using EmailMarketing.Common.Pagination;
using EmailMarketing.Common.Search;
using EmailMarketing.Common.Sort;
using EmailMarketing.Middleware;
using EmailMarketing.Modules.Roles.Responses;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Requests;
using EmailMarketing.Modules.Users.Responses;
using EmailMarketing.Persistences.Repositories;
using Microsoft.EntityFrameworkCore;
using static EmailMarketing.Common.GoogleServices.GoogleService;
using BC = BCrypt.Net.BCrypt;

namespace EmailMarketing.Modules.Users.Services
{
    public interface IUserServices
    {
        void Create(CreateUserRequest request);

        void Delete(int userId);

        void Update(int userId, UpdateUser request);

        LoginResponse Login(string email, string password);
        public string? RefreshToken(string refreshToken);

        void UpdateName(int userId, UpdateUserName name);

        void UpdatePassword(int userId, UpdateUserPassword user);

        void CreateGoogleAccount(string refreshToken, int userId, UserInfoResult userInfo);

        void DeleteGoogleAccount(int userId, DeleteGoogleAccountRequest request);

        PaggingResponse<GoogleAccount> GetGoogleAccout(int userId, GetGoogleAccountRequest request);

        GoogleAccount GetDetailGoogleAccount(int userId, int googleId);

        UserDetailResponse GetProfile(int userId, HttpContext context);

        Task UpdateAvatarAsync(int userId, UpdateUserAvatar file);

        PaggingResponse<User> Get(GetUserRequest request);
    }

    public class UserServices : IUserServices
    {
        private readonly IMapper mapper;
        private readonly IRepositoryWrapper repository;
        private readonly IJwtServices jwt;

        public UserServices(IRepositoryWrapper repository, IMapper mapper, IJwtServices jwt)
        {
            this.repository = repository;
            this.mapper = mapper;
            this.jwt = jwt;
        }

        public void Create(CreateUserRequest request)
        {
            repository.User.Create(mapper.Map<CreateUserRequest, User>(request));
            repository.Save();
        }

        public void CreateGoogleAccount(string refreshToken, int userId, UserInfoResult userInfo)
        {
            GoogleAccount googleAccount = mapper.Map<UserInfoResult, GoogleAccount>(userInfo);
            googleAccount.RefreshToken = refreshToken;
            googleAccount.UserId = userId;
            repository.GoogleAccount.Create(googleAccount);
            repository.Save();
        }

        public void Delete(int userId)
        {
            User? user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault();

            if (user is null)
                throw new BadRequestException("User doest not exist in system");

            repository.User.Delete(user!);
            repository.Save();
        }

        public PaggingResponse<User> Get(GetUserRequest request)
        {
            IQueryable<User> response = repository.User.FindAll().Include(x => x.Role);
            if (request.Fillter != null)
                response = response.Where(x => x.Role!.Name == request.Fillter);

            return response.ApplySearch(request.InfoSearch!)
                .ApplySort(request.Orderby!)
                .ApplyPagging(request.Current, request.PageSize);
        }

        public GoogleAccount GetDetailGoogleAccount(int userId, int googleId)
        {
            return repository.GoogleAccount.FindByCondition(x => x.Id == googleId && x.UserId == userId).FirstOrDefault()!;
        }

        public PaggingResponse<GoogleAccount> GetGoogleAccout(int userId, GetGoogleAccountRequest request)
        {
            return repository.GoogleAccount.FindByCondition(x => x.UserId == userId)
                    .ApplySearch(request.InfoSearch!)
                    .ApplySort(request.Orderby)
                    .ApplyPagging(request.Current, request.PageSize);
        }

        public UserDetailResponse GetProfile(int userId, HttpContext context)
        {
            UserDetailResponse profile = repository.User
                .FindByCondition(x => x.Id == userId)
                .Include(x => x.Role)
                .ThenInclude(x => x.RolePermissions)
                .ThenInclude(x => x.Permission)
                .ToList()
                .Select(x => new UserDetailResponse
                {
                    Email = x.Email,
                    Name = x.Name,
                    RoleId = x.RoleId,
                    Avatar = x.Avatar,
                    Status = x.Status,
                    RoleName = x.Role!.Name,
                    Permissions = x.Role.RolePermissions.Select(x => x.Permission).GroupBy(key => key!.Modules)
                    .Select(grp => new PermissionResponse
                    {
                        Modules = grp.Key,
                        Permissions = grp.Select(x => new Permissions { Code = x!.Code, Name = x.Name }).ToList()
                    }).ToList()
                })
                .FirstOrDefault()!;

            if (profile is null)
                throw new BadRequestException("User doest not exist in system");

            profile.Avatar = profile.Avatar!.ReadAsLink(context);
            return profile;
        }

        public LoginResponse Login(string email, string password)
        {
            User user = repository.User.FindByCondition(x => x.Email == email).FirstOrDefault()!;

            if (user is null)
                throw new BadRequestException("Incorrect email");

            if (!BC.Verify(password, user.Password))
                throw new BadRequestException("Incorrect password");

            string accessToken = jwt.GenerateAccessToken(user);

            string refreshToken = user.RefreshToken!;

            if (refreshToken is null)
            {
                refreshToken = jwt.GenerateRefreshToken();
                user.RefreshToken = refreshToken;
                repository.Save();
            }

            return new LoginResponse { AccessToken = accessToken, RefreshToken = refreshToken };
        }

        public string? RefreshToken(string refreshToken)
        {
            User? user = repository.User.FindByCondition(x=>x.RefreshToken == refreshToken).FirstOrDefault();

            if (user is null)
                throw new BadRequestException("Invalid Refreshtoken");

            if (!jwt.ValidateJwtToken(user!.RefreshToken!))
                throw new BadRequestException("Authenticate error");

            return jwt.GenerateAccessToken(user);
        }

        public async Task UpdateAvatarAsync(int userId, UpdateUserAvatar request)
        {
            User? user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault();

            if (user is null)
                throw new BadRequestException("User doest not exist in system");

            user!.Avatar = await request.File!.UploadFilesAsync("Avatars");

            repository.User.Update(user);
            repository.Save();
        }

        public void UpdateName(int userId, UpdateUserName request)
        {
            User? user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault();

            if (user is null)
                throw new BadRequestException("User doest not exist in system");

            repository.User.Update(mapper.Map(request, user!));
            repository.Save();
        }

        public void UpdatePassword(int userId, UpdateUserPassword request)
        {
            User? user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault();

            if (user is null)
                throw new BadRequestException("Invalid user");

            repository.User.Update(mapper.Map(request, user!));

            user.RefreshToken = null;

            repository.Save();
        }

        public void Update(int userId, UpdateUser request)
        {
            User? user = repository.User.FindByCondition(x => x.Id == userId).FirstOrDefault();

            if (user is null)
                throw new BadRequestException("User does not in system");

            repository.User.Update(mapper.Map(request, user!));
            repository.Save();
        }

        public void DeleteGoogleAccount(int userId, DeleteGoogleAccountRequest request)
        {
            List<GoogleAccount> googleAccount = repository.GoogleAccount.FindByCondition(x => request.GoogleAccountId!.Contains(x.Id) && x.UserId == userId).ToList();
            repository.GoogleAccount.DeleteMulti(googleAccount);
            repository.Save();
        }
    }
}