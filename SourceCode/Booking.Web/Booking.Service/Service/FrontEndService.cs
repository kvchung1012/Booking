using Booking.Model.Model;
using Booking.Model.ModelView;
using Booking.Service.IService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.Service
{
    public class FrontEndService : IFrontEndService
    {
        BookingEntities db = new BookingEntities();

        // trang chủ
        public List<FindBuildByProvince> GetBuildByProvince()
        {
            List<FindBuildByProvince> data = new List<FindBuildByProvince>();
            var provinces = db.Provinces.ToList();
            foreach (var item in provinces)
            {
                var destinations = db.DestinationPlaces.Where(x => x.ProvinceId == item.Id).ToList();
                List<BuildingForRent> buildings = new List<BuildingForRent>();
                foreach (var des in destinations)
                {
                    var build = db.BuildingForRents.Where(x => x.DestinationHouseId == des.Id).ToList();
                    buildings.AddRange(build);
                }
                FindBuildByProvince obj = new FindBuildByProvince()
                {
                    province = item,
                    buildings = buildings
                };
                data.Add(obj);
            }
            data = data.OrderBy(x => x.buildings.Count()).ToList();
            return data;
        }

        public List<CategoryHouseModelView> GetCategoryModelView()
        {
            List<CategoryHouseModelView> data = new List<CategoryHouseModelView>();
            foreach (var item in db.CategoryHouses.Where(x => x.IsDeleted == false && x.Status == true).ToList())
            {
                CategoryHouseModelView category = new CategoryHouseModelView()
                {
                    category = item,
                    buildings = db.BuildingForRents.Where(x => x.CategoryHouseId == item.Id).ToList()
                };
                data.Add(category);
            };
            return data.OrderBy(x => x.buildings.Count()).ToList();
        }

        public List<CategoryHouse> GetListCategoryHouse()
        {
            return db.CategoryHouses.Where(x => x.IsDeleted == false && x.Status == true).ToList();
        }

        public List<DestinationPlaceModelView> GetListDestinationPlaceModelView()
        {
            var data = (from b in db.BuildingForRents
                        group b by b.DestinationHouseId into g
                        join d in db.DestinationPlaces on g.Key equals d.Id
                        orderby g.Count() descending
                        select new DestinationPlaceModelView()
                        {
                            buildings = g.ToList(),
                            destination = d
                        }).ToList();
            return data;
        }

        public List<DestinationPlace> GetListDestinationPlace()
        {
            return db.DestinationPlaces.Where(x => x.IsDeleted == false && x.Status == true).ToList();
        }

        public List<BuildingForRentModelView> GetRoom(int? CategoryId, int? destinationId, DateTime? start, DateTime? end, int? Stock)
        {
            var data = db.BuildingForRents.Where(x => x.IsDeleted == false && x.Status == true).ToList();
            if (CategoryId != null && CategoryId > 0)
                data = data.Where(x => x.CategoryHouseId == CategoryId).ToList();
            if (destinationId != 0 && destinationId != null)
                data = data.Where(x => x.DestinationHouseId == destinationId).ToList();

            if (Stock != null)
                data = (from r in db.RoomInBuildings.Where(x => x.MaxPeople >= Stock).GroupBy(x => x.BuildingForRentId).ToList()
                        join d in data
                        on r.Key equals d.Id
                        select d).ToList();
            if (start != null && end != null)
            {
                foreach (var item in data)
                {
                    var rooms = db.RoomInBuildings.Where(x => x.BuildingForRentId == item.Id).ToList();
                    foreach (var room in rooms)
                    {
                        var count = db.OrderRooms.Where(x => x.RoomInBuildingId == room.Id && x.StartDate <= start && end <= x.EndDate).Count();
                        if (count >= room.Stock)
                        {
                            item.IsDeleted = true;
                        }
                    }
                }
            }
            data = data.Where(x => x.IsDeleted == false).ToList();
            List<BuildingForRentModelView> list = new List<BuildingForRentModelView>();
            foreach (var item in data)
            {
                var lessor = db.DestinationPlaces.Find(item.DestinationHouseId);
                var price = db.RoomInBuildings.Where(x => x.BuildingForRentId == item.Id).Count() == 0 ? "None" : (double)db.RoomInBuildings.Where(x => x.BuildingForRentId == item.Id).Average(x => x.Price) + "";
                BuildingForRentModelView build = new BuildingForRentModelView()
                {
                    building = item,
                    price = price,
                    location = db.Provinces.Find(lessor.ProvinceId).Name + ", " + db.Districts.Find(lessor.DistrictId).Name
                };
                list.Add(build);
            }
            return list;
        }

        // trang chi tiết

        public List<BuildingForRentImage> GetBuildingForRentImages(int Id)
        {
            return db.BuildingForRentImages.Where(x => x.BuildingForRentId == Id).ToList();
        }

        public BuildingForRent GetBuildingForRentById(int Id)
        {
            return db.BuildingForRents.Find(Id);
        }
        public CategoryHouse GetCategoryHouseById(int Id)
        {
            return db.CategoryHouses.Find(Id);
        }
        public List<UtilitiesModelView> GetUtilities(int Id)
        {
            var data = new List<UtilitiesModelView>();
            var parent = db.Utilitis.Where(x => x.IsDeleted == false && x.ParentId == 0).ToList();
            var utiliti = db.BuildingForRentUtilitis.Where(x => x.BuildingForRentId == Id).ToList();
            foreach (var item in parent)
            {
                var obj = new UtilitiesModelView();
                obj.utiliti = item;
                obj.utilities = new List<Utiliti>();
                foreach (var u in utiliti)
                {
                    var uti = db.Utilitis.Find(u.UtilitiId);
                    if (uti.ParentId == item.Id)
                        obj.utilities.Add(uti);
                }
                data.Add(obj);
            }
            return data;
        }


        public List<RoomInBuildingModelView> GetRoomInBuildings(int Id)
        {
            List<RoomInBuildingModelView> rooms = new List<RoomInBuildingModelView>();
            var data = db.RoomInBuildings.Where(x => x.BuildingForRentId == Id && x.IsDeleted == false).ToList();
            foreach (var item in data)
            {
                RoomInBuildingModelView obj = new RoomInBuildingModelView();
                obj.roomInBuilding = item;
                obj.images = db.RoomInBuildingImages.Where(x => x.RoomInBuildingId == item.Id).ToList();
                rooms.Add(obj);
            }
            return rooms;
        }
        public List<RoomInBuildingImage> GetImageRoomInBuildings(int Id)
        {
            return db.RoomInBuildingImages.Where(x => x.RoomInBuildingId == Id).ToList();
        }

        public RoomDetailModelView GetInforRoom(int Id)
        {
            RoomDetailModelView res = new RoomDetailModelView();
            // get data utilities
            var data = new List<UtilitiesModelView>();
            var parent = db.Utilitis.Where(x => x.IsDeleted == false && x.ParentId == 0).ToList();
            var utiliti = db.RoomInBuildingUtilities.Where(x => x.RoomInBuildingId == Id).ToList();
            foreach (var item in parent)
            {
                var obj = new UtilitiesModelView();
                obj.utiliti = item;
                obj.utilities = new List<Utiliti>();
                foreach (var u in utiliti)
                {
                    var uti = db.Utilitis.Find(u.UtilitiId);
                    if (uti.ParentId == item.Id)
                        obj.utilities.Add(uti);
                }
                if (obj.utilities.Count() > 0)
                    data.Add(obj);
            }

            // get data item
            var items = db.RoomInBuildingItems.Where(x => x.RoomInBuildingId == Id).ToList();
            List<ItemModelView> rooms = new List<ItemModelView>();
            foreach(var item in items)
            {
                var obj = db.ItemInRooms.Find(item.ItemId);
                if (obj != null)
                {
                    ItemModelView i = new ItemModelView();
                    i.item = obj;
                    i.stock = (int)item.Stock;
                    rooms.Add(i);

                }    
            }

            // get image
            var images = db.RoomInBuildingImages.Where(x => x.RoomInBuildingId == Id).ToList();

            res.images = images;
            res.items = rooms;
            res.utiliti = data;
            return res;
        }
    }
}
