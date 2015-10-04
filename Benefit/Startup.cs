using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Benefit.Startup))]
namespace Benefit
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
          //  ConfigureAuth(app);
        }
    }
}
