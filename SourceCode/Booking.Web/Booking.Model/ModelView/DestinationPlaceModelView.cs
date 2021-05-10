﻿using Booking.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Model.ModelView
{
    public class DestinationPlaceModelView
    {
        public DestinationPlace destination { get; set; }
        public List<BuildingForRent> buildings { get; set; }
    }
}