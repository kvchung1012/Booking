using Booking.Model.Model;
using Booking.Model.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.IService
{
    public interface ICustomerService
    {
        public Task<ResponseData<Customer>> GetListData(RequestData requestData);
        public Task<Customer> GetObjectById(int Id);
        public Task<bool> AddOrUpdate(Customer customer);
        public Task<bool> DeleteById(int Id);
    }
}
