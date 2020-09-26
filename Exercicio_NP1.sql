-- Exercicio 01
-- Média salário 
select avg(salario) as Media_Salário 
from funcionários;

-- Nome, função e departamento agrupado pelo departamento
select funcionários.primeiro_Nome, funcionários.segundo_Nome, funcionários.ultimo_Nome, departamentos.nome as Departamento
from funcionários inner join departamentos
on funcionários.codigo_Depto = departamentos.codigo_Depto;

-- Nome, endereço, RG, CPF do departamento de TI
select funcionários.primeiro_Nome, funcionários.endereco, funcionários.rg, funcionários.cpf, departamentos.nome as Departamento
from funcionários inner join departamentos
on funcionários.codigo_Depto = departamentos.codigo_Depto
where departamentos.nome = "TI";

-- Nome e salario dos funcionários que nasceram entre 01/01/1980 e 31/12/1990
select primeiro_Nome, salario from funcionários
where data_Nasc between 19800101 and 19901231;

-- Exercicio 02
-- Paises e continentes
select name, continent from country;

-- Paises, região e população da europa
select name, region, population from country
where region like '%europe';

-- Expectativa de vida da Ásia
select avg(LifeExpectancy) from country 
where region like "%asia%";

-- Criar uma view que mostre nome do pais, presidente, governo da africa e com população com mais de 2000000.
create view vw_InfoPais as
select name, HeadOfState, GovernmentForm, Population from country 
where Population > 2000000 and Region = "South America";

select * from vw_InfoPais;

-- View de nome, tamanho e idioma inglês como oficial ordenado pelo tamanho e como usar view
create view vw_TamanhoNomeIdiomaIngles as
select country.name, country.surfaceArea, countrylanguage.Language
from country inner join countrylanguage
on CountryCode = countrylanguage.CountryCode
where countrylanguage.IsOfficial = "T" and countrylanguage.Language = "English"
group by country.name
order by country.SurfaceArea; 

select * from vw_TamanhoNomeIdiomaIngles;

-- Alterar view para mostrar porcetangem dos falantes de ingles
alter view vw_TamanhoNomeIdiomaIngles as
select country.name, country.surfaceArea, countrylanguage.Language, countrylanguage.Percentage
from country inner join countrylanguage
on CountryCode = countrylanguage.CountryCode
where countrylanguage.IsOfficial = "T" and countrylanguage.Language = "English"
order by country.SurfaceArea; 

select * from vw_TamanhoNomeIdiomaIngles;



