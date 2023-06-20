using System;
using System.Collections.Generic;
using System.Data.Entity;
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
                    q.validTill = model.validTill;
                q.Status =1;
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



        public object GR(Purchase model,int? OrderId)
        {
            dbPOS db = new dbPOS();
            var value = db.Purchases.Where(p => p.Id == OrderId).FirstOrDefault();
            if(value !=null)
            {
                value.Status = 0;
            
                db.Entry(value).State = EntityState.Modified;
                db.SaveChanges();

            }
            try
            {
                Purchase q = new Purchase();
                q.DocumnetDate = model.DocumnetDate;
                q.PostingDate = model.PostingDate;
                q.GR = model.GR;


                q.PurchaseNo = value.PurchaseNo;
                q.ReferenceNumber = value.ReferenceNumber;
                q.QutotationReferenceNo = value.QutotationReferenceNo;
                q.DateIssued = value.DateIssued;
                q.VendorId = value.VendorId;



                q.Status = 2;
                q.TotalAmount = model.TotalAmount;

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
                    m.Remark = item.Remark;
                    db.PurchaseDetails.Add(m);
                    db.SaveChanges();


                    var srock = db.StockLogs.Where(p => p.MaterailId == item.MaterailId).FirstOrDefault();
                    if (srock != null)
                    {
                        srock.StockIn += item.Qty;
                        srock.MaterailName = item.MaterailName;

                        db.Entry(srock).State = EntityState.Modified;
                        db.SaveChanges();
                    }
                    else
                    {
                        try
                        {
                            StockLog swl = new StockLog();
                            swl.MaterailId = item.MaterailId;
                            swl.MaterailName = item.MaterailName;
                            swl.StockIn = item.Qty;
                            swl.StockOut = 0;
                            swl.Status = 1;
                            swl.Description = item.Description;

                            db.StockLogs.Add(swl);
                            db.SaveChanges();
                        }
                        catch (Exception ex)
                        {

                            throw;
                        }
                        
                    }
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


        public object ReturnPurchase(PurchaseReturn model, int? OrderId)
        {
            dbPOS db = new dbPOS();
            var value = db.Purchases.Where(p => p.Id == OrderId).FirstOrDefault();
            if (value != null)
            {
               // value.Status = 0;
                value.IsReturned = true;

                db.Entry(value).State = EntityState.Modified;
                db.SaveChanges();

            }
            try
            {
                PurchaseReturn q = new PurchaseReturn();

                q.InvoiceNo = model.InvoiceNo;
                q.ReturnDate = DateTime.Now;
                q.PurchaseID = model.PurchaseID;
                q.UserID = model.UserID;    
               
                q.TotalAmount = model.TotalAmount;

                db.PurchaseReturns.Add(q);
                var data = db.SaveChanges();

                foreach (var item in model.PurchaseReturnDetails)
                {
                    PurchaseReturnDetail m = new PurchaseReturnDetail();
                    m.PurchaseReturnId = q.PurchaseReturnID;
                    m.MaterailId = item.MaterailId;
                    m.MaterailName = item.MaterailName;
                    m.Qty = item.Qty;
                    m.Price = item.Price;
                    m.Amount = item.Price * item.Qty;
                    m.MeasureOfUnit = item.MeasureOfUnit;
                    m.Description = item.Description;
                    m.Remark = item.Remark;
                    db.PurchaseReturnDetails.Add(m);
                    db.SaveChanges();


                    var srock = db.StockLogs.Where(p => p.MaterailId == item.MaterailId).FirstOrDefault();
                    if (srock != null)
                    {
                        srock.StockIn -= item.Qty;
                        srock.MaterailName = item.MaterailName;

                        db.Entry(srock).State = EntityState.Modified;
                        db.SaveChanges();
                    }
                    else
                    {
                        StockLog sl = new StockLog();
                        sl.MaterailId = item.MaterailId;
                        sl.MaterailName = item.MaterailName;
                        sl.StockIn = item.Qty;
                        sl.Status = 1;
                        sl.Description = item.Description;
                        sl.StockOut = 0;

                        db.StockLogs.Add(sl);
                        db.SaveChanges();
                    }
                }


                //}
                //}
                return "Success";
            }

            catch (Exception ex)
            {
                return "ERROR";
                //  transaction.Rollback();
                //    return ex.Message;
            }

        }
    }
}