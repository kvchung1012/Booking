using Booking.Model.Model;
using Booking.Model.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.IService
{
    public interface IUtilitiService
    {
        public Task<ResponseData<Utiliti>> GetListData(RequestData requestData);
        public Task<Utiliti> GetObjectById(int Id);
        public Task<bool> AddOrUpdate(Utiliti utiliti);
        public Task<bool> DeleteById(int Id);
    }
}
