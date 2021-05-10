using Booking.Model.Model;
using Booking.Model.ModelView;
using Booking.Service.IService;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.Service
{
    public class UtilitiService : IUtilitiService
    {
        private readonly ICommonService _commonService;
        BookingEntities db = new BookingEntities();
        public UtilitiService(ICommonService commonService)
        {
            _commonService = commonService;
        }
        public async Task<bool> AddOrUpdate(Utiliti utiliti)
        {
            var response = (await _commonService.AddOrUpdate(utiliti)).isSuccess;
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

        public async Task<List<UtilitiesModelView>> GetUtilities()
        {
            List<UtilitiesModelView> data = new List<UtilitiesModelView>();
            var parent = await db.Utilitis.Where(x => x.ParentId == 0).ToListAsync();
            foreach(var item in parent)
            {
                var obj = new UtilitiesModelView()
                {
                    utiliti = item,
                    utilities = db.Utilitis.Where(x => x.ParentId == item.Id).ToList()
                };
                data.Add(obj);
            }
            return data;
        }
    }
}
