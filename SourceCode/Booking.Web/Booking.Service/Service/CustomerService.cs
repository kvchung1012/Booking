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
    public class CustomerService : ICustomerService
    {
        private readonly ICommonService _commonService;
        public CustomerService(ICommonService commonService)
        {
            _commonService = commonService;
        }
        public async Task<bool> AddOrUpdate(Customer customer)
        {
            var response = (await _commonService.AddOrUpdate(customer)).isSuccess;
            return response;
        }

        public async Task<bool> DeleteById(int Id)
        {
            var response = await _commonService.DeleteById<Customer>(Id);
            return response;
        }

        public async Task<ResponseData<Customer>> GetListData(RequestData requestData)
        {
            var response = await _commonService.GetListData<Customer>(requestData);
            return response;
        }

        public async Task<Customer> GetObjectById(int Id)
        {
            var response = await _commonService.GetObjectById<Customer>(Id);
            return response;
        }
    }
}
