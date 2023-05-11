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
                    m.MeasureOfUnit = item.MeasureOfUnit;
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

        public object PurchaseSave(Purchase model)
        {
            dbPOS db = new dbPOS();


            try
            {
                Purchase q = new Purchase();
                q.PurchaseNo = model.PurchaseNo;
                q.ReferenceNumber = model.ReferenceNumber;
                q.QutotationReferenceNo = model.QutotationReferenceNo;
                q.DateIssued = DateTime.Now;
                q.VendorId = model.VendorId;
                q.Status = 1;
                q.TotalAmount = model.TotalAmount;

                q.ExpireDate = model.ExpireDate;
                db.Purchases.Add(q);
                var data = db.SaveChanges();

                foreach (var item in model.PurchaseDetails)
                {
                    PurchaseDetail m = new PurchaseDetail();
                    m.PurchaseId = q.Id;
                    m.MaterailId = item.MaterailId;
                    m.MaterailName = item.MaterailName;
                    m.Qty = item.Qty;
                    m.Price = item.Price;
                    m.Amount = item.Price * item.Qty;
                    m.MeasureOfUnit = item.MeasureOfUnit;
                    m.Description = item.Description;
                    db.PurchaseDetails.Add(m);
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