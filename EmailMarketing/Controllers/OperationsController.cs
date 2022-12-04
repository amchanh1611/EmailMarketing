using EmailMarketing.Common.GoogleServices;
using EmailMarketing.Modules.Contacts.Entities;
using EmailMarketing.Modules.Contacts.Services;
using EmailMarketing.Modules.Operations.Entities;
using EmailMarketing.Modules.Operations.Request;
using EmailMarketing.Modules.Operations.Services;
using EmailMarketing.Modules.Users.Entities;
using EmailMarketing.Modules.Users.Services;
using Hangfire;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace EmailMarketing.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OperationsController : ControllerBase
    {
        private readonly IOperationServices services;
        private readonly IUserServices userServices;
        private readonly IGroupContactServices groupContactServices;
        private readonly IGoogleServices googleServices;
        private readonly IBackgroundJobClient backgroundJobClient;

        public OperationsController(IOperationServices services, IUserServices userServices, IGroupContactServices groupContactServices, IGoogleServices googleServices, IBackgroundJobClient backgroundJobClient)
        {
            this.services = services;
            this.userServices = userServices;
            this.groupContactServices = groupContactServices;
            this.googleServices = googleServices;
            this.backgroundJobClient = backgroundJobClient;
        }
        [HttpGet, Authorize]
        public IActionResult Get([FromQuery] GetOperationRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);

            return Ok(services.Get(userId, request));
        }

        [HttpGet("Operation/{operationId}/Content"), Authorize]
        public IActionResult ContentOfOperation([FromRoute] int operationId)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);

            return Ok(services.ContentOfOperation(userId, operationId));
        }

        [HttpGet("{operationId}"),Authorize]
        public IActionResult GetDetail([FromRoute] int operaitonId, [FromQuery] GetOperationRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);

            return Ok(services.GetDetailOperation(userId, operaitonId, request));
        }

        [HttpPost, Authorize]
        public async Task<IActionResult> CreateAsync([FromBody] CreateOperationRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            
            GoogleAccount googleAccount = userServices.GetDetailGoogleAccount(userId, request.GoogleAccountId!.Value);
            GroupContact groupContact = groupContactServices.GetDetail(userId, request.GroupContactId!.Value);
            List<string> to = groupContact.Contacts.Select(x => x.Email).ToList();
            DateTimeOffset date = request.DateSend!.Value;

            await googleServices.SendMailAsync(googleAccount.Email, to, request.Subject!, request.Content!, googleAccount.RefreshToken);

            //var a = backgroundJobClient.Schedule(() => googleServices.SendMailAsync(googleAccount.Email, to, request.Subject!, request.Content!, googleAccount.RefreshToken),date);
            
            services.Create(userId, request);

            return Ok();
        }
        [HttpPut("{operationId}"), Authorize]
        public IActionResult UpdateStatus([FromRoute] int operationId, [FromBody] OperationStatus status)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);

            services.UpdateStatus(userId, operationId, status);
            return Ok();
        }
    }
}
