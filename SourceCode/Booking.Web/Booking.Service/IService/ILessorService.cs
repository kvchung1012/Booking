using Booking.Model.Model;
using Booking.Model.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.IService
{
    public interface ILessorService
    {
        public Task<ResponseData<TheLessor>> GetListData(RequestData requestData);
        public Task<TheLessor> GetObjectById(int Id);
        public Task<bool> AddOrUpdate(TheLessor theLessor);
        public Task<bool> DeleteById(int Id);
    }
}
