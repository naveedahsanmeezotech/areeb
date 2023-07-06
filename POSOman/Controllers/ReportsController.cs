using MangoERP.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MangoERP.Controllers
{
    public class ReportsController : Controller
    {
        private dbPOS db = new dbPOS();

        // GET: Reports
        public ActionResult GraveReport()
        {
            return View();
        }
        public ActionResult Report1()
        {
            return View(db.Customers.ToList());
        }
        [HttpPost]
        public JsonResult Grave(string GraveId)
        {
            var Total = db.Graves.Count();

            List<object> objectList = new List<object>();

            if (GraveId != "Available")
            {
                var query = from grave in db.Graves
                            join graveDetail in db.GraveDetails on grave.Id  equals graveDetail.GraveId
                            where grave.Id == graveDetail.GraveId && graveDetail.Status == GraveId
                            select grave.Grave_Name;

               

                objectList.Add(new
                {

                    ProductsList = query,
                    Total = Total

                });



                return Json(objectList, JsonRequestBehavior.AllowGet);
            }
            else
            {
            //      var ProductsList = db.Graves.Where(x => x.Grave_Status_Id == 1).Select(p=>p.Grave_Name).ToList();

                var result = from table1 in db.Graves
                             join table2 in db.GraveDetails on table1.Id equals table2.GraveId
                             where table1.Id == table2.GraveId && (table2.Status == "Booked" || table2.Status == "Reserved")
                             select table1.Grave_Name;

                objectList.Add(new
                {

                    ProductsList = result,
                     Total = Total

                });



                return Json(objectList, JsonRequestBehavior.AllowGet);
            }

         
        }
    }
}