using Booking.Model.Model;
using Booking.Model.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.IService
{
    public interface ICommonService
    {
        public Task<ResponseData<T>> GetListData<T>(RequestData requestData) where T : class;
        public Task<T> GetObjectById<T>(int Id) where T : class;
        public Task<ResultAdd> AddOrUpdate<T>(T obj) where T : class;
        public Task<bool> DeleteById<T>(int Id) where T : class;
        public Task<bool> InsertRange<T>(List<T> list) where T : class;
        public Task<bool> RemoveRange<T>(List<T> list) where T : class;
        // ulitity service
        public Task<bool> CheckDuplicate<T>(string Column, string Value) where T : class;
        public Task<List<Province>> GetListProvince();
        public Task<List<District>> GetListDistrictByProvinceId(int Id);
    }
}
