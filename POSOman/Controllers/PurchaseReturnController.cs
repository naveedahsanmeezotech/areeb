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

    }
}