using ECommerce.Entity;
using ECommerce.Repository;
using ECommerceSample.Areas.Admin.Models.ResultModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerceSample.Controllers
{
    public class ProfileController : Controller
    {
        MemberRepository dbM = new MemberRepository();
        UserRepository dbU = new UserRepository();
        

        InstanceResult<Member> result = new InstanceResult<Member>();


        public ActionResult Edit(int id)
        {
            if (HttpContext.Request.Cookies["UserLogin"] != null)
            {
                ViewBag.User = HttpContext.Request.Cookies["UserLogin"].Value;
                ViewBag.userId = HttpContext.Request.Cookies["UserId"].Value;
            }
            result.TResult = dbM.GetObjById(id);
            return View(result.TResult.ProcessResult);
        }

        [HttpPost]
        public ActionResult Edit(Member model)
        {
            result.resultint = dbM.Update(model);
            if (result.resultint.IsSucceeded)
            {
                return RedirectToAction("Index", "Home");
            }
            else
                return View(model);
        }

       
        public ActionResult Delete(int id)
        {
          
            TempData["Message2"] = "Your account has been sucessfully deleted !";            
            result.resultint = dbM.Delete(id);
            return RedirectToAction("LogOut", "Login");
        }
        
        
    }
}