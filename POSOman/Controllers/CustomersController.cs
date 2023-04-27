using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MangoERP.Models;

namespace MangoERP.Controllers
{
    public class CustomersController : Controller
    {
        private dbPOS db = new dbPOS();

        // GET: Customers
        public ActionResult Index()
        {
            return View(db.Customers.ToList());
        }

        // GET: Customers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // GET: Customers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Customers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "customer_ID,first_name,last_name,Contact,Email,Address,Creation_Date,city,country,cnic,date_of_birth")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Customers.Add(customer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(customer);
        }

        // GET: Customers/Edit/5
        public ActionResult Edit(int? id,string Name)
        {


            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
           
            Customer customer = db.Customers.Where(o => o.GraveId == id).FirstOrDefault();
            if (customer == null)
            {
                TempData["GraveName"] = Name;
                TempData["GraveId"] = id;
                ViewBag.GraveId = id;
                return View("NotFound");
            }

            else
            {
                if(customer.Status == "Reserved" )
                {
                    ViewBag.hidden = "Reserved";
                }else
                {
                    ViewBag.hidden = "Booked";
                }

                ViewBag.hiddensize = customer.GraveSizeId;
                ViewBag.GraveName = Name;
                ViewBag.GraveId = customer.GraveId;

                ViewBag.dob = customer.date_of_birth;  // date of birth
                ViewBag.dod = customer.DeceasedDateofBirth;  // dof death 
                ViewBag.ood = customer.OrderDate;  //order data
                ViewBag.DeliveryDate = customer.DeliveryDate;  //delivery


                return View(customer);
            }
           
        }

        // POST: Customers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CustomerDto customer)
        {
            
            var data = db.Customers.Where(p=>p.customer_ID == customer.customer_ID).FirstOrDefault();
            if (data != null)
            {
                var grave = db.Graves.Where(p => p.Id == customer.GraveId).FirstOrDefault();
                if (customer.typedetail != null)
                {
                    if (customer.typedetail == "Booked")
                    {
                        data.DeceasedCnic = customer.DeceasedCnic;
                        data.DeceasedCnic = customer.DeceasedCnic;
                        data.ReasonOfDeath = customer.ReasonOfDeath;
                        data.Status = "Booked";

                         grave.Grave_Status_Id = 2;

                    }
                    else if (customer.typedetail == "Reserved")
                    {
                          grave.Grave_Status_Id = 3;
                        data.Status = "Reserved";

                    }
                }

                data.first_name = customer.first_name;
                data.last_name = customer.last_name;
                data.Address = customer.Address;
                data.Contact = customer.Contact;
                data.Email = customer.Email;
                data.city = customer.city;
                data.country = customer.country;
                data.cnic = customer.cnic;
                data.date_of_birth = customer.date_of_birth;
                data.Creation_Date = DateTime.Now;
                data.DeceasedPerson = customer.DeceasedPerson;
                data.DeceasedCnic = customer.DeceasedCnic;
                data.ReasonOfDeath = customer.ReasonOfDeath;
                data.DateofDeath = customer.DateofDeath;
                data.DeceasedDateofBirth = customer.DeceasedDateofBirth;
                data.Status = customer.Status;
                db.Entry(data).State = EntityState.Modified;
                db.SaveChanges();
              
                //   return RedirectToAction("/Graves/Index", db.Graves.ToList());
                return RedirectToAction("Index", "Graves", db.Graves.ToList());

            }
            else
            {
                return RedirectToAction("Index", "Graves", db.Graves.ToList());

            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AssignGrave(CustomerDto customer)
        {
            try
            {
                Customer po = new Customer();
                po.GraveId = customer.GraveId;
                po.first_name = customer.first_name;
                po.last_name = customer.last_name;
                po.Address = customer.Address;
                po.Contact = customer.Contact;
                po.Email = customer.Email;
                po.city = customer.city;
                po.country = customer.country;
                po.cnic = customer.cnic;
                po.date_of_birth = customer.date_of_birth;
                po.Creation_Date =DateTime.Now;
                po.DeliveryDate = customer.DeliveryDate;
                po.OrderDate = customer.OrderDate;
                po.DeceasedPerson = customer.DeceasedPerson;
                po.DeceasedCnic = customer.DeceasedCnic;
                po.ReasonOfDeath = customer.ReasonOfDeath;
                po.DateofDeath = customer.DateofDeath;
                po.DeceasedDateofBirth = customer.DeceasedDateofBirth;

                po.GraveSizeId = customer.GraveSizeId;


                if (customer.typedetail != null)
                {
                    if (customer.typedetail == "Booked")
                    {
                        po.DeceasedCnic = customer.DeceasedCnic;
                        po.DeceasedCnic = customer.DeceasedCnic;
                        po.ReasonOfDeath = customer.ReasonOfDeath;

                        po.Status = "Booked";
                    }
                    else if (customer.typedetail == "Reserved")
                    {
                        po.Status = "Reserved";
                    }
                }


                db.Customers.Add(po);
                db.SaveChanges();
                // return  statsu ki liye hia
                var data = db.Graves.Where(p => p.Id == customer.GraveId).FirstOrDefault();
                data.Grave_Status_Id = 2;
                if (customer.typedetail != null)
                {
                    if (customer.typedetail == "Booked")
                    {

                        data.Grave_Status_Id = 2;

                    }
                    else if (customer.typedetail == "Reserved")
                    {
                        data.Grave_Status_Id = 3;

                    }
                }
                db.Entry(data).State = EntityState.Modified;
                db.SaveChanges();

                // return  view ki liye hai 
                if (customer.typedetail != null)
                {
                    if (customer.typedetail == "Booked")
                    {
                     
                        return RedirectToAction("Payment", "Graves");

                    }else
                    {
                        return RedirectToAction("Index", "Graves", db.Graves.ToList());

                    }
                }
                return RedirectToAction("Payment", "Graves");
            }
            catch (Exception ex)
            {
                return RedirectToAction("Index", "Graves", db.Graves.ToList());

            }



            //ViewBag.Grave_Id = new SelectList(db.Graves, "Grave_Id", "section", customer.Grave_Id);

        }
        // GET: Customers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Customers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Customer customer = db.Customers.Find(id);
            db.Customers.Remove(customer);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
