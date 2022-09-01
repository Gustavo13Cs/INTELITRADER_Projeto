using INTELITRADER_Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace INTELITRADER_Project.Controllers
{
    
    public class HomeController : Controller
    {
        BDFunil bd = new BDFunil();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult BDError()
        {
            ViewBag.Mensagem = MensagemError.textoErro;
            return View();
        }

        public ActionResult Dashboard()
        {
            return View(bd.QtdCandidatosPorVagaSet.ToList());
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult verificarlogin(string login, string senha)
        {
            bool validado = true;
            if (validado)
            {
                Session["MyVaga"] = "MyVaga";
                return RedirectToAction("Index");
            }
            else
            {
               
                return RedirectToAction("Login");
            }
            return null;
        }
    }
}