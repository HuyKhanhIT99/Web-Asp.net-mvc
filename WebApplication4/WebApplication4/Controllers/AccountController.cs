using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication4.Models;

namespace WebApplication4.Controllers
{
    public class AccountController : Controller
    {
        Model1 db = new Model1();
        // GET: Account
        public ActionResult Login()
        {
            
            return View();
        }
        public ActionResult LogOut()
        {
            if (Session["USER_SESSION"] != null)
            {
                Session["USER_SESSION"] = null;
            }
            return RedirectToAction("Index", "Home");
        }
        public ActionResult LoginForm(Customer customer)
        {
            if (ModelState.IsValid)
            {
                
                var result = LoginAction(customer.username, customer.password);
                if (result)
                {
                    var currentUser = GetCustomerByUserName(customer.username);
                    var userSession = new UserLogin();
                    userSession.FirstName = currentUser.firstName;
                    userSession.LastName = currentUser.lastName;
                    userSession.Gender = currentUser.gender;
                    userSession.IsNew = currentUser.isNew;
                    userSession.Address = currentUser.address;
                    userSession.UserId = currentUser.ID;
                    userSession.Username = currentUser.username;


                    Session["USER_SESSION"] = userSession;
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập không đúng. ");
                }
            }
            return View("Login");
        }
        public bool LoginAction(string username , string password)
        {
            var result = db.Customers.Count(x => x.username == username && x.password == password);
            if(result > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        }
        public Customer GetCustomerByUserName(string username)
        {
            return db.Customers.SingleOrDefault(x => x.username == username);
        }
    }
}
