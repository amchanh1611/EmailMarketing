using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Requests;
using EmailMarketing.Modules.Users.Services;
using Microsoft.AspNetCore.Mvc;
using ProjectExample.Persistence.PaggingBase;

namespace EmailMarketing.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUserServices userService;

        public UsersController(IUserServices userService)
        {
            this.userService = userService;
        }

        [HttpPost]
        public IActionResult Create([FromBody] CreateUserRequest request)
        {
            userService.Create(request);
            return Ok();
        }

        [HttpGet]
        public IActionResult GetUser([FromQuery] GetUserRequest request)
        {
            PaggingResponse<User> result = userService.Get(request);
            if (result != null)
                return Ok(result);
            return BadRequest("No user exists in the system");
        }

        [HttpGet("{userId}")]
        public IActionResult GetDetail([FromRoute] int userId)
        {
            User result = userService.GetDetail(userId);
            if (result != null)
                return Ok(result);
            return BadRequest("User does not exist");
        }
        [HttpDelete("{userId}")]
        public IActionResult Delete([FromRoute] int userId)
        {
            userService.Delete(userId);
            return Ok();
        }
        [HttpPut("Status/{userId}")]
        public IActionResult UpdateStatus([FromRoute] int userId,[FromBody] UpdateUserStatus request)
        {
            userService.UpdateStatus(userId, request);
            return Ok();
        } 
        [HttpPut("Email/{userId}")]
        public IActionResult UpdateEmail([FromRoute] int userId,[FromBody] UpdateUserEmail request)
        {
            userService.UpdateEmail(userId, request);
            return Ok();
        }
    }
}