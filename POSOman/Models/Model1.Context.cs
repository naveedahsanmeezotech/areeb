﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MangoERP.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class dbPOS : DbContext
    {
        public dbPOS()
            : base("name=dbPOS")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUserRole> AspNetUserRoles { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Grave> Graves { get; set; }
        public virtual DbSet<Grave_Size> Grave_Size { get; set; }
        public virtual DbSet<Grave_Status> Grave_Status { get; set; }
        public virtual DbSet<PaymentCard> PaymentCards { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Purchase> Purchases { get; set; }
        public virtual DbSet<PurchaseDetail> PurchaseDetails { get; set; }
        public virtual DbSet<Quotation> Quotations { get; set; }
        public virtual DbSet<QuotationDetail> QuotationDetails { get; set; }
        public virtual DbSet<SaleOrder> SaleOrders { get; set; }
        public virtual DbSet<Section> Sections { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<UserAction_Log> UserAction_Log { get; set; }
        public virtual DbSet<Users_Log> Users_Log { get; set; }
        public virtual DbSet<StockLog> StockLogs { get; set; }
        public virtual DbSet<Vendor> Vendors { get; set; }
    }
}
