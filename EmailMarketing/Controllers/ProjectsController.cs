using EmailMarketing.Modules.Projects.Enities;
using EmailMarketing.Modules.Projects.Request;
using EmailMarketing.Modules.Projects.Services;
using Hangfire;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace EmailMarketing.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProjectsController : ControllerBase
    {
        private readonly IProjectServices projectServices;

        public ProjectsController(IProjectServices projectServices)
        {
            this.projectServices = projectServices;
        }
        [HttpGet]
        [Authorize(Roles = "ViewProject")]
        public IActionResult Get([FromQuery] GetProjectRequest request)
        {
            return Ok(projectServices.Get(request));
        }
        [HttpGet("User/Project")]
        [Authorize(Roles = "ViewPersonalProject")]
        public IActionResult GetByUser([FromQuery] GetProjectRequest request)
        {
            Claim? claim = HttpContext.User.FindFirst(ClaimTypes.NameIdentifier);
            int userId = int.Parse(claim!.Value);
            return Ok(projectServices.GetByUser(userId, request));
        }
        [HttpPost]
        [Authorize(Roles = "CreateProject")]
        public IActionResult Create([FromBody] CreateProjectRequest request)
        {
            Project project = projectServices.Create(request);

            RecurringJob.AddOrUpdate("updateuse", () => projectServices.UpdateUsedDaily(project.Id), Cron.Monthly(project.CreatedDate.Day));
            RecurringJob.TriggerJob("updateuse");

            return Ok();
        }

        [HttpPut("{projectId}")]
        [Authorize(Roles = "UpdateProject")]
        public IActionResult Update([FromRoute] int projectId, [FromBody] UpdateProjectRequest request)
        {
            projectServices.Update(projectId, request);
            return Ok();
        }
        [HttpDelete("{projectId}")]
        [Authorize(Roles = "DeleteProject")]
        public IActionResult Delete([FromRoute] int projectId, [FromBody] DeleteProjectRequest request)
        {
            projectServices.Delete(projectId, request);
            return Ok();
        }
    }
}
