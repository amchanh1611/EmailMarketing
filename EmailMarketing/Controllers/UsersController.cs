using EmailMarketing.Common.Jwt;
using EmailMarketing.Common.JWT;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Requests;
using EmailMarketing.Modules.Users.Services;

using Microsoft.AspNetCore.Mvc;
using ProjectExample.Persistence.PaggingBase;
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

        [HttpGet("{userId}")]
        public IActionResult GetDetail([FromRoute] int userId)
        {
            HttpContext context = HttpContext;
            User result = userServices.GetDetail(userId,context);
            if (result != null)
                return Ok(result);
            return BadRequest("User does not exist");
        }

        [HttpDelete("{userId}")]
        public IActionResult Delete([FromRoute] int userId)
        {
            userServices.Delete(userId);
            return Ok();
        }

        [HttpPut("Status/{userId}")]
        public IActionResult UpdateStatus([FromRoute] int userId, [FromBody] UpdateUserStatus request)
        {
            userServices.UpdateStatus(userId, request);
            return Ok();
        }

        [HttpPut("Email/{userId}")]
        public IActionResult UpdateEmail([FromRoute] int userId, [FromBody] UpdateUserEmail request)
        {
            userServices.UpdateEmail(userId, request);
            return Ok();
        }

        [HttpPost("Login")]
        public IActionResult Login([FromBody] UserLogin user)
        {
            string token = userServices.Login(user.Email!, user.Password!);
            if (token != null)
                return Ok(token);
            return BadRequest("Incorrect Email/Password");
        }
        [Authorize]
        [HttpPut("Profile/Name")]
        public IActionResult UpdateProfileName([FromBody] UpdateUserName request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            userServices.UpdateName(userId, request);
            return Ok();
        }

        [HttpPut("Profile/Avatar"), Authorize]
        public async Task<IActionResult> UpdateProfileAvatarAsync([FromForm] UpdateUserAvatar request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            await userServices.UpdateAvatarAsync(userId, request);
            return Ok();
        }

        [HttpPut("Profile/Password"), Authorize]
        public IActionResult UpdateProfilePassword([FromBody] UpdateUserPassword request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            bool result = userServices.UpdatePassword(userId, request);
            if (result)
                return Ok();
            return BadRequest("Incorrect old password");
        }
    }
}