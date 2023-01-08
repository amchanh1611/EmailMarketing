using EmailMarketing.Modules.ServiecesPackage.Request;
using EmailMarketing.Modules.ServiecesPackage.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace EmailMarketing.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ServicePackagesController : ControllerBase
    {
        private readonly IServicePackageServices packageServices;
        public ServicePackagesController(IServicePackageServices packageServices)
        {
            this.packageServices = packageServices;
        }
        [HttpPost]
        [Authorize(Roles = "CreateServicePackage")]
        public IActionResult Create([FromBody] CreateServicePackageRequest request)
        {
            packageServices.Create(request);
            return Ok();
        }
        [HttpGet]
        [Authorize(Roles = "ViewServicePackage")]
        public IActionResult Get([FromQuery] GetServicePackageRequest request)
        {
            return Ok(packageServices.Get(request));
        }
        [HttpPut("{servicePackageId}")]
        [Authorize(Roles = "UpdateServicePackage")]
        public IActionResult Update([FromRoute] int servicePackageId, [FromBody] UpdateServicePackageRequest request)
        {
            packageServices.Update(servicePackageId, request);
            return Ok();
        }
        [HttpDelete("{servicePackageId}")]
        [Authorize(Roles = "DeleteServicePackage")]
        public IActionResult Delete([FromRoute] int servicePackageId)
        {
            packageServices.Delete(servicePackageId);
            return Ok();
        }
    }
}
