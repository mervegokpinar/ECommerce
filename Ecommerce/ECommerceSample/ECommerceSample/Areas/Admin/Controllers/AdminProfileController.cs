using ECommerce.Entity;
using ECommerce.Repository;
using ECommerceSample.Areas.Admin.Models.ResultModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerceSample.Areas.Admin.Controllers
{
    public class AdminProfileController : Controller
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
               
                return RedirectToAction("List", "Product");
            }
            else
                
                return View(model);
        }

        public ActionResult Delete(int id)
        {
           
            result.resultint = dbM.Delete(id);
            TempData["Message2"] = "Your account has been successfully deleted ! ";
            return Redirect("~/Login/SignIn");
        }

    }
}