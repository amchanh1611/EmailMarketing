﻿using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Services;
using System.Net;
using System.Security.Claims;
using System.Text.Json;

namespace EmailMarketing.Middleware
{
    public class JwtMiddleware
    {
        private readonly RequestDelegate next;

        public JwtMiddleware(RequestDelegate next)
        {
            this.next = next;
        }

        public async Task Invoke(HttpContext context, IUserServices userServices)
        {
            Claim claim = context.User.FindFirst(ClaimTypes.NameIdentifier)!;
            if (claim != null)
            {
                int userId = int.Parse(claim.Value);
                User user = userServices.GetDetail(userId, context);
                if (user.Status == UserStatus.Lock)
                {
                    context.Response.StatusCode = (int)HttpStatusCode.Unauthorized;
                    throw new UnauthorizedException("User has been locked");
                }

            }
            else
            {
                await next(context);
            }




        }
    }
}