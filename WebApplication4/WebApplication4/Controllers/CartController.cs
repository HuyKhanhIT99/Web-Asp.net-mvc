using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication4.Models;

namespace WebApplication4.Controllers
{
    public class CartController : Controller
    {
        Model1 db = new Model1();
        DetailProductController detailProduct = new DetailProductController();
        // GET: Cart
        public ActionResult Cart()
        {
            
            if (Session["USER_SESSION"] != null)
            {
                var user = Session["USER_SESSION"] as WebApplication4.UserLogin;
                ViewBag.acc = user.Username;
            }

            //kiem tra trong session co sp k

            if (Session["cart"] != null)
            {
                List<int> cbo= null;
                string ss = "%";
                List<item> cart = (List<item>)Session["cart"];
               foreach(var item in cart)
                {   //  select* from Combo where Product_List like '%1%';
                    if (cbo == null)
                    {
                        ss += item.Product.ID.ToString() + "%";
                        cbo = (from p in db.Comboes where (p.Product_List.Contains(ss)) select p.ID).ToList();
                    }
                    else
                    {
                        ss += item.Product.ID.ToString() + "%";
                        cbo = (from p in db.Comboes where (p.Product_List.Contains(ss) && p.ID == cbo[0]) select p.ID).ToList();
                    }
                     if(cbo.Count == 1)
                    {
                        List<Combo> combo = (from p in db.Comboes where (p.ID == cbo[0]) select p).ToList() ;
                        
                    }
                }
            }
            // co thi 
            // for 
            //lasy id dem kiem tra tren db lay ve danh sach id cac combo lien quan luu lai combo lien quan
            //if list khac rong 
            // len db se
            //
            return View();
        }

        public ActionResult AddToCart(int id)
        {
            if (Session["cart"] == null)
            {
                List<item> cart = new List<item>();
                cart.Add(new item { Product = detailProduct.GetProductById(id), Quantity = 1 });
                Session["cart"] = cart;
            }
            else
            {
                List<item> cart = (List<item>)Session["cart"];
                int index = detailProduct.isExist(id);
                if (index != -1)
                {
                    cart[index].Quantity++;
                }
                else
                {
                    cart.Add(new item { Product = detailProduct.GetProductById(id), Quantity = 1 });
                }
                Session["cart"] = cart;
            }
            return RedirectToAction("Index", "Home");


        }

        public ActionResult RemoveItem(int id)
        {
            List<item> cart = (List<item>)Session["cart"];
            int index = isExist(id);
            cart.RemoveAt(index);
            if(cart.Count == 0)
            {
                Session["cart"] = null;
            }
            else
            {
                Session["cart"] = cart;
            }

            return RedirectToAction("Cart" , "Cart");

        }
        public int isExist(int id)
        {
            List<item> cart = (List<item>)Session["cart"];
            for (int i = 0; i < cart.Count; i++)
                if (cart[i].Product.ID == id)
                    return i;
            return -1;
        }
        [HttpPost]
        public ActionResult Payment(string firstNamt , string lastName, string adddress , string total)
        {
            var order = new Invoice();
            var  userLogin = Session["USER_SESSION"] as UserLogin;
            order.Customer_ID = userLogin.UserId;
            order.Shipper_ID = 0;
            order.totalMoney = total;
            order.shipDate = "22/11/2020";
            order.customerAddress = adddress;
            DateTime now = DateTime.Now;
            var createDate = now.Day + "/" + (now.Month) + "/" + now.Year;
            order.createdDate = createDate;
            order.State_ID = 4;
            try
            {
                var aid = Insert(order);
                List<item> cart = (List<item>)Session["cart"];

                foreach (var item in cart)
                {
                    var detail = new InvoiceDetail();
                    detail.Product_ID = item.Product.ID;
                    detail.Invoice_ID = aid;
                    detail.Price = item.Product.Price;
                    detail.Amount = item.Quantity;
                    detail.Combo_ID = 0;
                    InsertDetail(detail);
                }
            }
            catch(Exception ex)
            {
                throw;
            }
            Session["cart"] = null;
                return RedirectToAction("Index","Home");
        }
        public int Insert(Invoice order)
        {
            
          var  invoice = (from p in db.Invoices select p.ID).ToList();
            bool flag = false;
            for(int i = 0; i < invoice.Count; i++)
            {
                if (i < invoice.Count - 1)
                {
                    if ((invoice[i + 1] - invoice[i]) > 1)
                    {
                        order.ID = invoice[i] + 1;
                        flag = true;
                    }
                }
            }
            if(flag == false)
            {
                order.ID = invoice[invoice.Count-1] + 1;
            }
          
            db.Invoices.Add(order);
            db.SaveChanges();
            return order.ID;

        }
        public bool InsertDetail(InvoiceDetail order)
        {
            try
            {
                db.InvoiceDetails.Add(order);
                db.SaveChanges();
                return true;

            }
            catch
            {
                return false;
            }

        }
    }
}