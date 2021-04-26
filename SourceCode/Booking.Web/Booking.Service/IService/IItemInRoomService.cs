using Booking.Model.Model;
using Booking.Model.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.IService
{
    public interface IItemInRoomService
    {
        public Task<ResponseData<ItemInRoomViewModel>> GetListData(RequestData requestData);
        public Task<ItemInRoom> GetObjectById(int Id);
        public Task<bool> AddOrUpdate(ItemInRoom itemInRoom);
        public Task<bool> DeleteById(int Id);
    }
}
