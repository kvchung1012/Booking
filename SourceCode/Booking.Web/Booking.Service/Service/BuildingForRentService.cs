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
    public class BuildingForRentService : IBuildingForRentService
    {
        private readonly ICommonService _commonService;
        public BuildingForRentService(ICommonService commonService)
        {
            _commonService = commonService;
        }
        public async Task<bool> AddOrUpdate(BuildingForRent lessor, List<BuildingForRentImage> images, List<BuildingForRentUtilitis> utilities)
        {
            bool result = false;
            var response = (await _commonService.AddOrUpdate(lessor));
            if (response.isSuccess)
            {
                if (images == null)
                {
                    images = new List<BuildingForRentImage>();
                }
                if (utilities == null)
                {
                    utilities = new List<BuildingForRentUtilitis>();
                }
                images = images.Select(x => { x.BuildingForRentId = response.id; return x; }).ToList();
                utilities = utilities.Select(x => { x.BuildingForRentId = response.id; return x; }).ToList();
                result = await _commonService.InsertRange<BuildingForRentImage>(images);
                result = await _commonService.InsertRange<BuildingForRentUtilitis>(utilities);
            }
            return result;
        }

        public async Task<bool> DeleteById(int Id)
        {
            var response = await _commonService.DeleteById<BuildingForRent>(Id);
            return response;
        }

        public async Task<ResponseData<BuildingForRent>> GetListData(RequestData requestData)
        {
            var response = await _commonService.GetListData<BuildingForRent>(requestData);
            return response;
        }

        public async Task<BuildingForRent> GetObjectById(int Id)
        {
            var response = await _commonService.GetObjectById<BuildingForRent>(Id);
            return response;
        }
    }
}
