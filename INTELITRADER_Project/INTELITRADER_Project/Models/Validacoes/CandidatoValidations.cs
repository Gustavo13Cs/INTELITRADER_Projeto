using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace INTELITRADER_Project.Models.Validacoes
{
    public class CandidatoValidations
    {
        public static bool CandidatoVagaValidarConcorrencia(CANDIDATO c)
        {
            return !c.CANDIDATOVAGA.Any(x => x.CAVSTATUSCANDIDATURA == "Ativo");
        }
    }
}