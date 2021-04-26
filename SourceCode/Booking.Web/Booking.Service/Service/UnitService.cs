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
    public class UnitService : IUnitService
    {
        private readonly ICommonService _commonService;
        public UnitService(ICommonService commonService)
        {
            _commonService = commonService;
        }
        public async Task<bool> AddOrUpdate(Unit customer)
        {
            var response = await _commonService.AddOrUpdate(customer);
            return response;
        }

        public async Task<bool> DeleteById(int Id)
        {
            var response = await _commonService.DeleteById<Unit>(Id);
            return response;
        }

        public async Task<ResponseData<Unit>> GetListData(RequestData requestData)
        {
            var response = await _commonService.GetListData<Unit>(requestData);
            return response;
        }

        public async Task<Unit> GetObjectById(int Id)
        {
            var response = await _commonService.GetObjectById<Unit>(Id);
            return response;
        }
    }
}
