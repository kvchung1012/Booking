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
    public class DestinationPlaceService : IDestinationPlaceService
    {
        private readonly ICommonService _commonService;
        public DestinationPlaceService(ICommonService commonService)
        {
            _commonService = commonService;
        }
        public async Task<bool> AddOrUpdate(DestinationPlace category)
        {
            var response = (await _commonService.AddOrUpdate(category)).isSuccess;
            return response;
        }

        public async Task<bool> DeleteById(int Id)
        {
            var response = await _commonService.DeleteById<DestinationPlace>(Id);
            return response;
        }

        public async Task<ResponseData<DestinationModelView>> GetListData(RequestData requestData)
        {
            var res = await _commonService.GetListData<DestinationPlace>(requestData);
            var data = new List<DestinationModelView>();
            foreach(var item in res.data)
            {
                var obj = new DestinationModelView();
                obj.destination = item;
                string province = "", district = "";
                province = (await _commonService.GetListProvince()).Where(x => x.Id == item.ProvinceId).FirstOrDefault().Name;
                district = (await _commonService.GetListDistrictByProvinceId(0)).Where(x => x.Id == item.DistrictId).FirstOrDefault().Name;
                obj.district = district + ", " + province;
                data.Add(obj);
            }
            var response = new ResponseData<DestinationModelView>()
            {
                data = data,
                pageCount = res.pageCount,
                pageNumber = res.pageNumber,
                pageSize = res.pageSize,
                isAsc = res.isAsc,
                orderBy = res.orderBy,
            };
            return response;
        }

        public async Task<DestinationPlace> GetObjectById(int Id)
        {
            var response = await _commonService.GetObjectById<DestinationPlace>(Id);
            return response;
        }
    }
}
