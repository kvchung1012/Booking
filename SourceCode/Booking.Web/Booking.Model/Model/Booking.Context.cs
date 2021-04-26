﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Booking.Model.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BookingEntities : DbContext
    {
        public BookingEntities()
            : base("name=BookingEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<BuildingForRent> BuildingForRents { get; set; }
        public virtual DbSet<BuildingForRentImage> BuildingForRentImages { get; set; }
        public virtual DbSet<CategoryHouse> CategoryHouses { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<ItemInRoom> ItemInRooms { get; set; }
        public virtual DbSet<OrderRoom> OrderRooms { get; set; }
        public virtual DbSet<RoomImage> RoomImages { get; set; }
        public virtual DbSet<RoomInBuilding> RoomInBuildings { get; set; }
        public virtual DbSet<RoomInBuildingItem> RoomInBuildingItems { get; set; }
        public virtual DbSet<RoomInBuildingPrice> RoomInBuildingPrices { get; set; }
        public virtual DbSet<TheLessor> TheLessors { get; set; }
        public virtual DbSet<Unit> Units { get; set; }
        public virtual DbSet<Utiliti> Utilitis { get; set; }
        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<District> Districts { get; set; }
        public virtual DbSet<Province> Provinces { get; set; }
        public virtual DbSet<DestinationPlace> DestinationPlaces { get; set; }
    }
}