using Booking.Model.Model;
using Booking.Model.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.IService
{
    public interface IRoomInBuildingService
    {
        public Task<ResponseData<RoomInBuilding>> GetListData(RequestData requestData);
        public Task<RoomInBuilding> GetObjectById(int Id);
        public Task<bool> AddOrUpdate(RoomInBuilding roomInBuilding, List<RoomInBuildingImage> images, List<RoomInBuildingItem> items,List<RoomInBuildingUtility> utilities);
        public Task<bool> DeleteById(int Id);
    }
}