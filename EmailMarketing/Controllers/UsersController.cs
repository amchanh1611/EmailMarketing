using EmailMarketing.Common.JWT;
using EmailMarketing.Common.Pagination;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Requests;
using EmailMarketing.Modules.Users.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace EmailMarketing.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUserServices userServices;

        public UsersController(IUserServices userServices)
        {
            this.userServices = userServices;
        }

        [HttpPost]
        public IActionResult Create([FromBody] CreateUserRequest request)
        {
            userServices.Create(request);
            return Ok();
        }

        [HttpGet]
        public IActionResult GetUser([FromQuery] GetUserRequest request)
        {
            PaggingResponse<User> result = userServices.Get(request);
            if (result != null)
                return Ok(result);
            return BadRequest("No user exists in the system");
        }

        [HttpGet("Profile"), Authorize]
        public IActionResult GetProfile()
        {
            HttpContext context = HttpContext;
            Claim? claim = context.User.FindFirst(ClaimTypes.NameIdentifier);
            return Ok(userServices.GetProfile(int.Parse(claim!.Value), context));
        }
        [HttpGet("{userId}")]
        public IActionResult GetProfile([FromRoute] int userId)
        {
            HttpContext context = HttpContext;
            return Ok(userServices.GetProfile(userId, context));
        }

        [HttpDelete("{userId}")]
        public IActionResult Delete([FromRoute] int userId)
        {
            userServices.Delete(userId);
            return Ok();
        }

        [HttpPut("{userId}")]
        public IActionResult UpdateUser([FromRoute] int userId, [FromBody] UpdateUser request)
        {
            userServices.UpdateUser(userId, request);
            return Ok();
        }

        [HttpPost("Login")]
        public IActionResult Login([FromBody] UserLogin user)
        {
            return Ok(userServices.Login(user.Email!, user.Password!));
        }

        [HttpPut("Profile/Name"), Authorize]
        public IActionResult UpdateProfileName([FromBody] UpdateUserName request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            userServices.UpdateName(int.Parse(claim!.Value), request);
            return Ok();
        }

        [HttpPut("Profile/Avatar"), Authorize]
        public async Task<IActionResult> UpdateProfileAvatarAsync([FromForm] UpdateUserAvatar request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            await userServices.UpdateAvatarAsync(int.Parse(claim!.Value), request);
            return Ok();
        }

        [HttpPut("Profile/Password"), Authorize]
        public IActionResult UpdateProfilePassword([FromBody] UpdateUserPassword request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            userServices.UpdatePassword(int.Parse(claim!.Value), request);
            return Ok("Ok");
        }
    }
}