using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MangoERP.Models
{
    public class CustomerDto
    {
        public int customer_ID { get; set; }

        public string typedetail { get; set; }
        public int DeceasedId { get; set; }
         public string first_name { get; set; }
        public string last_name { get; set; }
        public string Contact { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public Nullable<System.DateTime> Creation_Date { get; set; }
        public string city { get; set; }
        public string country { get; set; }
        public string cnic { get; set; }
        public string Status { get; set; }
        public int GraveSizeId { get; set; }

        
        public Nullable<System.DateTime> date_of_birth { get; set; }
        public Nullable<int> GraveId { get; set; }
        public Nullable<System.DateTime> DeliveryDate { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }
        public string DeceasedPerson { get; set; }
        public string DeceasedCnic { get; set; }
        public string ReasonOfDeath { get; set; }
        public Nullable<System.DateTime> DateofDeath { get; set; }
        public Nullable<System.DateTime> DeceasedDateofBirth { get; set; }


    }
}