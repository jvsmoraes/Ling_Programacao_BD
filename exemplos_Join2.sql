create database exercicioInnerJoin;

use exercicioInnerJoin;

create table Cliente(
cpf int not null,
nome varchar(60) not null,
dtNasc date not null, 
primary key(cpf));

create table Modelo(
codMod int not null,
Desc_2 varchar(40) not null,
primary key(codMod));

create table Veiculo(
placa varchar(8) not null,
Modelo_codMod int not null,
Cliente_cpf int not null,
cor varchar(20) not null,
primary key(placa),
foreign key(Modelo_codMod) references Modelo(codMod),
foreign key(Cliente_cpf) references Cliente(cpf));

create table Patio(
num int not null,
ender varchar(40) not null,
capacidade int not null,
primary key(num));

create table Estaciona(
cod int not null,
Patio_num int not null,
Veiculo_placa varchar(8) not null,
dtEntrada varchar(10) not null,
hsEntrada varchar(10) not null,
hsSaida varchar(10) not null,
primary key(cod),
foreign key(Patio_num) references Patio(num),
foreign key(Veiculo_placa) references Veiculo(placa));

insert into cliente(cpf, nome, dtNasc) values
(3, 'Thiago Lima', 19980512),
(2, 'Marina Lovato', 200001201),
(1, 'Gusmaum Bucker', 20001019),
(4, 'Ivo César', 19800522),
(5, 'Sei La', 19841004);

insert into modelo(codMod, Desc_2) values
(1, 'UNO'),
(2, 'BMW'),
(3, 'Subaru'),
(4, 'Fusca'),
(5, 'Opala');

insert patio(num, ender, capacidade) values
(1, 'Espanha', 32),
(2, 'Cubatão', 64),
(3, 'Jardim Soares', 128),
(4, 'Esqueci', 20);

insert into veiculo(placa, Modelo_codMod, Cliente_cpf, cor) values
('GFG-2489', 1, 1, 'verde'),
('JJJ-2020', 2, 2, 'verde'),
('GWF-1242', 3, 3, 'branco'),
('CUM-2469', 4, 4, 'azul'),
('FUK-6666', 5, 5, 'preto');

insert into estaciona(cod, Patio_num, Veiculo_placa, dtEntrada, dtSaida, hsEntrada, hsSaida) values
(1, 1, 'JJJ-2020', 20200515, 20200515, '13:05', '15:55'),
(2, 1, 'GFG-2489', 20200615, 20200615, '08:00', '9:30'),
(3, 2, 'CUM-2469', 20200616, 20200617, '15:00', '06:30'),
(6, 2, 'JJJ-2020', 20200815, 20200820, '22:00', '4:00'),
(4, 4, 'FUK-6666', 20200412, 20200422, '07:00', '07:05'),
(5, 2, 'GWF-1242', 20200222, 20200222, '23:00', '23:59');

-- 3 Nome e placa de todos os veiculos
select cliente.nome, veiculo.placa from cliente inner join veiculo on
cliente.cpf = veiculo.Cliente_cpf;

-- 4 CPF e Nome da placa JJJ-2020
select cliente.cpf, cliente.nome, veiculo.placa from cliente inner join veiculo on
cliente.cpf = veiculo.Cliente_cpf where
veiculo.placa = 'JJJ-2020';

-- 5 Exibir placa e cor do veiculo que possui código de estacionamento 1
select veiculo.placa, veiculo.cor, estaciona.cod from veiculo inner join estaciona on
veiculo.placa = estaciona.veiculo_placa where
estaciona.cod = 1;

-- 6 Endereço, data de entrada e saida da placa JEG-1010
select veiculo.placa, estaciona.dtEntrada, estaciona.dtSaida, patio.ender from veiculo inner join estaciona inner join patio on
veiculo.placa = estaciona.veiculo_placa and patio.num = estaciona.Patio_num where
veiculo.placa = 'JEG-1010';

-- 7 Quantidade de vezes que veiculos de cor verde estacionaram
select veiculo.cor, count(estaciona.Veiculo_placa) from veiculo inner join estaciona on
veiculo.placa = estaciona.veiculo_placa where
veiculo.cor = 'verde';

-- 8 Listar cliente com carro modelo 1
select cliente.nome from cliente inner join modelo inner join veiculo on 
cliente.cpf = veiculo.cliente_cpf and modelo.codMod = veiculo.Modelo_codMod where
modelo.codMod = 1;

-- 9 Listar placa, horario entrada e saida de veiculos verdes
select veiculo.placa, estaciona.hsEntrada, estaciona.hsSaida from veiculo inner join estaciona on
veiculo.placa = estaciona.Veiculo_placa where
veiculo.cor = 'verde';

-- 10 Todos estacionamentos da placa JJJ-2020
select estaciona.* from veiculo inner join estaciona on 
veiculo.placa = estaciona.veiculo_placa where
veiculo.placa = 'JJJ-2020';

-- 11 Cliente cujo veiculo tem codigo de estacionamento 2
select cliente.nome from veiculo inner join estaciona inner join cliente on
veiculo.placa = estaciona.veiculo_placa and cliente.cpf = veiculo.cliente_cpf where
estaciona.cod = 2;

-- 12 CPF do cliente que possui codigo de estacionamento 3
select cliente.cpf from cliente inner join estaciona inner join veiculo on
veiculo.placa = estaciona.veiculo_placa and cliente.cpf = veiculo.cliente_cpf where
estaciona.cod = 3;

-- 13 Descrição do veiculo que tem codigo de estacionamento 2
select modelo.desc_2 from estaciona inner join veiculo inner join modelo on
veiculo.placa = estaciona.Veiculo_placa and veiculo.modelo_codMod = modelo.codMod where
estaciona.cod = 2;

-- 14 Placa, nome do cliente e descrição de todos os veiculos
select cliente.nome, veiculo.placa, modelo.desc_2 from veiculo inner join modelo inner join cliente on
cliente.cpf = veiculo.cliente_cpf and modelo.codMod = veiculo.Modelo_codMod;




