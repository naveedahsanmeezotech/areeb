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
    
    public partial class GraveDetail
    {
        public int GraveDetail_ID { get; set; }
        public Nullable<System.DateTime> DeliveryDate { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }
        public string Status { get; set; }
        public Nullable<int> GraveId { get; set; }
        public Nullable<int> GraveSizeId { get; set; }
        public Nullable<System.DateTime> DateofDeath { get; set; }
        public Nullable<System.DateTime> DeceasedDateofBirth { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Grave Grave { get; set; }
        public virtual Grave_Size Grave_Size { get; set; }
    }
}
