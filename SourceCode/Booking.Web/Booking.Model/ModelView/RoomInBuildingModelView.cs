using Booking.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Model.ModelView
{
    public class RoomInBuildingModelView
    {
        public RoomInBuilding roomInBuilding { get; set; }
        public List<RoomInBuildingImage> images { get; set; }
    }
}
