using EmailMarketing.Modules.Projects.Request;
using EmailMarketing.Modules.Projects.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

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
        public IActionResult Get(GetProjectRequest request)
        {
            return Ok(projectServices.Get(request));
        }
        [HttpPost]
        public IActionResult Create(CreateProjectRequest request)
        {
            projectServices.Create(request);
            return Ok();
        }
        [HttpPut("{projectId}")]
        public IActionResult Update(int projectId, UpdateProjectRequest request)
        {
            projectServices.Update(projectId, request);
            return Ok();
        }
        [HttpDelete("{projectId}")]
        public IActionResult Delete(int projectId)
        {
            projectServices.Delete(projectId);
            return Ok();
        }
    }
}
