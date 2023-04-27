using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MangoERP.Startup))]
namespace MangoERP
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
