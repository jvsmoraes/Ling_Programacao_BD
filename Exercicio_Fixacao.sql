create database exerc_fixacao;

use exerc_fixacao;

create table Departamentos(
codigo_Depto int not null,
nome varchar(30) not null,
localizacao varchar(30) not null, 
primary key(codigo_Depto));

create table Funcionários(
codigo_Func int not null,
codigo_Depto int not null,
primeiro_Nome varchar(20)not null,
segundo_Nome varchar(20)not null,
ultimo_Nome varchar(20)not null,
data_Nasc date not null,
cpf varchar(14) not null unique,
rg varchar(13) not null,
endereco varchar(60)not null,
cep varchar(10) not null,
cidade varchar(30) not null default 'Itapira',
fone_Res varchar(14),
fone_Cel varchar(15),
funcao varchar(30) not null,
salario decimal(8,2) not null,
primary key(codigo_Func),
foreign key(codigo_Depto) references Departamentos(codigo_Depto)); 

insert into departamentos(codigo_Depto, nome, localizacao) VALUES
(1, 'Serasa', 'Itapira'),
(2, 'SeiLa', 'Itapira'),
(3, 'TbmNSei', 'Jacutinga');

insert into funcionários(codigo_Func, codigo_Depto, primeiro_Nome, segundo_Nome, ultimo_Nome, data_Nasc, cpf, rg, endereco, cep, cidade, fone_Res, fone_Cel, funcao, salario) VALUES
(1, 1, 'Henrique', 'Oliveira', 'Santos', 19801020, 49202275322, 2578563465481, 'Rua Bandeirantes', 13973500, 'Itapira', 38638222, 992123336, 'Recepcionista', 2300),
(2, 1, 'Andressa', 'Manuela', 'Moraes', 19990904, 52302273200, 46464757355, 'Rua Itália', 13970200, 'Itapira', 38634423, 736237356, 'Faxineira', 750),
(3, 3, 'Marina', 'Fernandes', 'Lovatto', 20001201, 6350205244, 2592375233, 'Rua João Cintra', 15320300, 'Jacutinga', 32035522, 99256375, 'Secretária', 3200),
(4, 2, 'Daniel', 'Lucas', 'Banin', 19980512, 623252552, 2454631235, 'Rua das Flores', 153252222, 'Jacutinga', 32429522, 992344156, 'Motorista', '1200');

select primeiro_nome, ultimo_nome from funcionários order by ultimo_nome;

select * from funcionários order by cidade;

select primeiro_Nome, segundo_Nome, ultimo_Nome, salario from funcionários where salario > 1000 order by primeiro_nome;

select primeiro_Nome, data_Nasc from funcionários order by data_Nasc desc;

select primeiro_Nome, ultimo_Nome, fone_Res, fone_Cel from funcionários;

select SUM(salario) as Total_Salário from funcionários;

select count(codigo_Func) as Total_Funcionarios from funcionários;

select avg(Salario) as Média_Salário from funcionários;

select primeiro_Nome from funcionários where cidade = 'Itapira' and funcao = 'Recepcionista';


