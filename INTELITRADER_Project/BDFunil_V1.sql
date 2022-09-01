--CRIAÇÃO DO BANDO DE DADOS
Use master;
go
Create database BDFunil
go
use BDfunil
go
Create table ETAPA (
  ETAID int identity(1,1) not null primary key,
  ETADESCRICACAO varchar(100) not null,
  ETASEQ  INT UNIQUE not null --A sequência da etapa no processo e não se repete, NÚMERO INTEIRO
)
go
Create table VAGA (
  VAIID int identity(1,1) not null primary key,
  VAINOME varchar(500),
  VAIDESCRICAO varchar(1000) not null,
  VAIATRIBUICAO varchar(1000)not null, --o que irá fazer no cargo
  VAISALARIO decimal(10,2) null default 0,
  VAIREQUISITO varchar(1000) null,
  VAIDATACADASTRO datetime default getdate() not null
) 
go
Create table CANDIDATO (
   CANID int identity(1,1) not null primary key,
   CANNOME varchar(100) not null,
   CANFORMACAO varchar(100) null default 'Graduado'
)
go
Create table CANDIDATOVAGA(
   CANID int not null FOREIGN KEY REFERENCES CANDIDATO(CANID),
   VAIID int not null FOREIGN KEY REFERENCES VAGA(VAIID),
   CAVDATACADASTRO datetime default getdate() not null,
   CAVSTATUSCANDIDATURA varchar(20) not null default 'Ativo',
   CONSTRAINT CHK_STATUSCANDIDATURA 
		CHECK ( CAVSTATUSCANDIDATURA='Ativo' or
			    CAVSTATUSCANDIDATURA='Finalizado' or
			    CAVSTATUSCANDIDATURA='Cancelado'
			  ),
   CONSTRAINT PK_CandidatoVaga Primary key (CANID, VAIID)
)
GO
/*Para essse cenário a tabela GestaoEtapa foi suprimida, uma vez que não será o foco no momento.*/

/*Dados de carga inicial do Banco de dados*/
--Inserindo etapas
Insert Etapa (ETADESCRICACAO,ETASEQ) values ('Inscrito',1)
Insert Etapa (ETADESCRICACAO,ETASEQ) values ('Entrevista',2)
Insert Etapa (ETADESCRICACAO,ETASEQ) values ('Prova Teórica',3)
Insert Etapa (ETADESCRICACAO,ETASEQ) values ('Prova Prática',4)
Insert Etapa (ETADESCRICACAO,ETASEQ) values ('Negociação',5)
Insert Etapa (ETADESCRICACAO,ETASEQ) values ('Finalizado',6)
go
--Inserindo Candidatos
Insert Candidato (CANNOME) values ('Gustavo Lima')
Insert Candidato (CANNOME) values ('kauna Ferreira')
Insert Candidato (CANNOME) values ('Maria do Carro')
Insert Candidato (CANNOME) values ('Lampião Severino')
Insert Candidato (CANNOME, CANFORMACAO) values ('Jonas Junior','PósGraduado')
Insert Candidato (CANNOME, CANFORMACAO) values ('Ryandra do Agreste','Expert')
go
--inserindo vagas
Insert Vaga (VAINOME, VAIDESCRICAO,VAIATRIBUICAO, VAISALARIO, VAIREQUISITO,VAIDATACADASTRO)
  values (
			'Desenvolvedor .NET Senior',
			'Presente em mais de 40 países com mais de 25.000 funcionários, somos a quinta multinacional brasileira mais internacionalizada e estamos entre as 100 maiores empresas de TI do mundo. Nossas equipes atuam para encontrar as soluções ideais para seus parceiros e impulsionar a inovação necessária para garantir que sua empresa prospere na era digital. Com abrangente análise de negócios e ampla visão de mercado, criamos soluções personalizadas que proporcionam transformações digitais perfeitas, garantindo resultados rápidos e gerando impacto em toda a organização.',
			'Buscamos pessoas com conhecimento em react/react native e .net ou mobile.
O que oferecemos: VA ou VR | VT | Seguro de Vida | Assistência Médica | Plano Odontológico | Benefício Academia | Mentoring I e muito mais',
null, 
'React, NET','2022-15-02'
)
go
Insert Vaga (VAINOME, VAIDESCRICAO,VAIATRIBUICAO, VAISALARIO, VAIREQUISITO,VAIDATACADASTRO)
  values (
			'Desenvolvedor Full Stack .Net',
			'A Ajax está a mais de 8 anos no mercado com um objetivo principal: oferecer soluções com agilidade, qualidade e eficiência para os desafios que nossos clientes enfrentam todos os dias.

Temos uma paixão: transformar a vida de nossos colaboradores para que sua experiência de trabalho seja única!

Estamos comprometidos em trazer aos nossos colaboradores toda tecnologia e treinamento para aprimorar suas habilidades técnicas e comportamentais.

Temos a missão de facilitar o dia a dia das pessoas através dos nossos softwares para diferentes segmentos do mercado. Para isso acontecer, contamos com um time incrível, composto por pessoas apaixonadas e engajadas em um único propósito: oferecer ferramentas inovadoras.

Nosso convite é pensar juntos para melhorar o que existe, e ir além!',
			' #Desenvolvedor .Net_Full Stack_pleno',
			12000.00, 
			'Net Framework; ASP.NET;Entity Framework;SQL Server;',
			'2022-15-03'
)
go
Insert Vaga (VAINOME, VAIDESCRICAO,VAIATRIBUICAO, VAISALARIO, VAIREQUISITO,VAIDATACADASTRO)
  values (
			'Coordenador(a) de Engenharia de Software',
			'Estamos com uma oportunidade aberta para Coordenar uma Squad Cross dentro da Gerência de CRM e MKT, que é formada por Engenheiros(as) Front-Ends, Back-Ends, Sharepoint e o Scrum Master.

Os assuntos dessa Squad são: Site Institucional, Intranet, Design System e Cross CRM.',
			'- Realizar feedbacks e desenvolvimento de carreira do time;

- Trabalhar em parceria com as demais áreas para negociar e atingir os objetivos nos prazos;

- Participação ativa nas reuniões de alinhamento e estratégia com o time de produto/negócio.',
			20000.00, 
			'Experiência com gestão de pessoas e times multifuncionais; Conhecimento de tecnologias de Front-End;
			Conhecimento de tecnologias de Back-End (Java e/ou .Net);Conhecimento de AWS;',
			'2022-15-03'
)
go
Insert Vaga (VAINOME, VAIDESCRICAO,VAIATRIBUICAO, VAISALARIO, VAIREQUISITO,VAIDATACADASTRO)
  values (
			'Dev. Oracle PL/SQL SR',
			'Desenvolvimento de Aplicações Oracle PL/SQL',
			'Programaçaõ em  Banco de dados e relatórios',
			5000.00, 
			'Modelagem de Dados',
			'2022-20-06'
)

