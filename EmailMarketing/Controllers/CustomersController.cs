using EmailMarketing.Modules.Users.Requests;
using EmailMarketing.Modules.Users.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace EmailMarketing.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomersController : ControllerBase
    {
        private readonly IUserServices userServices;
        private readonly ICustomerServices customerServices;

        public CustomersController(IUserServices userServices, ICustomerServices customerServices)
        {
            this.userServices = userServices;
            this.customerServices = customerServices;
        }

        [HttpPost]
        [Authorize(Roles = "CreateCustommer")]
        public IActionResult Create([FromBody] CreateCustomerRequest request)
        {
            customerServices.Create(request);
            return Ok();
        }

        [HttpGet]
        [Authorize(Roles = "ViewCustommer")]
        public IActionResult GetUser([FromQuery] GetUserRequest request)
        {
            return Ok(userServices.Get(request));
        }

        [HttpGet("Profile"), Authorize]
        public IActionResult GetProfile()
        {
            HttpContext context = HttpContext;
            Claim? claim = context.User.FindFirst(ClaimTypes.NameIdentifier);
            return Ok(userServices.GetProfile(int.Parse(claim!.Value), context));
        }

        [HttpGet("{userId}")]
        [Authorize(Roles = "ViewCustommer")]
        public IActionResult GetDetail([FromRoute] int userId)
        {
            HttpContext context = HttpContext;
            return Ok(userServices.GetProfile(userId, context));
        }

        [HttpDelete("{userId}")]
        [Authorize(Roles = "DeleteCustommer")]
        public IActionResult Delete([FromRoute] int userId)
        {
            userServices.Delete(userId);
            return Ok();
        }

        [HttpPut("{userId}")]
        [Authorize(Roles = "UpdateCustommer")]
        public IActionResult UpdateCustomer([FromRoute] int userId, [FromBody] UpdateCustomerRequest request)
        {
            customerServices.Update(userId, request);
            return Ok();
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
