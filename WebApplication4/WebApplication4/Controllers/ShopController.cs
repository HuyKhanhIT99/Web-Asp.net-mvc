using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication4.Models;

namespace WebApplication4.Controllers
{
    public class ShopController : Controller
    {
        Model1 db = new Model1();
        // GET: Shop
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Category(int CategoryID = 0)
        {

            if (Session["USER_SESSION"] != null)
            {
                var user = Session["USER_SESSION"] as WebApplication4.UserLogin;
                ViewBag.acc = user.Username;
            }
            
            if (CategoryID != 0)
            {
               // ViewBag.TieuDe = db.Categories.SingleOrDefault(p => p.Name != null).Name;
                var model = db.Products.Where(p => p.Catalog_ID == CategoryID.ToString());
               // var product = (from p in db.Products where (p.Catalog_ID == "1") select p).ToList();
                return View(model);
            }

            return View();
        }
    }
}