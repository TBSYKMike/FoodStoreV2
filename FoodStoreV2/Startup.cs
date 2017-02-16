using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FoodStoreV2.Startup))]
namespace FoodStoreV2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
