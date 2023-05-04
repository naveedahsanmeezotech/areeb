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
        public JsonResult getNewPOID()
        {
            int? POID = 0;
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
    }
}