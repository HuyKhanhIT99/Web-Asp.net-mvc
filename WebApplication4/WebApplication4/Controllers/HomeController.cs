using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Mvc;
using WebApplication4.Models;


namespace WebApplication4.Controllers
{
    public class HomeController : Controller
    {
        Model1 db = new Model1();
        public ActionResult Index()
        {

            if(Session["USER_SESSION"] != null)
            {
                var user = Session["USER_SESSION"] as WebApplication4.UserLogin;
                ViewBag.acc = user.Username;
            }
          
            var product = (from p in db.Products where (p.Catalog_ID == "1") select p).ToList();
            String html = " ";

            String htmlTabMayTinh = "";
            for (int tabMayTinh = 0; tabMayTinh < 2; tabMayTinh++)
            {
                htmlTabMayTinh += "<div class=\"col-sm-3\">"
                               + " <div class=\"product-image-wrapper\">"
                               + "<div class=\"single-products\">"
                               + "<div class=\"productinfo text-center\">"
                               + "   <img src=\"/Content/images/shop/" + product[tabMayTinh].productImage + ".jpg\"/>"
                               + "<h2>"+product[tabMayTinh].Price+"</h2>"
                               + "           <p>"+product[tabMayTinh].productName+"</p>"
                               + "             <a href = \"/DetailProduct/Detail?id="+product[tabMayTinh].ID+"\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Add to cart</a>"
                               + "        </div>"

                               + "     </div>"
                                + "</div>"
                            + "</div>";



            }
            ViewBag.tabMayTinh = htmlTabMayTinh;

            // tab ban phim

            var banPhim = (from p in db.Products where (p.Catalog_ID == "2") select p).Take(4).ToList();
            String htmlTabBanPhim = "";
            for (int tabBanPhim = 0; tabBanPhim < banPhim.Count; tabBanPhim++)
            {
                htmlTabBanPhim += "<div class=\"col-sm-3\">"
                               + " <div class=\"product-image-wrapper\">"
                               + "<div class=\"single-products\">"
                               + "<div class=\"productinfo text-center\">"
                               + "   <img src=\"/Content/images/shop/" + banPhim[tabBanPhim].productImage + ".jpg\"/>"
                               + "<h2>" + banPhim[tabBanPhim].Price + "</h2>"
                               + "           <p>" + banPhim[tabBanPhim].productName + "</p>"
                               + "             <a href = \"/DetailProduct/Detail?id=" + product[tabBanPhim].ID + "\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Add to cart</a>"
                               + "        </div>"

                               + "     </div>"
                                + "</div>"
                            + "</div>";



            }
            ViewBag.tabBanPhim = htmlTabBanPhim;
            for (int i = 0; i < 2; i++)
            {
                
                String price = product[i].Price;
                String name = product[i].productName;
               
                html += " <div class=\"col-sm-4\">"
                     + " <div class=\"product-image-wrapper\">"
                     + " <div class=\"single-products\"> "
                     + "        <div class=\"productinfo text-center\">"
                     + "           <img src=\"/Content/images/shop/"+product[i].productImage+".jpg\"/>"
                     + "            <p>"+name+"</p>"
                     + "           <a href =\"/DetailProduct/Detail?id=" + product[i].ID + "\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Add to cart</a>"
                     + "        </div>"
                     + "       <div class=\"product-overlay\">"
                     + "            <div class=\"overlay-content\">"
                     + "               <h2>" + price + "</h2>"
                     + "                <p>" +name+ "</p>"
                     + "                <a href =\"/DetailProduct/Detail?id=" + product[i].ID + "\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Add to cart</a>"
                     + "            </div>"
                     + "        </div>"
                     + "    </div>"
                     + "</div>"
                     + "</div>";

            }
            ViewBag.view = html;
            return View();
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