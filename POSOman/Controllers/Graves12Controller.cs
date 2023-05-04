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
    public class Graves12Controller : Controller
    {
        private dbPOS db = new dbPOS();

        // GET: Graves12
        public ActionResult Index()
        {
            return View(db.Graves.ToList());
        }

        // GET: Graves12/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Grave grave = db.Graves.Find(id);
            if (grave == null)
            {
                return HttpNotFound();
            }
            return View(grave);
        }

        // GET: Graves12/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Graves12/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Section_Id,Grave_Name,Grave_Status_Id")] Grave grave)
        {
            if (ModelState.IsValid)
            {
                db.Graves.Add(grave);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(grave);
        }

        // GET: Graves12/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Grave grave = db.Graves.Find(id);
            if (grave == null)
            {
                return HttpNotFound();
            }
            return View(grave);
        }

        // POST: Graves12/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Section_Id,Grave_Name,Grave_Status_Id")] Grave grave)
        {
            if (ModelState.IsValid)
            {
                db.Entry(grave).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(grave);
        }

        // GET: Graves12/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Grave grave = db.Graves.Find(id);
            if (grave == null)
            {
                return HttpNotFound();
            }
            return View(grave);
        }

        // POST: Graves12/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Grave grave = db.Graves.Find(id);
            db.Graves.Remove(grave);
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
