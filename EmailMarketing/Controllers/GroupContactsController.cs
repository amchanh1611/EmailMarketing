using EmailMarketing.Modules.Contacts.Request;
using EmailMarketing.Modules.Contacts.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace EmailMarketing.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GroupContactsController : ControllerBase
    {
        private readonly IGroupContactServices services;

        public GroupContactsController(IGroupContactServices services)
        {
            this.services = services;
        }
        [HttpPost]
        [Authorize(Roles = "CreateContact")]
        public IActionResult Create([FromBody] CreateGroupContactRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            services.Create(userId, request);
            return Ok();
        }
        [HttpGet]
        [Authorize(Roles = "ViewContact")]
        public IActionResult Get([FromQuery] GetGroupContactRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            return Ok(services.Get(userId, request));
        }
        [HttpPut("{groupId}")]
        [Authorize(Roles = "UpdateContact")]
        public IActionResult Update([FromRoute] int groupId, [FromBody] UpdateGroupContactRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            services.Update(userId, groupId, request);
            return Ok();
        }
        [HttpDelete]
        [Authorize(Roles = "DeleteContact")]
        public IActionResult Delete([FromBody] DeleteGroupContactRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            services.Delete(userId, request);
            return Ok();
        }
    }
}
