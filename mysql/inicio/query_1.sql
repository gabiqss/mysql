-- Aula 2:
-- SELECT * FROM Tabela;
-- selecionar todas as colunas e linhas de uma tabela;

-- SELECT col1, col2 
-- FROM Tabela;
-- selecionar apenas as colunas col1, col2 da Tabela;

-- SELECT
-- 	col1 AS "coluna 1",
-- 	col2 AS "coluna 2"
-- FROM Tabela;
-- igual a fução acima só que apelidando as colunas;

-- SELECT 
-- 	*
-- FROM Tabela
-- LIMIT 2;
-- como se fosse um Tabela.head(2);

-- SELECT 
-- 	*
-- FROM Tabela
-- ORDER BY col3;
-- como se fosse um .sort() da Tabela pela col3
-- o defaul é o comando ASC
-- ORDER BY col3 DESC;
-- ordena de forma descendente;

-- ################################
-- Exemplo 1:
SELECT * FROM pedidos;

SELECT * FROM clientes;

-- Exemplo2:
SELECT 
	ID_Cliente AS 'ID Clientes', 
    Nome, 
    Data_Nascimento AS 'Data de Nascimento', 
    Email AS 'E-mail'
FROM clientes;

-- Exemplo3:
select * from produtos
limit 5;

-- Exemplo4:
select * from produtos
order by Preco_Unit desc;

-- ##############################
-- comando WHERE: Filtros
-- 3 tipos de filtros:
-- Números, Textos, Datas

-- 1) Números: - utilizar sinais lógicos:
-- 		=, >, <, <=, >=, <>.
select *
from produtos
where Preco_Unit >= 1100;

-- 2) Textos: =
select *
from produtos
where Marca_Produto = 'DELL';

-- 3) Datas: - utilizar sinais lógicos:
-- 		=, >, <, <=, >=, <>.
select *
from pedidos
where Data_Venda = '2019-01-03';

-- operador AND
select *
from clientes
where Estado_Civil = 's' and Sexo = 'm';

-- operador OR
SELECT *
from produtos
where Marca_Produto = 'dell' or Marca_Produto = 'samsung';

-- Praticando:
-- ex1: Apenas produtos preço >= 1800
select * 
from produtos
where Preco_Unit >= 1800;

-- ex2: apenas produtos com preços = 1100
select *
from produtos
where Preco_Unit = 1100;

-- ex3: apenas produtos marca = dell
-- e preço >= 1000
select *
from produtos
where Marca_Produto = 'dell' and Preco_Unit >= 1000;

-- ex4: apenas pedidos feitos em 03/01/2019
select *
from pedidos
limit 3;
select *
from pedidos
where Data_Venda = '2019-01-03' 
	and Receita_Venda <> 600
    and ID_Loja = 6;

-- ex5: clientes solteiros do sexo M
select *
from clientes
where Estado_Civil = 'c' 
	and Sexo = 'm'
    and Renda_Anual > 2000;

-- ex6: apenas produtos dell ou samsung
select *
from produtos
where Marca_Produto = 'dell' 
	or Marca_Produto = 'samsung';
    
-- ##################################
-- Funções de agregação:
-- count, count(*), count(distinct), sum, avg, min, max

-- count: ele ignora os valores nulos da coluna
select
	count(Nome)
from clientes;
select
	count(Telefone)
from clientes;

-- sem ignorar os valores nulos
-- retorna o numero total de linhas
select 
	count(*)
from clientes;

-- retorna os valores distintos de uma coluna da tabela
select
	count(distinct Escolaridade)
from clientes;

-- sum: soma dos valores de uma coluna
select 
	sum(Receita_Venda)
from pedidos;

-- avg: média dos valores
select
	avg(Receita_Venda)
from pedidos;

-- min: valor min da coluna
select
	min(Receita_Venda)
from pedidos;

-- max: valor max da coluna
select
	max(Receita_Venda)
from pedidos;

-- Praticando:
-- ex1:
select 
	sum(Receita_Venda) as 'Soma das Receitas Vendas',
    avg(Receita_Venda) as 'Média das Vendas',
    min(Receita_Venda) as 'Valor Min das Vendas',
    max(Receita_Venda) as 'Valor Max das Vendas'
from pedidos;

-- #######################################
-- Funçoes de Agrupamentos
-- Group by
select 
	Sexo, -- informar a coluna
    count(*) as 'Qtidade. Clientes'
    -- calculo que quer fazer
from clientes -- tabela
group by sexo; -- agrupar sexo somado

-- ex2:
select 
	Marca_Produto,
    count(*) as 'Qdidas de Produtos',
    min(Preco_Unit) as 'preço min',
    max(Preco_Unit) as 'preço max',
    avg(Preco_Unit) as 'media de preços'
from produtos
group by Marca_Produto;

select *
from produtos;

-- ex3:
select *
from pedidos;

select
	ID_Loja, 
    count(distinct Data_venda),
    sum(Receita_Venda),
    sum(Custo_Venda)
from pedidos
group by ID_Loja;

-- ################################
-- Relacionando Tabelas
-- Inner Join

select nome,  nome_produto, marca_produto
from clientes
inner join produtos
on clientes.ID_cliente = id





