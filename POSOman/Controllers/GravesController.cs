using MangoERP.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace MangoERP.Controllers
{
    public class GravesController : Controller
    {
        // GET: GravesController
        private dbPOS db = new dbPOS();
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create( Grave grave)
        {
            if (ModelState.IsValid)
            {
                grave.Grave_Status_Id = 1;

                grave.Section_Id = 1;
                db.Graves.Add(grave);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(grave);
        }
        // GET: Graves
        public ActionResult Index()
        {
           
            var graves = db.Graves.ToList();
            return View(graves.ToList());
        }
        public ActionResult Payment()
        {
            var dataS = db.Customers.OrderByDescending(x => x.customer_ID).Select(x => x.customer_ID).First();
            ViewBag.id = dataS;
            return View();        
        }
        [HttpPost]
        public ActionResult Payment(Data po )
        {
            var card = db.PaymentCards.Where(p => p.Active && p.CardNumber==po.CardNumber).FirstOrDefault();
            if(card!=null)
            {
                Customer dataS = db.Customers.OrderByDescending(x => x.customer_ID).First();

                SaleOrder od = new SaleOrder();
                od.CustomerId = dataS.customer_ID;
                od.DeliveryDate = dataS.DeliveryDate;
                od.OrderDate = dataS.OrderDate;
                db.SaleOrders.Add(od);

                db.SaveChanges();
                return View("SaleOrder", db.Customers.ToList());
            }
            return View();
        }
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            ViewBag.hidden = db.Customers.Include(p => p.Grave).Where(p => p.customer_ID == id).Select(p => p.Status).FirstOrDefault();
            ViewBag.GraveName = db.Customers.Include(p => p.Grave).Where(p => p.customer_ID == id).Select(p=>p.Grave.Grave_Name).FirstOrDefault();
             ViewBag.Price = db.Customers.Include(p => p.Grave_Size).Where(p => p.customer_ID == id).Select(p => p.Grave_Size.Price).FirstOrDefault();
           ViewBag.Size = db.Customers.Include(p => p.Grave_Size).Where(p => p.customer_ID == id).Select(p => p.Grave_Size.Sizes).FirstOrDefault();
             //  ViewBag.Price = null;
           //  ViewBag.Size = null;

            ViewBag.Name = customer.first_name + customer.last_name;
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }
        public ActionResult SaleOrder()
        {
            return View(db.Customers.ToList());
        }

        public class Data
        {
            public int id { get; set; }
            public string CardNumber { get; set; }
        }
    }
}