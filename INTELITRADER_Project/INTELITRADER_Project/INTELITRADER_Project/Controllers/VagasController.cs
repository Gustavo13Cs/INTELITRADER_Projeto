using INTELITRADER_Project.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace INTELITRADER_Project.Controllers
{
    public class VagasController : Controller
    {
        
        BDFunil bd = new BDFunil();
        public ActionResult Index()
        {
            return View(bd.VAGA.ToList());
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(string nome, string descricao, string atribuicao, string salario, string requisito)
        {
            VAGA novaVaga = new VAGA();
            novaVaga.VAINOME = nome;
            novaVaga.VAIDESCRICAO = descricao;
            novaVaga.VAIATRIBUICAO = atribuicao;
            novaVaga.VAISALARIO = decimal.Parse(salario);
            novaVaga.VAIREQUISITO = requisito;
            novaVaga.VAIDATACADASTRO = DateTime.Now;

            bd.VAGA.Add(novaVaga);
            bd.SaveChanges();

            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Editar(int? id)
        {
            VAGA VagaEditar = bd.VAGA.ToList().Where(x => x.VAIID == id).First();
            return View(VagaEditar);
        }
        [HttpPost]
        public ActionResult Editar(int? id, string nome, string descricao, string atribuicao, string salario, string requisito)
        {
            VAGA VagaEditar = bd.VAGA.ToList().Where(x => x.VAIID == id).First();
            VagaEditar.VAINOME = nome;
            VagaEditar.VAIDESCRICAO = descricao;
            VagaEditar.VAIATRIBUICAO = atribuicao;
            VagaEditar.VAISALARIO = decimal.Parse(salario);
            VagaEditar.VAIREQUISITO = requisito;
            VagaEditar.VAIDATACADASTRO = DateTime.Now;

            bd.Entry(VagaEditar).State = EntityState.Modified;
            bd.SaveChanges();

            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Excluir(int? id)
        {
            VAGA VagaExcluir = bd.VAGA.ToList().Where(x => x.VAIID == id).First();
            return View(VagaExcluir);
        }
        [HttpPost]
        public ActionResult ExcluirConfirmar(int? id)
        {
            VAGA VagaExcluir = bd.VAGA.ToList().Where(x => x.VAIID == id).First();
            bd.VAGA.Remove(VagaExcluir);

            try
            {
                bd.SaveChanges();
            }
            catch (Exception)
            {
                MensagemError.textoErro = "Não é possível excluir uma Vaga onde já existe candidatos";
                return RedirectToAction("BdError", "Home");
            }
            return RedirectToAction("Index");
        }

        public ActionResult Candidatos(int? id)
        {
             
            List<Vaga_Candidato> lista = bd.Vaga_Candidato.Where(x => x.CodVaga == id).ToList();
            
            return View(lista);
        }

       
    }
}