﻿using ECommerce.Entity;
using ECommerce.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;

namespace ECommerceSample.Models
{
    public class SendMail
    {
        OrderDetailRep ordrep = new OrderDetailRep();
        public bool mailGonder(string receiver, string body, int id, string name, string lastname)
        {
           
            MailMessage email = new MailMessage();
            string Host = "smtp.gmail.com";
            string smtpUserName = "mervestore2@gmail.com";          
            string smtpPassword = "Merve123G.";
            email.From = new MailAddress("mervestore2@gmail.com");
            int smtpPort = 587;
            email.IsBodyHtml = true;
            email.Subject = "Your Order is Confirmed";
            email.Body = body;
            email.To.Add(new MailAddress(receiver));
            email.BodyEncoding = System.Text.Encoding.UTF8;
            SmtpClient smtp = new SmtpClient(Host, smtpPort);
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new System.Net.NetworkCredential(smtpUserName, smtpPassword);
            AlternateView AlternateView_Html = AlternateView.CreateAlternateViewFromString(body, null, MediaTypeNames.Text.Html);
            foreach (OrderDetail item in ordrep.List().ProcessResult.Where(t => t.OrderId == id))
            {
                LinkedResource Picture = new LinkedResource("C: \\Users\\MERVE\\Desktop\\MerveGokpinarWebExam\\ECommerceSample\\ECommerceSample\\Upload\\" + item.Product.Photo, MediaTypeNames.Image.Jpeg);      
                Picture.ContentId = item.Product.Photo;
                AlternateView_Html.LinkedResources.Add(Picture);
                email.AlternateViews.Add(AlternateView_Html);
            }
            smtp.Send(email);
            return true;

        }
    }
}