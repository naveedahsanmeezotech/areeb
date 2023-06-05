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
                Qry = Order.PurchaseNo,

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
    }
}