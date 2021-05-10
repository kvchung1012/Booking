using Booking.Model.Model;
using Booking.Model.ModelView;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.IService
{
    public interface IFrontEndService
    {
        public List<CategoryHouse> GetListCategoryHouse();
        public List<CategoryHouseModelView> GetCategoryModelView();
        public List<DestinationPlace> GetListDestinationPlace();
        public List<DestinationPlaceModelView> GetListDestinationPlaceModelView();
        public List<FindBuildByProvince> GetBuildByProvince();

        // get room
        public List<BuildingForRentModelView> GetRoom(int? CategoryId,int ?destinationId, DateTime ?start, DateTime ?end, int ?Stock);
        // trang chi tiết
        public List<BuildingForRentImage> GetBuildingForRentImages(int Id);
        public BuildingForRent GetBuildingForRentById(int Id);
        public CategoryHouse GetCategoryHouseById(int Id);
        public List<UtilitiesModelView> GetUtilities(int Id);

        public List<RoomInBuildingModelView> GetRoomInBuildings(int Id);
        public List<RoomInBuildingImage> GetImageRoomInBuildings(int Id);

        public RoomDetailModelView GetInforRoom(int Id);
    }
}
