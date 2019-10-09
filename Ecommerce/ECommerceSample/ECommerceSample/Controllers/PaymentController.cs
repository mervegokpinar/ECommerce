using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ECommerce.Entity;
using ECommerceSample.Models;
using ECommerce.Repository;

namespace ECommerceSample.Controllers
{
    public class PaymentController : Controller
    {
        public string GetEmailTemplate()
        {
            ViewData.Model = ViewData["model"];
            using (StringWriter stringWriter = new StringWriter())
            {
                var viewResult = ViewEngines.Engines.FindPartialView(ControllerContext, "_HtmlMail");
                var viewContext = new ViewContext(ControllerContext, viewResult.View, ViewData, TempData, stringWriter);
                viewResult.View.Render(viewContext, stringWriter);
                viewResult.ViewEngine.ReleaseView(ControllerContext, viewResult.View);
                return stringWriter.GetStringBuilder().ToString();
            }
        }

        [HttpGet]
        public ActionResult Pay()
        {
            ViewBag.PaymentTypes = new SelectList(PaymentRepository.List(), "PaymentId", "PaymentName");
            return View();
        }

        [HttpPost]
        public ActionResult Pay(Invoice model, List<string> PaymentTypes)
        {
            model.PaymentDate = DateTime.Now;
            foreach (string item in PaymentTypes)
            {
                int PaymentId = Convert.ToInt32(item);
                model.PaymentTypeId = PaymentId;
            }

            model.Address = ((Order)Session["Order"]).Member.Address;
            model.OrderId = ((Order)Session["Order"]).OrderId;
            InvoiceRepository ip = new InvoiceRepository();
            if (ip.Insert(model).IsSucceeded)
            {
                Order ord = (Order)Session["Order"];
                OrderRepository ordrep = new OrderRepository();
                ord.IsPay = true;
                ordrep.Update(ord);

                ViewData["model"] = model;
                var body = GetEmailTemplate();
                body.Replace("C2", "C2");
                SendMail mail = new SendMail();
                if (mail.mailGonder(model.Order.Member.Email, body, model.Order.OrderId, model.Order.Member.FirstName, model.Order.Member.LastName))
                {
                    ViewBag.Mesaj1 = "Mesaj iletildi";
                }
                else
                {
                    ViewBag.Mesaj1 = "Mesaj iletilmedi";
                }

                return RedirectToAction("ListAllProduct", "Home");
            }
            else
            {
                return View(model);
            }
        }
    }
}