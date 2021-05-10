using Booking.Model.Model;
using Booking.Model.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.IService
{
    public interface IBuildingForRentService
    {
        public Task<ResponseData<BuildingForRent>> GetListData(RequestData requestData);
        public Task<BuildingForRent> GetObjectById(int Id);
        public Task<bool> AddOrUpdate(BuildingForRent theLessor,List<BuildingForRentImage> images, List<BuildingForRentUtilitis> utilities);
        public Task<bool> DeleteById(int Id);
    }
}
