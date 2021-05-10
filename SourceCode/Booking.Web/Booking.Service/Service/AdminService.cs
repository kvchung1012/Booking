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
    public class AdminService : IAdminService
    {
        private readonly ICommonService _commonService;
        private readonly BookingEntities db = new BookingEntities();
        public AdminService(ICommonService commonService)
        {
            _commonService = commonService;
        }
        public async Task<bool> AddOrUpdate(Admin admin)
        {
            var response = (await _commonService.AddOrUpdate(admin)).isSuccess;
            return response;
        }

        public async Task<bool> DeleteById(int Id)
        {
            var response = await _commonService.DeleteById<Admin>(Id);
            return response;
        }

        public async Task<ResponseData<Admin>> GetListData(RequestData requestData)
        {
            var response = await _commonService.GetListData<Admin>(requestData);
            return response;
        }

        public async Task<Admin> GetObjectById(int Id)
        {
            var response = await _commonService.GetObjectById<Admin>(Id);
            return response;
        }

        public async Task<Admin> Login(string email, string password)
        {
            var request = new RequestData()
            {
                listFilter = null,
                isAsc = true,
                orderBy = "",
                pageNumber = 0,
                pageSize = 1
            };
            var data = await _commonService.GetListData<Admin>(request);
            return data.data.Where(x => x.Email == email && x.Password == password && x.Status == true).FirstOrDefault();
        }

        public async Task<bool> ForgotPassword(string email,string pass)
        {
            var obj = db.Admins.Where(x => x.Email == email).FirstOrDefault();
            if(obj != null)
            {
                obj.Password = pass;
                db.SaveChanges();
                return true;
            }
            return false;
        }
    }
}
