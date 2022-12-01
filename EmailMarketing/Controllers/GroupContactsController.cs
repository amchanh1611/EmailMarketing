using DocumentFormat.OpenXml.Office2016.Excel;
using EmailMarketing.Modules.Contacts.Request;
using EmailMarketing.Modules.Contacts.Services;
using Microsoft.AspNetCore.Http;
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
        public IActionResult Create([FromBody] CreateGroupContactRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            services.Create(userId, request);
            return Ok();
        }
        [HttpGet]
        public IActionResult Get([FromQuery] GetGroupContactRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            return Ok(services.Get(userId, request));
        }
        [HttpPut("{groupId}")]
        public IActionResult Update([FromRoute] int groupId, [FromBody] UpdateGroupContactRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            services.Update(userId, groupId, request);
            return Ok();
        }
        [HttpDelete]
        public IActionResult Delete([FromBody] DeleteGroupContactRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            services.Delete(userId, request);
            return Ok();
        }
    }
}
