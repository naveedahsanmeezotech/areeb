﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MangoERP.Models;
using ZXing;
using static MangoERP.Controllers.GravesController;
using Microsoft.AspNet.Identity;
using MangoERP.Models.BLL;
using Syncfusion.JavaScript.Models;

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
        public ActionResult Edit(int? id)
        {


            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Grave da = db.Graves.Where(o => o.Id == id).FirstOrDefault();


            Customer customer = db.Customers.Where(o => o.GraveDetail.GraveId == id).FirstOrDefault();
            if (customer == null)
            {
                TempData["GraveName"] = da.Grave_Name;
                TempData["GraveId"] = id;
                ViewBag.GraveId = id;
                return View("NotFound");
            }

            else
            {
               if (customer.GraveDetail.Status == "Reserved")
                {
                    ViewBag.hidden = "Reserved";
                }
                else
                {
                    ViewBag.hidden = "Booked";
                }

                ViewBag.hiddensize = customer.GraveDetail.GraveSizeId;
                ViewBag.GraveName = da.Grave_Name;
                ViewBag.GraveId = customer.GraveDetail.GraveId;

                ViewBag.dob = customer.date_of_birth;  // date of birth
                ViewBag.dod = customer.GraveDetail.DeceasedDateofBirth;  // dof death 
                ViewBag.ood = customer.GraveDetail.OrderDate;  //order data
                ViewBag.DeliveryDate = customer.GraveDetail.DeliveryDate;  //delivery


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

            var data = db.Customers.Where(p => p.customer_ID == customer.customer_ID).FirstOrDefault();
            if (data != null)
            {
                var grave = db.Graves.Where(p => p.Id == customer.GraveId).FirstOrDefault();
                if (customer.typedetail != null)
                {
                    if (customer.typedetail == "Booked")
                    {
                        data.GraveDetail.DeceasedCnic = customer.DeceasedCnic;
                        data.GraveDetail.DeceasedCnic = customer.DeceasedCnic;
                        data.GraveDetail.ReasonOfDeath = customer.ReasonOfDeath;
                        data.GraveDetail.Status = "Booked";

                        grave.Grave_Status_Id = 2;


                    }
                    else if (customer.typedetail == "Reserved")
                    {
                        grave.Grave_Status_Id = 3;
                        data.GraveDetail.Status = "Reserved";

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
                data.GraveDetail.DeceasedPerson = customer.DeceasedPerson;
                data.GraveDetail.DeceasedCnic = customer.DeceasedCnic;
                data.GraveDetail.ReasonOfDeath = customer.ReasonOfDeath;
                data.GraveDetail.DateofDeath = customer.DateofDeath;
                data.GraveDetail.DeceasedDateofBirth = customer.DeceasedDateofBirth;
                data.GraveDetail.Status = customer.Status;
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
                string userId = User.Identity.GetUserId();

                GraveDetail gd = new GraveDetail();

                Customer po = new Customer();
                po.first_name = customer.first_name;
                po.last_name = customer.last_name;
                po.Address = customer.Address;
                po.Contact = customer.Contact;
                po.Email = customer.Email;
                po.city = customer.city;
                po.country = customer.country;
                po.cnic = customer.cnic;
                po.UserId = userId;
                po.date_of_birth = customer.date_of_birth;
                po.Creation_Date =DateTime.Now;
                //po.DeceasedPerson = customer.DeceasedPerson;
                //po.DeceasedCnic = customer.DeceasedCnic;
                //po.ReasonOfDeath = customer.ReasonOfDeath;
                //po.DateofDeath = customer.DateofDeath;
                //po.DeceasedDateofBirth = customer.DeceasedDateofBirth;
               
              //  po.GraveSizeId = customer.GraveSizeId;


                if (customer.typedetail != null)
                {
                    if (customer.typedetail == "Booked")
                    {
                        gd.DeceasedCnic = customer.DeceasedCnic;
                        gd.DeceasedCnic = customer.DeceasedCnic;
                        gd.ReasonOfDeath = customer.ReasonOfDeath;
                        gd.GraveSizeId = customer.GraveSizeId;
                        gd.GraveId = customer.GraveId;

                        var stockless = db.Grave_Size.Where(p => p.Id == gd.GraveSizeId).FirstOrDefault();
                        if (stockless != null) {

                            //block 

                            var srock = db.StockLogs.Where(p => p.MaterailId == 1).FirstOrDefault();
                            if (srock != null)
                            {
                                srock.StockIn -= Convert.ToInt32(stockless.Blocks);
                                
                                db.Entry(srock).State = EntityState.Modified;
                                db.SaveChanges();
                            }
                            var Cement = db.StockLogs.Where(p => p.MaterailId ==2 ).FirstOrDefault();
                            if (Cement != null)
                            {
                                Cement.StockIn -= Convert.ToInt32(stockless.Cement);

                                db.Entry(Cement).State = EntityState.Modified;
                                db.SaveChanges();
                            }

                            var Slab = db.StockLogs.Where(p => p.MaterailId == 3).FirstOrDefault();
                            if (Slab != null)
                            {
                                Slab.StockIn -= Convert.ToInt32(stockless.Slab);

                                db.Entry(Slab).State = EntityState.Modified;
                                db.SaveChanges();
                            }
                           
                        }
                        gd.Status = "Booked";
                    }
                    else if (customer.typedetail == "Reserved")
                    {
                        gd.GraveId = customer.GraveId;
                        gd.GraveSizeId = customer.GraveSizeId;

                        gd.Status = "Reserved";
                    }
                }


                db.Customers.Add(po);
                db.SaveChanges();

               //     gd.date_of_birth = customer.date_of_birth;
                //      gd.Creation_Date =DateTime.Now;
                gd.GraveDetail_ID = po.customer_ID;

                gd.DeliveryDate = customer.DeliveryDate;
                gd.OrderDate = DateTime.Now;
                gd.DeceasedPerson = customer.DeceasedPerson;
                gd.DeceasedCnic = customer.DeceasedCnic;
                gd.ReasonOfDeath = customer.ReasonOfDeath;
                gd.DateofDeath = customer.DateofDeath;
                gd.DeceasedDateofBirth = customer.DeceasedDateofBirth;
             //   gd.GraveSizeId = customer.DeceasedDateofBirth;
                gd.DateofDeath = customer.date_of_birth;
               // gd.GraveSizeId = customer.GraveSizeId;
                db.GraveDetails.Add(gd);
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
                        return RedirectToAction("Payment", "Graves");

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

        [HttpPost]
        public JsonResult EditForm(int? id)
        {
            try
            {
                if (id == null)
                {
                    return Json(0);
                }
                Customer customer = db.Customers.Where(o => o.customer_ID == id).FirstOrDefault();
                var objec = customer.Contact;

              
                return Json(new
                {
                   first_name = customer.first_name,
                   last_name = customer.last_name,
                   Address = customer.Address,
                   Contact = customer.Contact,
                   Email = customer.Email,
                   city = customer.city,
                   country = customer.country,
                   cnic = customer.cnic,
                   date_of_birth = customer.date_of_birth.ToString(),
                    DeceasedPerson = customer.GraveDetail.DeceasedPerson,
                    DeceasedCnic = customer.GraveDetail.DeceasedCnic,
                    ReasonOfDeath = customer.GraveDetail.ReasonOfDeath,
                    DeliveryDate = customer.GraveDetail.DeliveryDate.ToString(),
                    DateofDeath = customer.GraveDetail.DateofDeath.ToString(),
                    DeceasedDateofBirth = customer.GraveDetail.DeceasedDateofBirth.ToString(),




                }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { result = "0" }); ;

                throw;
            }
     
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
