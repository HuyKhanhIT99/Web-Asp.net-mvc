using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication4.Models;


namespace WebApplication4.Controllers
{
    public class DetailProductController : Controller
    {
        Model1 db = new Model1();
        // GET: DetailProduct
        public ActionResult Detail(int id = 0)
        {

            if (Session["USER_SESSION"] != null)
            {
                var user = Session["USER_SESSION"] as WebApplication4.UserLogin;
                ViewBag.acc = user.Username;
            }

            if (id != 0)
            {
                ViewBag.idc = id;
                var pro = GetProductById(id);
                ViewBag.productName = pro.productName;
                ViewBag.price = pro.Price;
                ViewBag.image = pro.productImage;
                // ViewBag.TieuDe = db.Categories.SingleOrDefault(p => p.Name != null).Name;
                var model = db.ProductDetails.SingleOrDefault(p => p.Product_ID == id);
                var info = model.productDetail1.Split(';');

                var html = "";
                for(int i = 0; i < info.Length; i++)
                {
                    html += "<p>"+info[i]+"</p>";
                }
                ViewBag.detail = html;
                // var product = (from p in db.Products where (p.Catalog_ID == "1") select p).ToList();
                return View();
            }

            return View();
        }
        public Product GetProductById(int id)
        {
            return  db.Products.SingleOrDefault(p => p.ID == id);
        }

        public int isExist(int id)
        {
            List<item> cart = (List<item>)Session["cart"];
            for (int i = 0; i < cart.Count; i++)
                if (cart[i].Product.ID == id)
                    return i;
            return -1;
        }
        public ActionResult checkAmount(string quantity , int id)
        {
            var totalPrice = 0;
            string price = "";
            var product = GetProductById(id);
            if( product.Amount - int.Parse(quantity) < 0 || int.Parse(quantity) < 0 )
            {
                return Json("Invalid entered quantity", JsonRequestBehavior.AllowGet);
            }
            else
            {

                if (Session["cart"] == null)
                {
                    price = product.Price;
                    price = price.Substring(0, price.Length - 3); //bo vnd
                    var arrPriceItem = price.Split('.');
                    price = "";
                    for(int arr= 0; arr < arrPriceItem.Length; arr++)
                    {
                        price += arrPriceItem[arr];
                    }
                    totalPrice = int.Parse(price) * int.Parse(quantity);
                    //price = String.Format("{0:#,##0.##}", totalPrice);
                    //price += "vnd";
                    List<item> cart = new List<item>();
                    cart.Add(new item { Product = product, Quantity = int.Parse(quantity) ,totalPrice = totalPrice });
                    Session["cart"] = cart;
                }
                else
                {
                    List<item> cart = (List<item>)Session["cart"];
                    int index = isExist(id);
                    if (index != -1)
                    {
                        price = product.Price;
                        price = price.Substring(0, price.Length - 3); //bo vnd
                        var arrPriceItem = price.Split('.');
                        price = "";
                        for (int arr = 0; arr < arrPriceItem.Length; arr++)
                        {
                            price += arrPriceItem[arr];
                        }
                        cart[index].Quantity = cart[index].Quantity + int.Parse(quantity);
                        totalPrice = int.Parse(price) * int.Parse(quantity);
                        price = String.Format("{0:#,##0.##}", totalPrice);
                        price += "vnd";
                        cart[index].totalPrice = totalPrice;
                    }
                    else
                    {
                        price = product.Price;
                        price = price.Substring(0, price.Length - 3); //bo vnd
                        var arrPriceItem = price.Split('.');
                        price = "";
                        for (int arr = 0; arr < arrPriceItem.Length; arr++)
                        {
                            price += arrPriceItem[arr];
                        }
                        totalPrice = int.Parse(price) * int.Parse(quantity);
                        price = String.Format("{0:#,##0.##}", totalPrice);
                        price += "vnd";
                        cart.Add(new item { Product = GetProductById(id), Quantity = int.Parse(quantity) ,totalPrice = totalPrice });
                    }
                    Session["cart"] = cart;
                }
                price = "";
                totalPrice = 0;
                return Json("Add to cart successfully", JsonRequestBehavior.AllowGet);
            }
           
        }
    }
}