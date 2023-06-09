using MangoERP.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;


namespace MangoERP.Controllers
{
    public class PurchaseReturnController : Controller
    {
        public dbPOS db = new dbPOS();
        public ActionResult Index1()
        {
            return View("Index", db.Purchases.Where(p => p.IsReturned == true ).ToList());

        //    return View("Index1", db.PurchaseReturns.Where(p =>  p.IsDeleted != true).ToList());
            //return View();
        }
        // GET: PurchaseReturn
        public ActionResult Index()
        {
            return View("Index", db.Purchases.Where(p => p.IsReturned == false  && p.GR !=null && p.IsDeleted != true).ToList());
            //return View();
        }
        public JsonResult getInvoiceDetails(int orderID)
        {
            if (orderID > 0)
            {
                try
                {
                    int branchId = 0;

                    if (Session["BranchID"] != null)
                    {
                        branchId = Convert.ToInt32(Session["BranchID"]);
                    }
                    else
                    {
                        var user = User.Identity;
                        string currentUserId = User.Identity.GetUserId();
                        var currentUser = db.AspNetUsers.FirstOrDefault(x => x.Id == currentUserId);
                        branchId = currentUser.BranchID;
                    }
                    var qry = db.PurchaseDetails.Where(p => p.PurchaseId == orderID)
                        .Select(p => new
                        {
                            
                            p.Purchase.TotalAmount,
                            p.Qty,
                            p.MaterailName,
                         
                            p.Price,
                            p.Amount,
                            p.Description,
                            p.MeasureOfUnit,
                       }).ToList();
                    return Json(new { qry }, JsonRequestBehavior.AllowGet);
                }
                catch (Exception ex)
                {
                    return Json(ex.Message.ToString());
                }

            }

            return Json("");

        }

        [HttpPost]
        //Edit Vendro 
        public JsonResult GrInvoice(int OrderId)
        {
            List<object> objectList = new List<object>();
            var ProductsList = db.PurchaseDetails.Where(x => x.PurchaseId == OrderId).Select(p => new { Price = p.Price, Qty = p.Qty, Description = p.Description, MeasureOfUnit = p.MeasureOfUnit, Amount = p.Amount, MaterailName = p.MaterailName, MaterailId = p.MaterailId }).ToList();

            var Order = db.Purchases.Where(x => x.Id == OrderId).FirstOrDefault();

            objectList.Add(new
            {
                PurchaseNo = Order.PurchaseNo,
                PostingDate = Order.PostingDate.ToString(),
                DocumnetDate = Order.DocumnetDate.ToString(),
                GRNO = Order.GR,
                ReferencePO = Order.ReferenceNumber,
                ProductsList = ProductsList


            });



            return Json(objectList, JsonRequestBehavior.AllowGet);

        }
        public ActionResult Create(int? Id)
        {
            var data = db.Purchases.Where(p => p.Id == Id).FirstOrDefault();
            ViewBag.Invoice = data?.PurchaseNo;
            ViewBag.VendorId = data?.VendorId;
            ViewBag.OrderId = Id;
            ViewBag.Total = data?.TotalAmount;

            // ViewBag.BranchID = branchId;
            ViewBag.vendor = data?.Vendor?.Vendor_Name;
            // ViewBag.vendorCode = db.Vendors.Select(v => new { Value = v.AccountID, Name = v.VendorCode }).ToList();
            ViewBag.Product = db.Products.Select(c => new { Value = c.Id, Name = c.MaterialName }).ToList();

            return View();
        }

        [HttpPost]
        public JsonResult ReturnPurchase(PurchaseReturn model, int? OrderId)
        {
            try
            {

                int branchId = 0;
                int userID = 0;
                string useridname = "";
                if (Session["BranchID"] != null && Session["UserID"] != null)
                {
                    branchId = Convert.ToInt32(Session["BranchID"]);
                    userID = Convert.ToInt32(Session["UserID"]);
                }
                else
                {
                    var user = User.Identity;
                    string currentUserId = User.Identity.GetUserId();
                    var currentUser = db.AspNetUsers.FirstOrDefault(x => x.Id == currentUserId);
                    branchId = currentUser.BranchID;
                    userID = currentUser.UserId;
                    useridname = currentUser.Id;
                }
              
                bool sucess = false;

                var ProductsList = db.PurchaseDetails.Where(x => x.PurchaseId == OrderId).ToList();
                int? qty = 0;
                foreach (var item in ProductsList)
                {
                    qty += item.Qty;
                }
                int? oldqty = 0;
                decimal? total = 0;
                foreach (var item in model.PurchaseReturnDetails)
                {
                    oldqty += item.Qty;
                    total = item.Qty * item.Price;
                }
                string data = "";
                if (qty == oldqty)
                {
                    sucess = true;
                    data = "No. of quantity in PO and Goods  Receipt are Equal";
                }
                if (qty > oldqty)
                {
                    sucess = true;
                    data = "No. of quantity in PO is Less";
                }
                if (qty < oldqty)
                {
                    data = "greater then No. of quantity in Goods Receipt";
                }

                model.TotalAmount = model.TotalAmount;
                model.UserID = useridname.ToString();
                model.PurchaseID = OrderId??0;
                model.IsDeleted = false;

                //var data = db.Quotations.Where(p => p.Id == OrderId).FirstOrDefault();
                //ViewBag.Invoice = data?.QuotationNo;
                //ViewBag.OrderId = OrderId;

                //// ViewBag.BranchID = branchId;
                //// int vend = data?.VendorId ? 0;
                //ViewBag.vendor = data?.Vendor?.Vendor_Name;
                //int? siod = 0;
                //var tmp = db.Purchases.OrderByDescending(v => v.Id).FirstOrDefault();
                //if (tmp != null)
                //{
                //    siod = tmp.PurchaseNo + 1;
                //}
                //else
                //{
                //    siod = 2000;
                //}
                //model.PurchaseNo = siod;
                //model.QutotationReferenceNo = data?.QuotationNo;
                //model.DateIssued = DateTime.Now;

                if (sucess)
                {
                    MangoERP.Models.BLL.OrderBookingBLL order = new Models.BLL.OrderBookingBLL();
                    object result = order.ReturnPurchase(model, OrderId);
                    return Json(result);
                }
                else
                {
                    return Json("Error");
                }
            }
            catch (Exception ex)
            {
                return Json("Error");

            }
        }


    }
}