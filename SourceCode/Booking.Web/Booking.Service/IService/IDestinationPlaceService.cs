using Booking.Model.Model;
using Booking.Model.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.IService
{
    public interface IDestinationPlaceService
    {
        public Task<ResponseData<DestinationModelView>> GetListData(RequestData requestData);
        public Task<DestinationPlace> GetObjectById(int Id);
        public Task<bool> AddOrUpdate(DestinationPlace category);
        public Task<bool> DeleteById(int Id);
    }
}
