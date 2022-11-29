using EmailMarketing.Modules.Contacts.Request;
using EmailMarketing.Modules.Contacts.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

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
        [HttpGet]
        public IActionResult Get([FromQuery] GetContactRequest request)
        {
            return Ok(services.Get(request));
        }
        [HttpPost]
        public IActionResult Create([FromBody] CreateContactRequest request)
        {
            services.Create(request);
            return Ok();
        }
        [HttpPost("Excel")]
        public IActionResult CreateByExcel([FromForm] CreateContactByExcelRequest request)
        {
            services.CreateByExcel(request);
            return Ok();
        }
    }
}
