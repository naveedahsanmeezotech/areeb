using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MangoERP.Models.BLL
{
    public class OrderBookingBLL
    {
        public object Save(Quotation model, List<QuotationDetail> modelStockLog)
        {
              dbPOS db = new dbPOS();

           
                try
                {
                    Quotation q = new Quotation();
                    q.ReferenceNumber = model.ReferenceNumber;
                    q.QuotationNo = model.QuotationNo;
                    q.DateIssued = DateTime.Now;
                    q.VendorId = model.VendorId;
                    q.Status = 0;
                    q.TotalAmount = model.TotalAmount;

                    q.ExpireDate = model.ExpireDate;
                    db.Quotations.Add(q);
                    var data = db.SaveChanges();
                   
                    foreach (var item in model.QuotationDetails)
                    {
                        QuotationDetail m = new QuotationDetail();
                       m.QuotationId= q.Id;
                       m.MaterailId = item.MaterailId;
                       m.MaterailName = item.MaterailName;
                        m.Qty = item.Qty;
                        m.Price = item.Price;
                        m.Amount = item.Price;
                  
                    m.Description = item.Description;
                        db.QuotationDetails.Add(m);
                        db.SaveChanges();

                    }


                    //}
                    //}
                    return "success";
                }
               
                catch (Exception ex)
                {
                    return "Fail";
                    //  transaction.Rollback();
                //    return ex.Message;
                }
            
        }

    }
}