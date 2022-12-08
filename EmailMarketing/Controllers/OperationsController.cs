using EmailMarketing.Modules.Operations.Entities;
using EmailMarketing.Modules.Operations.Request;
using EmailMarketing.Modules.Operations.Services;
using Hangfire;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace EmailMarketing.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OperationsController : ControllerBase
    {
        private readonly IOperationServices services;
        private readonly IBackgroundJobClient backgroundJobClient;
        public OperationsController(IOperationServices services, IBackgroundJobClient backgroundJobClient)
        {
            this.services = services;
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

        [HttpPost, Authorize]
        public IActionResult CreateAsync([FromBody] CreateOperationRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);

            DateTimeOffset date = request.DateSend!.Value;

            Operation operation = services.Create(userId, request);

            services.CreateOperationDetail(operation.Id);

            backgroundJobClient.Schedule(() => services.SendMailAsync(operation.Id), date); ;

            return Ok();
        }

        [HttpGet("ReloadSendMail/{operationId}")]
        public async Task<IActionResult> ReloadSendMailAsync([FromRoute] int operationId)
        {
            await services.SendMailAsync(operationId);
            return Ok();
        }

        [HttpGet("OperationDetail/{operationId}")]
        public IActionResult GetOperationDetail([FromRoute] int operationId, [FromQuery] GetOperationDetailRequest request)
        {
            return Ok(services.GetOperationDetail(operationId, request));
        }

        //[HttpPut("{operationId}"), Authorize]
        //public IActionResult UpdateStatus([FromRoute] int operationId, [FromBody] OperationStatus status)
        //{
        //    Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
        //    int userId = int.Parse(claim!.Value);

        //    services.UpdateStatus(operationId, status);
        //    return Ok();
        //}
    }
}
