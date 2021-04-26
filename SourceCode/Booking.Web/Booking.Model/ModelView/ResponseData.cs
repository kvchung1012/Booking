using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Model.ModelView
{
    public class ResponseData<T>
    {
        public List<T> data { get; set; }
        public int pageCount { get; set; }
        public int pageNumber { get; set; }
        public int pageSize { get; set; }
        public string orderBy { get; set; }
        public bool isAsc { get; set; }
    }
}
