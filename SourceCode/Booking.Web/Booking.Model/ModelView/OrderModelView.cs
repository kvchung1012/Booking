using Booking.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Model.ModelView
{
    public class OrderModelView
    {
        public OrderRoom orderRoom { get; set; }
        public Customer customer { get; set; }
        public RoomInBuilding room { get; set; }
        public BuildingForRent building { get; set; }
    }
}
