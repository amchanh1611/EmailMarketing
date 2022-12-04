using AutoMapper;
using EmailMarketing.Modules.Contacts.Entities;
using EmailMarketing.Modules.Contacts.Request;
using EmailMarketing.Modules.Operations.Entities;
using EmailMarketing.Modules.Operations.Request;
using EmailMarketing.Modules.Projects.Enities;
using EmailMarketing.Modules.Projects.Request;
using EmailMarketing.Modules.Roles.Entities;
using EmailMarketing.Modules.Roles.Requests;
using EmailMarketing.Modules.ServiecesPackage.Enities;
using EmailMarketing.Modules.ServiecesPackage.Request;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Requests;
using static EmailMarketing.Common.GoogleServices.GoogleService;
using BC = BCrypt.Net.BCrypt;


namespace EmailMarketing.Mapping
{
    public class Profiles : Profile
    {
        public Profiles()
        {
            //User
            CreateMap<CreateUserRequest, User>()
                .ForMember(dest => dest.Password, src => src.MapFrom(x => BC.HashPassword(x.Password)));
            CreateMap<UpdateUser, User>();
            CreateMap<UpdateUserName, User>();
            CreateMap<UpdateUserPassword, User>()
                .ForMember(dest => dest.Password, src => src.MapFrom(x => BC.HashPassword(x.NewPassword)));

            //Role
            CreateMap<CreateRoleRequest, Role>();
            CreateMap<UpdateRoleRequest, Role>();

            //Permission
            CreateMap<CreatePermissionRequest, Permission>()
                .ForMember(dest => dest.UserType, opt => opt.Ignore());

            //ServicePackage
            CreateMap<CreateServicePackageRequest, ServicePackage>();
            CreateMap<UpdateServicePackageRequest, ServicePackage>();

            //Project
            CreateMap<CreateProjectRequest, Project>();
            CreateMap<UpdateProjectRequest, Project>();

            //GroupContact
            CreateMap<CreateGroupContactRequest, GroupContact>();
            CreateMap<UpdateGroupContactRequest, GroupContact>();

            //Contact
            CreateMap<CreateContactRequest, Contact>();
            CreateMap<UpdateContactRequest, Contact>();

            //GoogleAccout
            CreateMap<UserInfoResult, GoogleAccount>();

            //Operation
            CreateMap<CreateOperationRequest, Operation>();

        }
    }
}
