using Booking.Model.Model;
using Booking.Model.ModelView;
using Booking.Service.IService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace Booking.Web.Areas.Lessor.Controllers
{
    public class OrderRoomController : Controller
    {
        private readonly ICommonService _commonService;
        private readonly IBuildingForRentService _buildingForRentService;
        private readonly IRoomInBuildingService _roomInBuildingService;
        private readonly IOrderRoomService _orderRoomService;
        private readonly ICustomerService _customerService;
        public OrderRoomController(ICustomerService customerService,IOrderRoomService orderRoom, ICommonService commonService, IBuildingForRentService buildingForRentService, IRoomInBuildingService roomInBuildingService)
        {
            _customerService = customerService;
            _orderRoomService = orderRoom;
            _commonService = commonService;
            _buildingForRentService = buildingForRentService;
            _roomInBuildingService = roomInBuildingService;
        }
        // GET: Lessor/OrderRoom
        public ActionResult Index()
        {
            return View();
        }

        public async Task<PartialViewResult> GetListData(RequestData requestData)
        {
            if (requestData.listFilter == null)
                requestData.listFilter = new List<Model.ModelView.Filter>();
            requestData.listFilter.Add(new Model.ModelView.Filter() { key = "CreatedBy", value = (Session["Lessor"] as TheLessor).Id.ToString() });
            var response = await _orderRoomService.GetListData(requestData);
            return PartialView(response);
        }

        public async Task<ActionResult> Create()
        {
            RequestData fake = new RequestData()
            {
                isAsc = true,
                listFilter = new List<Model.ModelView.Filter>() { new Model.ModelView.Filter() { key = "TheLessorId", value = (Session["Lessor"] as TheLessor).Id.ToString() } },
                orderBy = "",
                pageNumber = 0,
                pageSize = 1
            };
            ViewBag.building = (await _buildingForRentService.GetListData(fake)).data;
            return View();
        }

        public async Task<ActionResult> Edit(int Id)
        {
            var obj = await _orderRoomService.GetObjectById(Id);
            RequestData fake = new RequestData()
            {
                isAsc = true,
                listFilter = new List<Model.ModelView.Filter>() { new Model.ModelView.Filter() { key = "TheLessorId", value = (Session["Lessor"] as TheLessor).Id.ToString() } },
                orderBy = "",
                pageNumber = 0,
                pageSize = 1
            };
            ViewBag.room = await _roomInBuildingService.GetObjectById(int.Parse(obj.RoomInBuildingId.ToString()));
            ViewBag.building = (await _buildingForRentService.GetListData(fake)).data;
            fake.listFilter = new List<Model.ModelView.Filter>() { new Model.ModelView.Filter() { key = "BuildingForRentId", value = ViewBag.room.BuildingForRentId+"" } };
            ViewBag.rooms = (await _roomInBuildingService.GetListData(fake)).data;
            ViewBag.customer = (await _customerService.GetObjectById(int.Parse(obj.CustomerId.ToString())));
            
            return View(obj);
        }

        public async Task<JsonResult> GetRoom(string Id)
        {
            RequestData fake = new RequestData()
            {
                isAsc = true,
                listFilter = new List<Model.ModelView.Filter>() { new Model.ModelView.Filter() { key = "BuildingForRentId", value = Id } },
                orderBy = "",
                pageNumber = 0,
                pageSize = 1
            };
            return Json((await _roomInBuildingService.GetListData(fake)).data);
        }

        public async Task<JsonResult> AddOrUpdate(OrderRoom order, CustomerModelView customer)
        {
            order.CreatedBy = (Session["Lessor"] as TheLessor).Id;
            var check = await _orderRoomService.AddOrUpdate(order, customer);
            return Json(check);
        }
    }
}