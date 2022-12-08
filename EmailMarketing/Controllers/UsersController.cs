using EmailMarketing.AppSetting;
using EmailMarketing.Common.Extensions;
using EmailMarketing.Common.GoogleServices;
using EmailMarketing.Common.JWT;
using EmailMarketing.Common.Pagination;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Requests;
using EmailMarketing.Modules.Users.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.Security.Claims;
using System.Text.Json;
using static EmailMarketing.Common.GoogleServices.GoogleService;
using static EmailMarketing.Common.JWT.JwtServices;

namespace EmailMarketing.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUserServices userServices;
        private readonly AppSettings appSettings;
        private readonly IGoogleServices googleServices;
        public UsersController(IUserServices userServices, IOptions<AppSettings> appSettings, IGoogleServices googleServices)
        {
            this.userServices = userServices;
            this.appSettings = appSettings.Value;
            this.googleServices = googleServices;
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
        public IActionResult GetDetail([FromRoute] int userId)
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
            userServices.Update(userId, request);
            return Ok();
        }

        [HttpGet("User/RefreshToken")]
        public IActionResult RefreshToken([FromQuery] string refreshToken)
        {
            return Ok(userServices.RefreshToken(refreshToken));
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
        [HttpGet("AuthAccount"), Authorize]
        public IActionResult AuthAccount()
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            State state = new State { UserId = userId };
            string stateString = JsonSerializer.Serialize(state);
            return Ok(googleServices.AuthUri(stateString.Base64Encode()));
        }
        [HttpGet("OAuth")]
        public async Task<IActionResult> OAuthAsync([FromQuery] string code, [FromQuery] string state)
        {
            TokenResult tokenResult = await googleServices.TokenAsync(code);
            UserInfoResult userInfo = await googleServices.UserInfoAsync(tokenResult.RefreshToken!);

            string stateString = state.Base64Decode();
            State stateObject = JsonSerializer.Deserialize<State>(stateString)!;
            userServices.CreateGoogleAccount(tokenResult.RefreshToken!, stateObject.UserId, userInfo);
            return Ok();
        }
        [HttpGet("GoogleAccount"), Authorize]
        public IActionResult GetGoogleAccount([FromQuery] GetGoogleAccountRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            return Ok(userServices.GetGoogleAccout(userId, request));
        }

        [HttpDelete("GoogleAccount"), Authorize]
        public IActionResult DeleGoogleAccount([FromBody] DeleteGoogleAccountRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            userServices.DeleteGoogleAccount(userId, request);
            return Ok();
        }
    }
}