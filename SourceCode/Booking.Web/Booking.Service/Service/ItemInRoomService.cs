using Booking.Model.Model;
using Booking.Model.ModelView;
using Booking.Service.IService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.Service
{
    public class ItemInRoomService : IItemInRoomService
    {
        private readonly ICommonService _commonService;
        public ItemInRoomService(ICommonService commonService)
        {
            _commonService = commonService;
        }
        public async Task<bool> AddOrUpdate(ItemInRoom itemInRoom)
        {
            var response = await _commonService.AddOrUpdate(itemInRoom);
            return response;
        }

        public async Task<bool> DeleteById(int Id)
        {
            var response = await _commonService.DeleteById<Admin>(Id);
            return response;
        }

        public async Task<ResponseData<ItemInRoomViewModel>> GetListData(RequestData requestData)
        {
            var res = await _commonService.GetListData<ItemInRoom>(requestData);
            var response = new ResponseData<ItemInRoomViewModel>();
            var list = new List<ItemInRoomViewModel>();
            foreach (var item in res.data)
            {
                var obj = new ItemInRoomViewModel()
                {
                    itemInRoom = item,
                    unit = (await _commonService.GetListData<Unit>(new RequestData() { listFilter = null, isAsc = true, orderBy = "", pageNumber = 0, pageSize = 1 })).data.Where(x => x.Id == item.UnitId).FirstOrDefault()
                };
                list.Add(obj);
            }
            response.data = list;
            response.isAsc = res.isAsc;
            response.orderBy = res.orderBy;
            response.pageCount = res.pageCount;
            response.pageNumber = res.pageNumber;
            response.pageSize = res.pageSize;
            return response;
        }

        public async Task<ItemInRoom> GetObjectById(int Id)
        {
            var response = await _commonService.GetObjectById<ItemInRoom>(Id);
            return response;
        }
    }
}
