using Booking.Model.Model;
using Booking.Model.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.IService
{
    public interface IUnitService
    {
        public Task<ResponseData<Unit>> GetListData(RequestData requestData);
        public Task<Unit> GetObjectById(int Id);
        public Task<bool> AddOrUpdate(Unit customer);
        public Task<bool> DeleteById(int Id);
    }
}
