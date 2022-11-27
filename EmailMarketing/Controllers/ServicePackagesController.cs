using EmailMarketing.Modules.ServiecesPackage.Request;
using EmailMarketing.Modules.ServiecesPackage.Services;
using Microsoft.AspNetCore.Http;
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
        public IActionResult Create([FromBody] CreateServicePackageRequest request)
        {
            packageServices.Create(request);
            return Ok();
        }
        [HttpGet]
        public IActionResult Get([FromQuery] GetServicePackageRequest request)
        {
            return Ok(packageServices.Get(request));
        }
        [HttpPut("{servicePackageId}")]
        public IActionResult Update([FromRoute] int servicePackageId, [FromBody] UpdateServicePackageRequest request)
        {
            packageServices.Update(servicePackageId,request);
            return Ok();
        }
        [HttpDelete("{servicePackageId}")]
        public IActionResult Delete([FromRoute] int servicePackageId)
        {
            packageServices.Delete(servicePackageId);
            return Ok();
        }
    }
}
