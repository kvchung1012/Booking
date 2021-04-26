using Booking.Model.Model;
using Booking.Service.IService;
using Booking.Service.Service;
using System.Web.Mvc;
using Unity;
using Unity.Mvc5;

namespace Booking.Web
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer();

            // register all your components with the container here
            // it is NOT necessary to register your controllers

            //e.g. container.RegisterType<ITestService, TestService>();
            container.RegisterType<ICommonService, CommonService>();
            container.RegisterType<ILessorService, LessorService>();
            container.RegisterType<IAdminService, AdminService>();
            container.RegisterType<ICustomerService, CustomerService>();
            container.RegisterType<ICategoryHouseService, CategoryHouseService>();
            container.RegisterType<IDestinationPlaceService, DestinationPlaceService>();
            container.RegisterType<IUnitService, UnitService>();
            container.RegisterType<IItemInRoomService, ItemInRoomService>();
            container.RegisterType<IUtilitiService, UtilitiService>();
            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }
    }
}