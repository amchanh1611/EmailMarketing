using EmailMarketing.Modules.Contacts.Request;
using EmailMarketing.Modules.Contacts.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace EmailMarketing.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContactsController : ControllerBase
    {
        private readonly IContactServices services;

        public ContactsController(IContactServices services)
        {
            this.services = services;
        }
        [HttpGet, Authorize]
        public IActionResult Get([FromQuery] GetContactRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            return Ok(services.Get(userId, request));
        }
        [HttpPost, Authorize]
        public IActionResult Create([FromBody] CreateContactRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            services.Create(userId, request);
            return Ok();
        }
        [HttpPost("Excel"), Authorize]
        public IActionResult CreateByExcel([FromForm] CreateContactByExcelRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            services.CreateByExcel(userId, request);
            return Ok();
        }
        [HttpDelete, Authorize]
        public IActionResult Delete([FromBody] DeleteContactRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            services.Delete(userId, request);
            return Ok();
        }
        [HttpGet("GroupContact/{groupId}/Contact")]
        public IActionResult ContactOfGroup([FromRoute] int groupId, [FromQuery] GetContactInGroupRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            return Ok(services.ContactInGroup(userId, groupId, request));
        }
        [HttpPut("{contactId}")]
        public IActionResult Update([FromRoute] int contactId,[FromBody] UpdateContactRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            services.Update(userId, contactId, request);
            return Ok();
        }
    }
}
