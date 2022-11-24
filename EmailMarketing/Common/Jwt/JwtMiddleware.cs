using EmailMarketing.AppSetting;
using EmailMarketing.Common.JWT;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Options;
using System.Security.Claims;

namespace EmailMarketing.Common.Jwt
{
    public class JwtMiddleware
    {
        private readonly RequestDelegate next;

        public JwtMiddleware(RequestDelegate next, IOptions<AppSettings> appSettings)
        {
            this.next = next;
        }

        public async Task Invoke(HttpContext context, IUserServices userServices)
        {
            Claim claim = context.User.FindFirst(ClaimTypes.NameIdentifier)!;
            int userId = int.Parse(claim.Value);
            context.Items["User"] = userServices.GetDetail(userId, context);
            //var token = context.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
            //var userId = jwtUtils.ValidateJwtToken(token);
            //if (userId != null)
            //{
            //    // attach user to context on successful jwt validation
            //    context.Items["User"] = authenRepository.GetUserById(userId.Value);
            //}

            await next(context);
        }
    }
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class AuthorizeAttribute : Attribute, IAuthorizationFilter
    {
        private readonly IList<UserStatus> status;
        public AuthorizeAttribute(params UserStatus[] status)
        {
            this.status = status ?? new UserStatus[] { } ;
        }
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            // authorization
            User user = (User)context.HttpContext.Items["User"]!;
            List<UserStatus> status = new();
            status.Add(user.Status);
            if (this.status.Any() && !this.status.Intersect(status).Any())
            {
                //not logged in or role not authorized
                context.Result = new JsonResult(new { message = "User has been locked" }) { StatusCode = StatusCodes.Status401Unauthorized };
            }
        }
    }
}
