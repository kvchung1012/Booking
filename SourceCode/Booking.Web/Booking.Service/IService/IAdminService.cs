using Booking.Model.Model;
using Booking.Model.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.IService
{
    public interface IAdminService
    {
        public Task<ResponseData<Admin>> GetListData(RequestData requestData);
        public Task<Admin> GetObjectById(int Id);
        public Task<bool> AddOrUpdate(Admin admin);
        public Task<bool> DeleteById(int Id);
        public Task<Admin> Login(string email, string password);
        public Task<bool> ForgotPassword(string email,string pass);
    }
}
