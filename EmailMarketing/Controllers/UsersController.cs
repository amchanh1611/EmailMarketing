using EmailMarketing.Modules.Users.Requests;
using EmailMarketing.Modules.Users.Response;
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
            PaggingResponse<UserGetResponse> result = userService.Get(request);
            if (result != null)
                return Ok(result);
            return BadRequest("No user exists in the system");
        }

        [HttpGet("{userId}")]
        public IActionResult GetDetail([FromRoute] int userId)
        {
            UserGetDetailResponse result = userService.GetDetail(userId);
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
        [HttpPut("{userId}")]
        public IActionResult Update([FromRoute] int userId,[FromBody] UpdateUserRequest request)
        {
            userService.Update(userId, request);
            return Ok();
        }
    }
}