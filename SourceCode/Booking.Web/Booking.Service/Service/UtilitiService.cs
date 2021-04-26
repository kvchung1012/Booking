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
    public class UtilitiService : IUtilitiService
    {
        private readonly ICommonService _commonService;
        public UtilitiService(ICommonService commonService)
        {
            _commonService = commonService;
        }
        public async Task<bool> AddOrUpdate(Utiliti utiliti)
        {
            var response = await _commonService.AddOrUpdate(utiliti);
            return response;
        }

        public async Task<bool> DeleteById(int Id)
        {
            var response = await _commonService.DeleteById<Utiliti>(Id);
            return response;
        }

        public async Task<ResponseData<Utiliti>> GetListData(RequestData requestData)
        {
            var response = await _commonService.GetListData<Utiliti>(requestData);
            return response;
        }

        public async Task<Utiliti> GetObjectById(int Id)
        {
            var response = await _commonService.GetObjectById<Utiliti>(Id);
            return response;
        }
    }
}
