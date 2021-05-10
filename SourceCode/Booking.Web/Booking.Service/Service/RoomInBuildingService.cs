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
    public class RoomInBuildingService : IRoomInBuildingService
    {
        private readonly ICommonService _commonService;
        public RoomInBuildingService(ICommonService commonService)
        {
            _commonService = commonService;
        }
        public async Task<bool> AddOrUpdate(RoomInBuilding roomInBuilding, List<RoomInBuildingImage> images, List<RoomInBuildingItem> items, List<RoomInBuildingUtility> utilities)
        {
            bool result = false;
            var response = (await _commonService.AddOrUpdate(roomInBuilding));
            if (response.isSuccess)
            {
                if (images == null)
                {
                    images = new List<RoomInBuildingImage>();
                }
                if (utilities == null)
                {
                    utilities = new List<RoomInBuildingUtility>();
                }
                if(items == null)
                {
                    items = new List<RoomInBuildingItem>();
                }
                images = images.Select(x => { x.RoomInBuildingId = response.id; return x; }).ToList();
                utilities = utilities.Select(x => { x.RoomInBuildingId = response.id; return x; }).ToList();
                items = items.Select(x => { x.RoomInBuildingId = response.id; return x; }).ToList();
                result = await _commonService.InsertRange<RoomInBuildingImage>(images);
                result = await _commonService.InsertRange<RoomInBuildingUtility>(utilities);
                result = await _commonService.InsertRange<RoomInBuildingItem>(items);
            }
            return result;
        }

        public async Task<bool> DeleteById(int Id)
        {
            var response = await _commonService.DeleteById<RoomInBuilding>(Id);
            return response;
        }

        public async Task<ResponseData<RoomInBuilding>> GetListData(RequestData requestData)
        {
            var response = await _commonService.GetListData<RoomInBuilding>(requestData);
            return response;
        }

        public async Task<RoomInBuilding> GetObjectById(int Id)
        {
            var response = await _commonService.GetObjectById<RoomInBuilding>(Id);
            return response;
        }
    }
}
