using MangoERP.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MangoERP.Controllers
{
    public class HomeController : Controller
    {
        ApplicationDbContext context;
        dbPOS db = new Models.dbPOS();
        public ActionResult Index()
        {
            if (User.Identity.IsAuthenticated)
            {
                context = new ApplicationDbContext();
                var user = User.Identity;
                string currentUserId = User.Identity.GetUserId();
                var BranchID = 0;
                var userID = 0;
                var currentUser = db.AspNetUsers.FirstOrDefault(x => x.Id == currentUserId);
                if (currentUser != null)
                {
                    BranchID = currentUser.BranchID;
                    userID = currentUser.UserId;
                    var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));
                    var s = UserManager.GetRoles(currentUserId);
                    ViewBag.userRole = s[0].ToString();
                    Session["userRole"] = s[0].ToString();
                }
                else
                {
                    return RedirectToAction("Login", "Account");
                }
                var temp = Session["BranchID"];
                Session["BranchID"] = BranchID;
                Session["UserID"] = userID;
               
                int? branches = 0;
                int? employee = 0;
                List<String> br = new List<string>();
             

                ViewBag.Branches = 8;


                return View("IndexNew");
            }
            else
                return RedirectToAction("Login", "Account");
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
