using Booking.Model.Model;
using Booking.Model.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.IService
{
    public interface ICategoryHouseService
    {
        public Task<ResponseData<CategoryHouse>> GetListData(RequestData requestData);
        public Task<CategoryHouse> GetObjectById(int Id);
        public Task<bool> AddOrUpdate(CategoryHouse category);
        public Task<bool> DeleteById(int Id);
    }
}
