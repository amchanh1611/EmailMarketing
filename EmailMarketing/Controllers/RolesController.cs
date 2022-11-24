using EmailMarketing.Modules.Roles.Entities;
using EmailMarketing.Modules.Roles.Requests;
using EmailMarketing.Modules.Roles.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EmailMarketing.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RolesController : ControllerBase
    {
        private readonly IRoleServices roleServices;

        public RolesController(IRoleServices roleServices)
        {
            this.roleServices = roleServices;
        }
        [HttpPost]
        public IActionResult Create(CreateRoleRequest request)
        {
            roleServices.Create(request);
            return Ok();
        }
        [HttpPost("Permission")]
        public IActionResult CreatePermission(CreatePermissionRequest request)
        {
            roleServices.CreatePermission(request);
            return Ok();
        }
        [HttpGet("Permission")]
        public IActionResult GetPermission([FromQuery] UserType userType)
        {
            List<Permission> result = roleServices.GetPermission(userType);
            return Ok(result);
        }
    }
}
