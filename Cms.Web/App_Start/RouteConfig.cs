using System.Web.Mvc;
using System.Web.Routing;

namespace Cms.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "version",
                url: "ver",
                defaults: new { controller = "Account", action = "Version" }
            );

            routes.MapRoute(
                name: "default-route",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Account", action = "Login", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                "catch-all",
                "{*url}",
                new { controller = "Error", action = "InvalidUrl" }
            );
        }
    }
}
