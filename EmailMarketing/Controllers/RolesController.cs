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
        private readonly IRoleServices roleService;

        public RolesController(IRoleServices roleService)
        {
            this.roleService = roleService;
        }
        [HttpPost]
        public IActionResult Create(CreateRoleRequest request)
        {
            roleService.Create(request);
            return Ok();
        }
    }
}
