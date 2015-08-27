using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CentPro_Licence_Web.Startup))]
namespace CentPro_Licence_Web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
