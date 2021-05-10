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
    public class CategoryHouseService : ICategoryHouseService
    {
        private readonly ICommonService _commonService;
        public CategoryHouseService(ICommonService commonService)
        {
            _commonService = commonService;
        }
        public async Task<bool> AddOrUpdate(CategoryHouse category)
        {
            var response = (await _commonService.AddOrUpdate(category)).isSuccess;
            return response;
        }

        public async Task<bool> DeleteById(int Id)
        {
            var response = await _commonService.DeleteById<CategoryHouse>(Id);
            return response;
        }

        public async Task<ResponseData<CategoryHouse>> GetListData(RequestData requestData)
        {
            var response = await _commonService.GetListData<CategoryHouse>(requestData);
            return response;
        }

        public async Task<CategoryHouse> GetObjectById(int Id)
        {
            var response = await _commonService.GetObjectById<CategoryHouse>(Id);
            return response;
        }
    }
}
