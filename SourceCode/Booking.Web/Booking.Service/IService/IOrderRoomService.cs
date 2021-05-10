using Booking.Model.Model;
using Booking.Model.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.IService
{
    public interface IOrderRoomService
    {
        public Task<ResponseData<OrderModelView>> GetListData(RequestData requestData);
        public Task<OrderRoom> GetObjectById(int Id);
        public Task<bool> AddOrUpdate(OrderRoom orderRoom,CustomerModelView customer);
        public Task<bool> DeleteById(int Id);
    }
}
