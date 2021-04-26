using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Model.ModelView
{
    public class ResultData
    {
        public bool success { get; set; }
        public List<ListError> error { get; set; }
    }
}
