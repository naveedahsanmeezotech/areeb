//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class QuotationDetail
    {
        public int Id { get; set; }
        public int QuotationId { get; set; }
        public string MaterailName { get; set; }
        public Nullable<int> MaterailId { get; set; }
        public Nullable<int> Qty { get; set; }
        public Nullable<decimal> Price { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public string Description { get; set; }
    
        public virtual Product Product { get; set; }
        public virtual Quotation Quotation { get; set; }
    }
}
