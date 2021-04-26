using Booking.Model.Model;
using Booking.Model.ModelView;
using Booking.Service.IService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Booking.Service.Service
{
    public class LessorService : ILessorService
    {
        private readonly ICommonService _commonService;
        public LessorService(ICommonService commonService)
        {
            _commonService = commonService;
        }
        public async Task<bool> AddOrUpdate(TheLessor lessor)
        {
            var response = await _commonService.AddOrUpdate(lessor);
            return response;
        }

        public async Task<bool> DeleteById(int Id)
        {
            var response = await _commonService.DeleteById<TheLessor>(Id);
            return response;
        }

        public async Task<ResponseData<TheLessor>> GetListData(RequestData requestData)
        {
            var response = await _commonService.GetListData<TheLessor>(requestData);
            return response;
        }

        public async Task<TheLessor> GetObjectById(int Id)
        {
            var response = await _commonService.GetObjectById<TheLessor>(Id);
            return response;
        }
    }
}
