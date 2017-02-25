using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Cms.Web.Startup))]
namespace Cms.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
