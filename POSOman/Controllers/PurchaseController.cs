using MangoERP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MangoERP.Controllers
{
    public class PurchaseController : Controller
    {
        private dbPOS db = new dbPOS();
        public ActionResult Index()
        {
              return View(db.Quotations.Where(p=>p.Status==0).ToList());
            //return View();
        }
        public ActionResult IndexList()
        {
            return View(db.Purchases.Where(p => p.Status == 1).ToList());
            //return View();
        }
        // GET: Purchase
        public ActionResult Create()
        {
            //ViewBag.BankAccount = db.AccountDetails.Where(acd => acd.AccountTypeID == 27).Select(p => new { Value = p.AccountID, Name = p.AccountName + " | " + p.Bank }).ToList();
           // ViewBag.BranchID = branchId;
            ViewBag.vendor = db.Vendors.Select(v => new { Value = v.Vendor_ID, Name = v.Vendor_Name}).ToList();
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
        public ActionResult CreateBill(int? Id)
        {
            var data = db.Quotations.Where(p => p.Id == Id).FirstOrDefault();
            ViewBag.Invoice = data?.QuotationNo;
            ViewBag.VendorId = data?.VendorId;
            ViewBag.OrderId = Id;

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
            //{
            //    var PurchaseOrderInv = db.PurchaseOrders.Where(x => x.OrderID == OrderId).FirstOrDefault();
            //    var InvNo = PurchaseOrderInv.InvoiceNo;
            //    var qry = db.Vendors.Where(p => p.AccountID == PurchaseOrderInv.AccountID).Select(p => new { Value = p.AccountID, Name = p.VendorName }).FirstOrDefault();
            //    var qry1 = db.PurchaseOrders.Where(p => p.AccountID == PurchaseOrderInv.AccountID).Select(p => new { Value = p.BranchID, Name = p.Branch.BranchName }).FirstOrDefault();
            //    var qry2 = db.Vendors.Where(p => p.AccountID == PurchaseOrderInv.AccountID).Select(x => x.OpeningBalance).FirstOrDefault();
            //    var FinalAmount = (PurchaseOrderInv.VAT == 0 || PurchaseOrderInv.VAT == null) ? PurchaseOrderInv.TotalAmount : PurchaseOrderInv.TotalAmount + PurchaseOrderInv.VAT;
            //    var Discount = PurchaseOrderInv.DiscountAmount;
            //    string PurchaseDate = Convert.ToDateTime(PurchaseOrderInv.PurchaseDate).ToShortDateString();
            //    var SubAmount = PurchaseOrderInv.TotalAmount;
            //    var TotalAmount = PurchaseOrderInv.TotalAmount + PurchaseOrderInv.VAT;
            //    var Tax = PurchaseOrderInv.VAT;
            //    var AmountPaid = PurchaseOrderInv.AmountPaid;
            //    var Paytype = db.PaymentTypes.Where(x => x.PaymentTypeID == PurchaseOrderInv.PaymentTypeID).Select(x => new { Value = x.PaymentTypeID, Name = x.PaymentTypeName }).FirstOrDefault() == null ? null : db.PaymentTypes.Where(x => x.PaymentTypeID == PurchaseOrderInv.PaymentTypeID).Select(x => new { Value = x.PaymentTypeID, Name = x.PaymentTypeName }).FirstOrDefault();
            //    var Cheque = PurchaseOrderInv.ChequeNo;
            //    var ChqDate = PurchaseOrderInv.ChequeDate;
            var ProductsList = db.QuotationDetails.Where(x => x.QuotationId == OrderId).Select(p => new { Price = p.Price, Qty = p.Qty, Description = p.Description, MeasureOfUnit = p.MeasureOfUnit, Amount = p.Amount  , MaterailName = p.MaterailName,MaterailId = p.MaterailId}).ToList();
            //    //  var ProductsList = db.PODetails.Where(x => x.OrderID == OrderId).Select(p => new { ProductID = p.ProductID, Cat = p.Product.Category.CategoryName, Qty = p.Qty, SalePrice = p.SalePrice, Unit_Price = p.UnitPrice, PTotal = p.Total }).ToList();

            //    var Banks = db.AccountDetails.Where(acd => acd.AccountTypeID == 18).Select(p => new { Value = p.AccountID, Name = p.AccountName + " | " + p.Bank }).ToList();
            //    int BankId = 0;
            //    foreach (var i in Banks)
            //    {
            //        if (i.Name.Equals(PurchaseOrderInv.BankName))
            //        {
            //            BankId = i.Value;
            //        }
            //    }
            //var Bank = db.PurchaseOrders.Where(x => x.OrderID == OrderId).Select(p => new { Value = BankId, Name = p.BankName }).FirstOrDefault();



            //var PayStatus = 0;

            //if (PurchaseOrderInv.PaymentStatus == "UnPaid")
            //{
            //    PayStatus = 3;

            //}
            //else if (PurchaseOrderInv.PaymentStatus == "Paid")
            //{
            //    PayStatus = 1;

            //}
            //if (PurchaseOrderInv.PaymentStatus == "Partial Paid")
            //{
            //    PayStatus = 2;

            //}

                objectList.Add(new
                {
                    //Qry = qry,
                    //Qry1 = qry1,
                    //Qry2 = qry2,
                    //FinalAmount = FinalAmount,
                    //Discount = Discount,
                    //SalesDate = PurchaseDate,
                    //SubAmount = SubAmount,
                    //TotalAmount = TotalAmount,
                    //Tax = Tax,
                    //AmountPaid = AmountPaid,
                    //Paytype = Paytype,
                    //PayStatus = PayStatus,
                    //Cheque = Cheque,
                    //ChqDate = ChqDate,
                    //Bank = Bank,
                    //InvNo = InvNo,
                    ProductsList = ProductsList


                });


            
            return Json(objectList, JsonRequestBehavior.AllowGet);

        }
    }
}