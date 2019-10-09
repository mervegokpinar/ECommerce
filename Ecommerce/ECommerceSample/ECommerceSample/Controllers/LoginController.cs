using ECommerce.Common;
using ECommerce.Entity;
using ECommerce.Repository;
using ECommerce.Sample.Models.VM;
using ECommerceSample.Areas.Admin.Models.ResultModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerceSample.Controllers
{
    public class LoginController : Controller
    {

        private static MyECommerceEntities db = Tools.GetConnection();
        InstanceResult<Member> result = new InstanceResult<Member>();
        MemberRepository dbM = new MemberRepository();

        public ActionResult Register()
        {
            List<SelectListItem> userTypes = new List<SelectListItem>();
            foreach (var item in db.UserRoles.ToList())
            {
                userTypes.Add(new SelectListItem { Text = item.RoleName, Value = item.RoleId.ToString() });
            }
            ViewBag.userTypes = userTypes;
            
            return View();
        }


        [HttpPost]
        public ActionResult Register(Member model, List<string> userTypes)
        {
            //foreach (string item in userTypes)
            //{
            //    int userTypeId = Convert.ToInt32(item);
            //    model.RoleId = userTypeId;
            //}
            model.RoleId = Convert.ToInt32(userTypes[0]);

            result.resultint = dbM.Insert(model);
            if (result.resultint.IsSucceeded)
            {
                TempData["Message"] = "Your account has been sucessfully created ! Please Sign In.";
                return RedirectToAction("SignIn", "Login");
            }           
            
            return View(model);
        }

        public ActionResult SignIn()
        {
            ViewBag.SuccesMes = "Your account has been sucessfully created ! Please Sign In.";
            return View();

        }

        [HttpPost]
        public ActionResult SignIn(LoginVM model)
        {
            
            var user = db.Members.FirstOrDefault(x => x.Email == model.Email && x.Password == model.Password);
            if (user != null)
            {
                string cookieName = "UserLogin";
                string cookieValue = user.FirstName + " " + user.LastName.ToUpper();
                HttpCookie cookie = new HttpCookie(cookieName, cookieValue);
                cookie.Expires = DateTime.Now.AddMonths(1);
                HttpContext.Response.Cookies.Add(cookie);
                ViewBag.CurrentUser = Request.Cookies["UserLogin"].Value;

                string cookieId = "UserId";
                int cookieValueId = user.UserId;
                HttpCookie cookie2 = new HttpCookie(cookieId, Convert.ToString(cookieValueId));
                cookie2.Expires = DateTime.Now.AddMonths(1);
                HttpContext.Response.Cookies.Add(cookie2);
                

                if (user.RoleId == 1)
                {                  
                    return RedirectToAction("List", "Admin/Product");
                }
                else
                {                  
                    return RedirectToAction("ListAllProduct", "Home");
                }
            }
            
            ViewBag.Unmatched = "Incorrect username or password";
           

            return View();
        }
        public ActionResult LogOut()
        {
            string cookieName = "UserLogin";
            HttpCookie myCookie = new HttpCookie(cookieName);
            myCookie.Expires = DateTime.Now.AddMonths(1);
            Response.Cookies.Add(myCookie);
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }

    }
}