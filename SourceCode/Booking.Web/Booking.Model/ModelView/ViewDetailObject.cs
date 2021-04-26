using System;
using System.Collections.Generic;
using System.Text;

namespace Booking.Model.ModelView
{
    public class ViewDetailObject<T>
    {
        public T obj { get; set; }
        public string CreatedBy { get; set; }
        public string UpdatedBy { get; set; }
    }
}
