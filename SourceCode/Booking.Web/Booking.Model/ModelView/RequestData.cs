using System;
using System.Collections.Generic;
using System.Text;

namespace Booking.Model.ModelView
{
    public class RequestData
    {
        public List<Filter> listFilter { get;set; }
        public int pageSize { get; set; }
        public int pageNumber { get; set; }
        public string orderBy { get; set; }
        public bool isAsc { get; set; }
    }
}
