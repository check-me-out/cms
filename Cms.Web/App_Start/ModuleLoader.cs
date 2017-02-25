using System.Reflection;
using Cms.Data.Contexts.Blog;
using Cms.Data.Contexts.Gdrive;
using log4net;
using Ninject;
using Ninject.Modules;

namespace Cms.Web
{
    public class ModuleLoader : NinjectModule
    {
        public override void Load()
        {
            var logger = LogManager.GetLogger("CmsLogger");
            Bind<ILog>().ToConstant<ILog>(logger).Named("CmsLogger");
            Bind<IBlogDbContext>().To<BlogDbContext>();
            Bind<IGdriveDbContext>().To<GdriveDbContext>();
        }

        private static readonly StandardKernel Instance = CreateInstance();

        public static StandardKernel Dependencies { get { return Instance; } }

        private static StandardKernel CreateInstance()
        {
            var kernel = new StandardKernel();
            kernel.Load(Assembly.GetExecutingAssembly());
            return kernel;
        }
    }
}