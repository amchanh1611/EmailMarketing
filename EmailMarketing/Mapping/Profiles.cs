﻿using AutoMapper;
using EmailMarketing.Modules.Roles.Entities;
using EmailMarketing.Modules.Roles.Requests;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Requests;
using BC = BCrypt.Net.BCrypt;


namespace EmailMarketing.Mapping
{
    public class Profiles : Profile
    {
        public Profiles()
        {
            //User
            CreateMap<CreateUserRequest, User>()
                .ForMember(dest => dest.Password,src=> src.MapFrom(x => BC.HashPassword(x.Password)));
            CreateMap<UpdateUserStatus, User>();
            CreateMap<UpdateUserEmail, User>();

            //Role
            CreateMap<CreateRoleRequest, Role>();
        }
    }
}