using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Booking.Service.IService;
using Booking.Model.ModelView;
using Booking.Model.Model;
using System.Data.Entity;
using System.Web;

namespace Booking.Service.Service
{
    public class CommonService : ICommonService
    {
        private readonly BookingEntities db = new BookingEntities();
        public async Task<ResponseData<T>> GetListData<T>(RequestData requestData) where T : class
        {
            // 1. filter
            // 2. sort by key
            // 3. pagination
            // 4. return
            try
            {
                var data = await db.Set<T>().ToListAsync();
                data = data.Where(x => typeof(T).GetProperty("IsDeleted") != null && x.GetType().GetProperty("IsDeleted").GetValue(x, null).ToString() == false.ToString()).ToList();
                // get total records
                var totalRecords = data.Count();
                // filter
                if (requestData.listFilter != null)
                {
                    foreach (var filter in requestData.listFilter)
                    {
                        data = data.Where(x => x.GetType().GetProperty(filter.key).GetValue(x).ToString().ToLower().Contains(filter.value.ToLower())).ToList();
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

                ResponseData<T> responseData = new ResponseData<T>()
                {
                    data = data,
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
        public async Task<T> GetObjectById<T>(int Id) where T : class
        {
            return await db.Set<T>().FindAsync(Id);
        }
        public async Task<bool> DeleteById<T>(int Id) where T : class
        {
            try
            {
                var obj = db.Set<T>().Find(Id);
                if (obj.GetType().GetProperty("IsDeleted") != null)
                    obj.GetType().GetProperty("IsDeleted").SetValue(obj, true);
                else
                    db.Set<T>().Remove(obj);
                await db.SaveChangesAsync();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public async Task<bool> AddOrUpdate<T>(T obj) where T : class
        {
            try
            {
                var DbSet = db.Set<T>();
                var Id = obj.GetType().GetProperty("Id").GetValue(obj).ToString();
                if (Id == "0")
                {
                    if (typeof(T).GetProperty("CreatedBy") != null)
                    {
                        obj.GetType().GetProperty("CreatedBy").SetValue(obj, (HttpContext.Current.Session["Admin"] as Admin) == null ? 0 : (HttpContext.Current.Session["Admin"] as Admin).Id);
                    }

                    if (typeof(T).GetProperty("CreatedDate") != null)
                    {
                        obj.GetType().GetProperty("CreatedDate").SetValue(obj, DateTime.Now);
                    }

                    if (typeof(T).GetProperty("IsDeleted") != null)
                    {
                        obj.GetType().GetProperty("IsDeleted").SetValue(obj, false);
                    }
                    DbSet.Add(obj);
                    await db.SaveChangesAsync();
                }
                else
                {
                    var o = DbSet.Find(int.Parse(Id));
                    var property = o.GetType().GetProperties();
                    foreach (var field in property)
                    {
                        if (field.GetValue(obj) != null)
                            field.SetValue(o, field.GetValue(obj));
                    }
                    if (typeof(T).GetProperty("UpdatedBy") != null)
                    {
                        o.GetType().GetProperty("UpdatedBy").SetValue(o, (HttpContext.Current.Session["Admin"] as Admin) == null ? 0 : (HttpContext.Current.Session["Admin"] as Admin).Id);
                    }
                    if (typeof(T).GetProperty("UpdatedDate") != null)
                    {
                        o.GetType().GetProperty("UpdatedDate").SetValue(o, DateTime.Now);
                    }
                    if (typeof(T).GetProperty("IsDeleted") != null)
                    {
                        o.GetType().GetProperty("IsDeleted").SetValue(o, false);
                    }
                    await db.SaveChangesAsync();
                }
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
        public async Task<bool> CheckDuplicate<T>(string Column, string Value) where T : class
        {
            var dbSet = await db.Set<T>().ToListAsync();
            return dbSet.Where(x => x.GetType().GetProperty(Column).GetValue(x).Equals(Value)).Count() > 0;
        }
        public async Task<List<Province>> GetListProvince()
        {
            var list = await db.Provinces.ToListAsync();
            return list;
        }
        public async Task<List<District>> GetListDistrictByProvinceId(int Id)
        {
            if(Id ==0)
                return await db.Districts.ToListAsync();
            return await db.Districts.Where(x=>x.ProvinceId == Id).ToListAsync();
        }
    }
}
