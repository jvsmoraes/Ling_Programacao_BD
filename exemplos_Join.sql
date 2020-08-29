-- A que clientes estão associados os pedidos existentes? Listar pelos nomes
-- Versão sem inner join:
select c.cod_cli, c.nome_cli, p.num_ped from cliente c, pedido p where 
c.cod_cli = p.cod_cli
order by c.nome_cli;
-- Versão com inner join:
select c.cod_cli, c.nome_cli,  p.num_ped from cliente c inner join pedido p on 
c.cod_cli = p.cod_cli
order by c.nome_cli;

-- QUais são os clientes que têm pedidos com prazos de entrega superiores a 15 dias
-- e são do estado de São Paulo ou Rio de Janeiro
-- Versão sem inner join
select c.nome_cli, c.uf, p.num_ped from cliente c, pedido p where 
c.cod_cli = p.cod_cli and 
p.prazo_entr > 15 and
c.uf in ('sp', 'rj'); 

-- Versão com inner join 



-- Mostrar os clientes e seus respectivos prazos de entrega ordenado do maior pro menor
-- Sem inner join
select c.nome_cli, p.prazo_entr from cliente c, pedido p where
c.cod_cli = p.cod_cli 
order by prazo_entr desc;

-- Com Inner Join


-- Exibir os vendedores (ordenados por nome) que emitiram
-- pedidos com prazos de entre superiores a 15 dias e que
-- tenham salários fixos iguais ou superioes a R$ 1000

-- Com inner join
select v.nome_vend, v.sal_fixo, p.num_ped, p.prazo_entr from vendedor v inner join pedido p on
v.cod_vend = p.cod_vend where
p.prazo_entr > 15 and 
v.sal_fixo >= 1000
order by v.nome_vend;

-- Exiba a relação dos clientes localizados no Rio de Janeiro
-- (ordenados alfabeticamente) que têm pedidos do produto
-- Chapa de Aço com prazos de entre superiores a 15 dias

select c.nome_cli, c.uf, p.num_ped, p.prazo_entr, pr.desc_prod from
cliente c, pedido p, produto pr, item_pedido ip where
c.cod_cli = p.cod_cli and
p.num_ped = ip.num_ped and
pr.cod_prod = ip.cod_prod and
c.uf = 'rj' and
pr.desc_prod = "Chapa de Aço" and
p.prazo_entr > 15
order by c.nome_cli;

-- Varios inner joins

select c.nome_cli, c.uf, p.num_ped, p.prazo_entr, pr.desc_prod from 
pedido p inner join cliente c inner join item_pedido ip inner join produto pr on     
c.cod_cli = p.cod_cli and p.num_ped = ip.num_ped and pr.cod_prod = ip.cod_prod where
c.uf = 'rj' and
pr.desc_prod = "Chapa de Aço" and
p.prazo_entr > 15
order by c.nome_cli;
