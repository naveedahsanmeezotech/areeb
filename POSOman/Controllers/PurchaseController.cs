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
    public class PurchaseController : Controller
    {
        private dbPOS db = new dbPOS();
        public ActionResult Index()
        {
            //         return View(db.Quotations.Where(p=>p.Status==1).ToList());
            return View(db.Quotations.Where(p=>p.Vendor.Status=="Active").ToList());

        }
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //tbl_PurchaseOrder purchaseOrder = db.tbl_PurchaseOrder.Find(id);
            List<PurchaseDetail> _PODetails = db.PurchaseDetails.Where(p => p.PurchaseId == id).ToList();
           
            if (_PODetails == null)
            {
                return HttpNotFound();
            }
            return PartialView("_Invoice", _PODetails);
        }
        public ActionResult Detailsq(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //tbl_PurchaseOrder purchaseOrder = db.tbl_PurchaseOrder.Find(id);
            List<QuotationDetail> _PODetails = db.QuotationDetails.Where(p => p.QuotationId == id).ToList();

            if (_PODetails == null)
            {
                return HttpNotFound();
            }
            return PartialView("_QuotationDetails", _PODetails);
        }
        public ActionResult GRIndexList()
        {
            //            return View(db.Purchases.Where(p => p.Status == 2).ToList());
            return View(db.Purchases.Where(p => p.Status == 2).ToList());

            //return View();
        }
        public ActionResult IndexList()
        {
            return View(db.Purchases.Where(p => p.Status != 2).ToList());
            //return View();
        }
        // GET: Purchase
        public ActionResult Create()
        {
            //ViewBag.BankAccount = db.AccountDetails.Where(acd => acd.AccountTypeID == 27).Select(p => new { Value = p.AccountID, Name = p.AccountName + " | " + p.Bank }).ToList();
           // ViewBag.BranchID = branchId;
            ViewBag.vendor = db.Vendors.Where(p=>p.Status== "Active").Select(v => new { Value = v.Vendor_ID, Name = v.Vendor_Name}).ToList();
           // ViewBag.vendorCode = db.Vendors.Select(v => new { Value = v.AccountID, Name = v.VendorCode }).ToList();
            ViewBag.Product = db.Products.Select(c => new { Value = c.Id, Name = c.MaterialName }).ToList();
              return View();
            //return View();
        }
        [HttpPost]
        public JsonResult SaveQuotationDetail(Quotation model, List<QuotationDetail> modelStockLog)
        {
            //int branchId = 0;
            //int userID = 0;
            //if (Session["BranchID"] != null && Session["UserID"] != null)
            //{
            //    branchId = Convert.ToInt32(Session["BranchID"]);
            //    userID = Convert.ToInt32(Session["UserID"]);
            //}
            //else
            //{
            //    var user = User.Identity;
            //    string currentUserId = User.Identity.GetUserId();
            //    var currentUser = db.AspNetUsers.FirstOrDefault(x => x.Id == currentUserId);
            //    branchId = currentUser.BranchID;
            //    userID = currentUser.UserId;
            //}
            //model.AddBy = userID;
            //model.BranchID = branchId;
            MangoERP.Models.BLL.OrderBookingBLL order = new Models.BLL.OrderBookingBLL();
            object result = order.Save(model, modelStockLog);
            return Json(result);
        }
        [HttpPost]
        public JsonResult SavePurchaseDetail(Purchase model,int? OrderId)
        {

            var data = db.Quotations.Where(p => p.Id == OrderId).FirstOrDefault();

             if(data !=null)
            {
                data.Status = 0;
               db.Entry(data).State = EntityState.Modified;
                db.SaveChanges();
            }
            ViewBag.Invoice = data?.QuotationNo;
             ViewBag.OrderId = OrderId;

            // ViewBag.BranchID = branchId;
           // int vend = data?.VendorId ? 0;
            ViewBag.vendor = data?.Vendor?.Vendor_Name;
            int? siod = 0;
            var tmp = db.Purchases.OrderByDescending(v => v.Id).FirstOrDefault();
            if (tmp != null)
            {
                siod = tmp.PurchaseNo + 1;
            }
            else
            {
                siod = 2000;
            }
            model.PurchaseNo = siod;
            model.QutotationReferenceNo  = data?.QuotationNo;
            model.DateIssued = DateTime.Now;

            //int branchId = 0;
            //int userID = 0;
            //if (Session["BranchID"] != null && Session["UserID"] != null)
            //{
            //    branchId = Convert.ToInt32(Session["BranchID"]);
            //    userID = Convert.ToInt32(Session["UserID"]);
            //}
            //else
            //{
            //    var user = User.Identity;
            //    string currentUserId = User.Identity.GetUserId();
            //    var currentUser = db.AspNetUsers.FirstOrDefault(x => x.Id == currentUserId);
            //    branchId = currentUser.BranchID;
            //    userID = currentUser.UserId;
            //}
            //model.AddBy = userID;
            //model.BranchID = branchId;
             MangoERP.Models.BLL.OrderBookingBLL order = new Models.BLL.OrderBookingBLL();
              object result = order.PurchaseSave(model);
            return Json(result);
        }
        public JsonResult getNewPurchase()
        {
            int? POID = 0;
            var tmp = db.Purchases.OrderByDescending(v => v.Id).FirstOrDefault();
            if (tmp != null)
            {
                POID = tmp.PurchaseNo + 1;
            }
            else
            {
                POID = 2000;
            }

                return Json(POID, JsonRequestBehavior.AllowGet);
        }

        public JsonResult getNewPOID()
        {
            int? POID = 0;
            var tmp = db.Quotations.OrderByDescending(v => v.Id).FirstOrDefault();
            if (tmp != null)
            {
                POID = tmp.QuotationNo + 1;
            }
            else
            {
                POID = 1000;
            }

            return Json(POID, JsonRequestBehavior.AllowGet);
        }
        public JsonResult getGR()
        {
            Random random = new Random();
            int randomNumber = random.Next(1, 501); // Generate a random integer between 1 and 100


            return Json(randomNumber, JsonRequestBehavior.AllowGet);
        }
        public ActionResult CreateBill(int? Id)
        {
            var data = db.Quotations.Where(p => p.Id == Id).FirstOrDefault();
            ViewBag.Invoice = data?.QuotationNo;
            ViewBag.VendorId = data?.VendorId;
            ViewBag.OrderId = Id; 
            ViewBag.Total = data?.TotalAmount;

            // ViewBag.BranchID = branchId;
            ViewBag.vendor = data?.Vendor?.Vendor_Name;
            // ViewBag.vendorCode = db.Vendors.Select(v => new { Value = v.AccountID, Name = v.VendorCode }).ToList();
            ViewBag.Product = db.Products.Select(c => new { Value = c.Id, Name = c.MaterialName }).ToList();

            return View();
        }

        public ActionResult CreateGR(int? Id)
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
        //Edit Vendro 
        public JsonResult GetEditInvoiceVendor(int OrderId)
        {
            List<object> objectList = new List<object>();
           var ProductsList = db.QuotationDetails.Where(x => x.QuotationId == OrderId).Select(p => new { Price = p.Price, Qty = p.Qty, Description = p.Description, MeasureOfUnit = p.MeasureOfUnit, Amount = p.Amount  , MaterailName = p.MaterailName,MaterailId = p.MaterailId}).ToList();
        

                objectList.Add(new
                {
                  
                    ProductsList = ProductsList


                });


            
            return Json(objectList, JsonRequestBehavior.AllowGet);

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
                Qry = Order.PurchaseNo,
               
                ProductsList = ProductsList


            });



            return Json(objectList, JsonRequestBehavior.AllowGet);

        }

        public JsonResult getProductDetail(int productId)
        {
            try
            {
                //int branchId = 0;

                //if (Session["BranchID"] != null)
                //{
                //    branchId = Convert.ToInt32(Session["BranchID"]);
                //}
                //else
                //{
                //    var user = User.Identity;
                //    string currentUserId = User.Identity.GetUserId();
                //    var currentUser = db.AspNetUsers.FirstOrDefault(x => x.Id == currentUserId);
                //    branchId = currentUser.BranchID;
                //}
                var qry = db.Products.Where(p => p.Id == productId).Select(p => new {

                    MaterialName = p.MaterialName,
                    Id = p.Id,

                    Description = p.Description,
                    UnitOfMeasure = p.UnitOfMeasure,


                }).FirstOrDefault();

                return Json(qry);
            }
            catch (Exception ex)
            {
                return Json(ex.Message.ToString());
            }

            // return Json("null data");
        }


        [HttpPost]
        public JsonResult GR(Purchase model, int? OrderId)
        {
            try
            {

           
            var ProductsList = db.PurchaseDetails.Where(x => x.PurchaseId == OrderId).ToList();
            int? qty = 0;
            foreach (var item in ProductsList)
            {
                qty += item.Qty;
            }
            int? oldqty = 0;
            foreach (var item in model.PurchaseDetails)
            {
                oldqty += item.Qty;
            }
            string data = "";
            if(qty ==oldqty)
            {
                data = "No. of quantity in PO and Goods  Receipt are Equal";
            }
            if (qty > oldqty)
            {
                data = "No. of quantity in PO is Less";
            }
            if (qty < oldqty)
            {
                data = "greater then No. of quantity in Goods Receipt";
            }

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


            MangoERP.Models.BLL.OrderBookingBLL order = new Models.BLL.OrderBookingBLL();
            object result = order.GR(model, OrderId);
            return Json(data);
            }
            catch (Exception ex)
            {
                return Json("");

            }
        }


    }
}