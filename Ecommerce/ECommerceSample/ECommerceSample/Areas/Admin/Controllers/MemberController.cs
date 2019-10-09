using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ECommerce.Common;
using ECommerce.Entity;
using ECommerce.Repository;
using ECommerceSample.Areas.Admin.Models.ResultModel;

namespace ECommerceSample.Areas.Admin.Controllers
{
    public class MemberController : Controller
    {
        // GET: Admin/Member
        private static MyECommerceEntities db = Tools.GetConnection();
        MemberRepository mr = new MemberRepository();
        InstanceResult<Member> result = new InstanceResult<Member>();
        public ActionResult List(string m,int? id)
        {
            result.resultList = mr.List();
            if (m != null)
                ViewBag.Mesaj = string.Format("{0} nolu kaydin silme islemi {1}", id, m);
            else
                ViewBag.Mesaj = "";
            return View(result.resultList.ProcessResult);
        }

        public ActionResult AddMember()
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
        public ActionResult AddMember(Member model, List<string> userTypes)
        {
            model.RoleId = Convert.ToInt32(userTypes[0]); ;
            result.resultint = mr.Insert(model);
            if (result.resultint.IsSucceeded)
                return RedirectToAction("List");
            else
                return View(model);
        }

        public ActionResult Edit(int id)
        {
            return View(mr.GetObjById(id).ProcessResult);
        }
        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult Edit(Member model)
        {
            result.resultint = mr.Update(model);
            if (result.resultint.IsSucceeded)
                return RedirectToAction("List");
            else
                return View(model);
        }

        public ActionResult Delete(int id)
        {
            result.resultint = mr.Delete(id);
            return RedirectToAction("List", new { @m = result.resultint.UserMessage, @id = id });
        }

    }
}