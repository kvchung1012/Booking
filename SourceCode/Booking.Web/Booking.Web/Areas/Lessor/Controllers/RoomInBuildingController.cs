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
    public class RoomInBuildingController : Controller
    {
        // GET: Lessor/RoomInBuilding
        IRoomInBuildingService _roomInBuildingService;
        IUtilitiService _utilitiService;
        IItemInRoomService _itemInRoomService;
        ICommonService _commonService;
        public RoomInBuildingController(ICommonService commonService,IRoomInBuildingService roomInBuildingService,IUtilitiService utilitiService,IItemInRoomService itemInRoomService)
        {
            _commonService = commonService;
            _roomInBuildingService = roomInBuildingService;
            _utilitiService = utilitiService;
            _itemInRoomService = itemInRoomService;
        }

        public ActionResult Index(int Id)
        {
            Session["BuildingId"] = Id;
            return View();
        }
        public async Task<PartialViewResult> GetListData(RequestData requestData)
        {
            if (requestData.listFilter == null)
                requestData.listFilter = new List<Model.ModelView.Filter>();
            requestData.listFilter.Add(new Model.ModelView.Filter() { key = "BuildingForRentId", value = (Session["BuildingId"]).ToString() });
            var response = await _roomInBuildingService.GetListData(requestData);
            return PartialView(response);
        }

        public async Task<ActionResult> Create()
        {
            var fake = new RequestData()
            {
                isAsc = true,
                listFilter = null,
                orderBy = null,
                pageNumber = 0,
                pageSize = 1
            };
            ViewBag.utiliti = (await _utilitiService.GetUtilities());
            ViewBag.item = (await _itemInRoomService.GetListData(fake)).data;
            return View();
        }
        public async Task<ActionResult> Edit(int Id)
        {
            var fake = new RequestData()
            {
                isAsc = true,
                listFilter = null,
                orderBy = null,
                pageNumber = 0,
                pageSize = 1
            };
            ViewBag.utiliti = (await _utilitiService.GetUtilities());
            ViewBag.item = (await _itemInRoomService.GetListData(fake)).data;

            //get data 
            fake.listFilter = new List<Model.ModelView.Filter>()
            {
                new Model.ModelView.Filter()
                {
                    key = "RoomInBuildingId",
                    value = Id.ToString(),
                },
            };
            ViewBag.images = (await _commonService.GetListData<RoomInBuildingImage>(fake)).data;
            ViewBag.utilities = (await _commonService.GetListData<RoomInBuildingUtility>(fake)).data;
            ViewBag.items = (await _commonService.GetListData<RoomInBuildingItem>(fake)).data;
            return View(await _roomInBuildingService.GetObjectById(Id));
        }

        [HttpPost]
        public async Task<JsonResult> AddOrUpdate(RoomInBuilding obj, List<RoomInBuildingImage> images, List<RoomInBuildingUtility> utilities,List<RoomInBuildingItem> items)
        {
            obj.BuildingForRentId = int.Parse(Session["BuildingId"].ToString());
            var fake = new RequestData() { 
                isAsc = true, 
                listFilter = new List<Model.ModelView.Filter>() { new Model.ModelView.Filter() { key= "RoomInBuildingId",value=obj.Id.ToString() } } , 
                orderBy = "", 
                pageNumber = 0, 
                pageSize = 1
            };
            // remove old images
            var oldImage = await _commonService.GetListData<RoomInBuildingImage>(fake);
            var _ = await _commonService.RemoveRange<RoomInBuildingImage>(oldImage.data);

            // remove old utilities
            var oldUtilities = await _commonService.GetListData<RoomInBuildingUtility>(fake);
            _ = await _commonService.RemoveRange<RoomInBuildingUtility>(oldUtilities.data);

            var oldItem = await _commonService.GetListData<RoomInBuildingItem>(fake);
            _ = await _commonService.RemoveRange<RoomInBuildingItem>(oldItem.data);

            var response = await _roomInBuildingService.AddOrUpdate(obj, images, items,utilities);
            return Json(new ResultData() { success = response, error = null });
        }
    }
}