--inserindo candidatos x vagas
--Vaga 01
Insert CANDIDATOVAGA (CANID,VAIID, CAVDATACADASTRO, CAVSTATUSCANDIDATURA)
	   values (1,1,'2022-16-02','Ativo')
Insert CANDIDATOVAGA (CANID,VAIID, CAVDATACADASTRO, CAVSTATUSCANDIDATURA)
	   values (2,1,'2022-30-04','Ativo')
Insert CANDIDATOVAGA (CANID,VAIID, CAVDATACADASTRO, CAVSTATUSCANDIDATURA)
	   values (5,1,'2022-25-03','Ativo')
--VAGA 02
Insert CANDIDATOVAGA (CANID,VAIID, CAVDATACADASTRO, CAVSTATUSCANDIDATURA)
	   values (3,2,'2022-05-03','Ativo')
Insert CANDIDATOVAGA (CANID,VAIID, CAVDATACADASTRO, CAVSTATUSCANDIDATURA)
	   values (4,2,'2022-30-04','Finalizado')
Insert CANDIDATOVAGA (CANID,VAIID, CAVDATACADASTRO, CAVSTATUSCANDIDATURA)
	   values (6,2,'2022-07-03','Ativo')
Insert CANDIDATOVAGA (CANID,VAIID, CAVDATACADASTRO, CAVSTATUSCANDIDATURA)
	   values (1,2,'2022-07-03','Cancelado')
--Vaga03

Insert CANDIDATOVAGA (CANID,VAIID, CAVDATACADASTRO, CAVSTATUSCANDIDATURA)
	   values (3,3,'2022-05-03','Cancelado')
Insert CANDIDATOVAGA (CANID,VAIID, CAVDATACADASTRO, CAVSTATUSCANDIDATURA)
	   values (4,3,'2022-30-04','Cancelado')
Insert CANDIDATOVAGA (CANID,VAIID, CAVDATACADASTRO, CAVSTATUSCANDIDATURA)
	   values (2,3,'2022-07-03','Ativo')
Insert CANDIDATOVAGA (CANID,VAIID, CAVDATACADASTRO, CAVSTATUSCANDIDATURA)
	   values (1,3,'2022-07-03','Finalizado')

select * from CANDIDATO

go
Create View QtdCandidatoPorVaga as 
select v.VAINOME as Vaga,
        COUNT(c.CANID) as Quantidade,
        v.VAIID as CodVaga
from VAGA v 
INNER JOIN CANDIDATOVAGA cv on cv.VAIID = v.VAIID 
INNER JOIN CANDIDATO c on c.CANID = cv.CANID
group by v.VAINOME, v.VAIID

select * from QtdCandidatoPorVaga

	   