using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ECommerce.Entity;
using ECommerce.Repository;
using ECommerce.Common;
using ECommerceSample.Models;

namespace ECommerceSample.Controllers
{
    public class OrderController : Controller
    {
        // GET: Order

        OrderRepository or = new OrderRepository();
        ProductRepository pr = new ProductRepository();
        OrderDetailRep ordrep = new OrderDetailRep();
        InvoiceRepository ir = new InvoiceRepository();


        public ActionResult Add(int id)
        {
            if (HttpContext.Request.Cookies["UserLogin"] != null)
            {
                ViewBag.CurrentUser = HttpContext.Request.Cookies["UserLogin"].Value;
              
            }
            //Sepetimizi sessionda tutuyoruz. Burada ki Sessionun adi:Order(Session[Order])
            if (Session["Order"] == null)
            { //Order isimli sessiona bir adet Order ekledik
                Order o = new Order();
                o.OrderDate = DateTime.Now;
                o.IsPay = false;
                or.Insert(o);
                //OrderRepository içerisinden son create edilmiş bir orderi Session uzerinde tutup o yapıya order Detail ekliyoruz
                Session["Order"] = or.GetLatestObj(1).ProcessResult[0];
                OrderDetail od = new OrderDetail();
                od.OrderId = ((Order)Session["Order"]).OrderId;
                od.ProductId = id;

                //OrderDetail içerisinde quantity ve pricei guncelliyoruz.
                od.Quantity = 1;
                od.Price = pr.GetObjById(id).ProcessResult.Price;
                o.MemberId = Convert.ToInt32(Request.Cookies["UserId"].Value);
                ordrep.Insert(od);
            }
            else
            {
                Order o = (Order)Session["Order"];
                OrderDetail Update = ordrep.GetOrderDetByTwoID(o.OrderId, id).ProcessResult;
                if (Update == null)
                {
                    OrderDetail od = new OrderDetail();
                    od.OrderId = o.OrderId;
                    od.ProductId = id;
                    od.Quantity = 1;
                    od.Price = pr.GetObjById(id).ProcessResult.Price;
                    ordrep.Insert(od);
                }
                else
                {

                    Update.Quantity++;
                    Update.Price += pr.GetObjById(id).ProcessResult.Price;
                    ordrep.Update(Update);

                }
            }
            return RedirectToAction("Index", "Home");
        }

        public ActionResult DetailList()
        {
            if (HttpContext.Request.Cookies["UserLogin"] != null)
            {
                ViewBag.CurrentUser = HttpContext.Request.Cookies["UserLogin"].Value;

            }

            Order sepetim = (Order)Session["Order"];
            decimal? TotalPrice = 0;
            OrderRepository or = new OrderRepository();
            if (sepetim.OrderDetails != null)
            {
                foreach (OrderDetail item in sepetim.OrderDetails)
                {
                    TotalPrice += item.Price;
                }
                sepetim.TotalPrice = TotalPrice;
                or.Update(sepetim);
            }
            else
            {
                sepetim.TotalPrice = 0;
                or.Update(sepetim);
            }
            if (sepetim == null)
            {
                return RedirectToAction("ListAllProduct", "Home");
            }
            else
            {
                if (HttpContext.Request.Cookies["UserLogin"] != null)
                {
                    ViewBag.CurrentUser = HttpContext.Request.Cookies["UserLogin"].Value;

                }
                return View(sepetim.OrderDetails);
            }

        }
        public ActionResult Delete(int id)
        {
            Order sepetim = (Order)Session["Order"];
            Result<int> result = ordrep.OrderDetailSil(sepetim.OrderId, id);
            return RedirectToAction("DetailList");
        }

        public ActionResult OrderHistory(int id)
        {
            if (HttpContext.Request.Cookies["UserLogin"] != null)
            {
                ViewBag.CurrentUser = HttpContext.Request.Cookies["UserLogin"].Value;

            }

            OrderDetailRep od = new OrderDetailRep();
            return View(ir.List().ProcessResult.Where(t => t.Order.MemberId == id));
        }



    }
}
