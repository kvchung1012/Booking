using Booking.Model.Model;
using Booking.Model.ModelView;
using Booking.Service.IService;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Booking.Service.Service
{
    public class OrderRoomService : IOrderRoomService
    {
        private readonly BookingEntities db = new BookingEntities();

        public async Task<bool> AddOrUpdate(OrderRoom orderRoom, CustomerModelView customer)
        {
            var cus = await db.Customers.Where(x => x.Phone == customer.Phone && x.Email == customer.Email).FirstOrDefaultAsync();
            int customerId = 0;
            if (cus == null)
            {
                var newCus = new Customer()
                {
                    Email = customer.Email,
                    Phone = customer.Phone,
                    Name = customer.Name,
                    CreatedDate = DateTime.Now,
                    CreatedBy = 1,
                    Status = true,
                    IsDeleted = false,
                };
                db.Customers.Add(newCus);
                db.SaveChanges();
                customerId = newCus.Id;
            }
            else
            {
                customerId = cus.Id;
            }
            if (orderRoom.Id == 0)
            {
                orderRoom.CustomerId = customerId;
                orderRoom.Status = true;
                orderRoom.IsDeleted = false;
                orderRoom.CreatedDate = DateTime.Now;
                db.OrderRooms.Add(orderRoom);
                var check = db.OrderRooms.Where(x => x.StartDate <= orderRoom.StartDate && x.EndDate >= orderRoom.EndDate).Count();
                var stock = db.RoomInBuildings.Find(orderRoom.RoomInBuildingId).Stock;
                if (check < stock)
                {
                    db.SaveChanges();
                    return true;
                }
                return false;
            }
            else
            {
                var old = db.OrderRooms.Find(orderRoom.Id);
                old.CustomerId = customerId;
                old.Stock = orderRoom.Stock;
                old.StartDate = orderRoom.StartDate;
                old.EndDate = orderRoom.EndDate;
                old.Status = orderRoom.Status;
                old.UpdatedDate = DateTime.Now;
                db.SaveChanges();
                return true;
            }
        }

        public async Task<bool> DeleteById(int Id)
        {
            var old = await db.OrderRooms.FindAsync(Id);
            old.IsDeleted = true;
            return true;
        }

        public async Task<ResponseData<OrderModelView>> GetListData(RequestData requestData)
        {
            try
            {
                var data = await db.OrderRooms.Where(x=>x.IsDeleted == false).ToListAsync();
                // get total records
                var totalRecords = data.Count();
                // filter
                if (requestData.listFilter != null)
                {
                    foreach (var filter in requestData.listFilter)
                    {
                        data = data.Where(x => x.GetType().GetProperty(filter.key).GetValue(x).ToString().ToLower().Equals(filter.value.ToLower())).ToList();
                    }
                    totalRecords = data.Count();
                }

                // sort by
                if (!String.IsNullOrEmpty(requestData.orderBy))
                {
                    if (requestData.isAsc)
                        data = data.OrderBy(x => x.GetType().GetProperty(requestData.orderBy).GetValue(x, null)).ToList();
                    else
                        data = data = data.OrderByDescending(x => x.GetType().GetProperty(requestData.orderBy).GetValue(x, null)).ToList();
                }
                //pagination
                if (requestData.pageNumber != 0)
                {
                    data = data.Skip(requestData.pageSize * (requestData.pageNumber - 1)).Take(requestData.pageSize).ToList();
                }
                List<OrderModelView> list = new List<OrderModelView>();
                foreach(var item in data)
                {
                    OrderModelView order = new OrderModelView()
                    {
                        orderRoom = item,
                        customer = db.Customers.Find(item.CustomerId),
                        room = db.RoomInBuildings.Find(item.RoomInBuildingId),
                        building = db.BuildingForRents.Find(db.RoomInBuildings.Find(item.RoomInBuildingId).BuildingForRentId)
                    };
                    list.Add(order);
                }

                ResponseData<OrderModelView> responseData = new ResponseData<OrderModelView>()
                {
                    data = list,
                    pageCount = totalRecords % requestData.pageSize == 0 ? totalRecords / requestData.pageSize : totalRecords / requestData.pageSize + 1,
                    pageNumber = requestData.pageNumber,
                    pageSize = requestData.pageSize,
                    orderBy = requestData.orderBy,
                    isAsc = requestData.isAsc
                };
                return responseData;
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public async Task<OrderRoom> GetObjectById(int Id)
        {
            return await db.OrderRooms.FindAsync(Id);
        }
    }
}
