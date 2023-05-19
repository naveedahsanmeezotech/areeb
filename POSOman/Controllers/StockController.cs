using MangoERP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MangoERP.Controllers
{
    [Authorize(Roles = "Admin")]

    public class StockController : Controller
    {
        private dbPOS db = new dbPOS();

        // GET: Stock
        public ActionResult Index()
        {
            return View(db.StockLogs.ToList());
        }
    }
}