using AutoMapper;
using EmailMarketing.Modules.Roles.Entities;
using EmailMarketing.Modules.Roles.Requests;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Requests;
using EmailMarketing.Modules.Users.Response;
using BC = BCrypt.Net.BCrypt;


namespace EmailMarketing.Mapping
{
    public class Profiles : Profile
    {
        public Profiles()
        {
            //User
            CreateMap<CreateUserRequest, User>()
                .ForMember(dest=>dest.Password,src=>src.MapFrom(x=>BC.HashPassword(x.Password)));
            CreateMap<User, UserGetResponse>();
            CreateMap<User, UserGetDetailResponse>();
            CreateMap<UpdateUserRequest, User>()
                .ForMember(dest=>dest.Password,op=>op.Ignore())
                .ForMember(dest=>dest.RoleId,op=>op.Ignore())
                .ForMember(dest=>dest.Password,src=>src.MapFrom(x=>BC.HashPassword(x.Password)));

            //Role
            CreateMap<CreateRoleRequest, Role>();
        }
    }
}
