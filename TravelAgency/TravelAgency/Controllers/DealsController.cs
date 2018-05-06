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
    public class DealsController : Controller
    {
        private Model db = new Model();

        public ActionResult Index()
        {
            var deals = db.Deals.Include(d => d.customer).Include(d => d.eployee).Include(d => d.tour);
            return View(deals.ToList());
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Deal deal = db.Deals.Find(id);
            if (deal == null)
            {
                return HttpNotFound();
            }
            return View(deal);
        }

        public ActionResult Create()
        {
            ViewBag.id_customer = new SelectList(db.Customers, "id_customer", "first_name");
            ViewBag.id_employee = new SelectList(db.Employees, "id_employee", "first_name");
            ViewBag.id_tour = new SelectList(db.Tours, "id_tour", "name");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id_deal,id_tour,id_customer,id_employee,date")] Deal deal)
        {
            if (ModelState.IsValid)
            {
                db.Deals.Add(deal);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.id_customer = new SelectList(db.Customers, "id_customer", "first_name", deal.id_customer);
            ViewBag.id_employee = new SelectList(db.Employees, "id_employee", "first_name", deal.id_employee);
            ViewBag.id_tour = new SelectList(db.Tours, "id_tour", "name", deal.id_tour);
            return View(deal);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Deal deal = db.Deals.Find(id);
            if (deal == null)
            {
                return HttpNotFound();
            }
            ViewBag.id_customer = new SelectList(db.Customers, "id_customer", "first_name", deal.id_customer);
            ViewBag.id_employee = new SelectList(db.Employees, "id_employee", "first_name", deal.id_employee);
            ViewBag.id_tour = new SelectList(db.Tours, "id_tour", "name", deal.id_tour);
            return View(deal);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id_deal,id_tour,id_customer,id_employee,date")] Deal deal)
        {
            if (ModelState.IsValid)
            {
                db.Entry(deal).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.id_customer = new SelectList(db.Customers, "id_customer", "first_name", deal.id_customer);
            ViewBag.id_employee = new SelectList(db.Employees, "id_employee", "first_name", deal.id_employee);
            ViewBag.id_tour = new SelectList(db.Tours, "id_tour", "name", deal.id_tour);
            return View(deal);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Deal deal = db.Deals.Find(id);
            if (deal == null)
            {
                return HttpNotFound();
            }
            return View(deal);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Deal deal = db.Deals.Find(id);
            db.Deals.Remove(deal);
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
