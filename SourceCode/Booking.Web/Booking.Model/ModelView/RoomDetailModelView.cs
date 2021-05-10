using Booking.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Model.ModelView
{
    public class RoomDetailModelView
    {
        public List<RoomInBuildingImage>  images { get; set; }
        public List<ItemModelView> items { get; set; }
        public List<UtilitiesModelView> utiliti { get; set; }
    }
}
