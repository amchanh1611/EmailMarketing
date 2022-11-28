using EmailMarketing.Common.Pagination;
using EmailMarketing.Modules.Roles.Entities;
using EmailMarketing.Modules.Roles.Requests;
using EmailMarketing.Modules.Roles.Responses;
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
            return Ok(roleServices.GetPermission(userType));
        }
        [HttpGet("Role")]
        public IActionResult GetRole([FromQuery] GetRoleRequest request)
        {
            return Ok(roleServices.Get(request));
        }
        [HttpGet("Role/{roleId}/Permission")]
        public IActionResult PermissionOfRole([FromRoute] int roleId)
        {
            return Ok(roleServices.PermissionOfRole(roleId));
        }
        [HttpPut("{roleId}")]
        public IActionResult Update([FromRoute] int roleId, [FromBody]UpdateRoleRequest request)
        {
            roleServices.UpdateRole(roleId, request);
            return Ok();
        }
    }
}
