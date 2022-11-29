using EmailMarketing.Modules.Contacts.Request;
using EmailMarketing.Modules.Contacts.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

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
            services.Create(request);
            return Ok();
        }
        [HttpGet]
        public IActionResult Get(GetGroupContactRequest request)
        {
            return Ok(services.Get(request));
        }
    }
}
