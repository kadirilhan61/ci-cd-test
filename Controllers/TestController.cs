using Microsoft.AspNetCore.Mvc;

namespace coreapi.Controllers;

[ApiController]
[Route("[controller]")]
public class TestController : ControllerBase
{ 
 
    [HttpGet]
    public string Test()
    {
       return "Test 1";
    }
}
