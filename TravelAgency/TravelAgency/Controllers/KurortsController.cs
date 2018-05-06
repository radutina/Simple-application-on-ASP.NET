using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TravelAgency.Models;

namespace TravelAgency.Controllers
{
    public class KurortsController : Controller
    {
        private Model db = new Model();

        public ActionResult Index()
        {
            var kurorts = db.Kurorts.Include(k => k.country);
            return View(kurorts.ToList());
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Kurort kurort = db.Kurorts.Find(id);
            if (kurort == null)
            {
                return HttpNotFound();
            }
            return View(kurort);
        }

        public ActionResult Create()
        {
            ViewBag.id_country = new SelectList(db.Countries, "id_country", "name");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id_kurort,id_country,hotel,name,city,about")] Kurort kurort)
        {
            if (ModelState.IsValid)
            {
                db.Kurorts.Add(kurort);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.id_country = new SelectList(db.Countries, "id_country", "name", kurort.id_country);
            return View(kurort);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Kurort kurort = db.Kurorts.Find(id);
            if (kurort == null)
            {
                return HttpNotFound();
            }
            ViewBag.id_country = new SelectList(db.Countries, "id_country", "name", kurort.id_country);
            return View(kurort);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id_kurort,id_country,hotel,name,city,about")] Kurort kurort)
        {
            if (ModelState.IsValid)
            {
                db.Entry(kurort).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.id_country = new SelectList(db.Countries, "id_country", "name", kurort.id_country);
            return View(kurort);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Kurort kurort = db.Kurorts.Find(id);
            if (kurort == null)
            {
                return HttpNotFound();
            }
            return View(kurort);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Kurort kurort = db.Kurorts.Find(id);
            db.Kurorts.Remove(kurort);
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
