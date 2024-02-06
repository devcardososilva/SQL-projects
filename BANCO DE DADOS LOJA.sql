CREATE DATABASE IF NOT EXISTS LOJA;
USE LOJA;

-- Cria a tabela 'ITENS_COMPRADOS'
CREATE TABLE IF NOT EXISTS ITENS_COMPRADOS (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_NF INT,
    ID_ITEM INT,
    COD_PROD INT,
    VALOR_UNIT DECIMAL(10, 2),
    QUANTIDADE INT,
    DESCONTO FLOAT
);

-- Insere os dados na tabela 'ITENS_COMPRADOS'
INSERT INTO ITENS_COMPRADOS (ID, ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO)
VALUES
(default,'1','1','1','25.00','10','5'),
(default,'1','2','2','13.50','3', NULL),
(default,'1','3','3','15.00','2', NULL),
(default,'1','4','4','10.00','1', NULL),
(default,'1','5','5','30.00','1', NULL),
(default,'2','1','3','15.00','4', NULL),
(default,'2','2','4','10.00','5', NULL),
(default,'2','3','5','30.00','7', NULL),
(default,'3','1','1','25.00','5', NULL),
(default,'3','2','4','10.00','4', NULL),
(default,'3','3','5','30.00','5', NULL),
(default,'3','4','2','13.50','7', NULL),
(default,'4','1','5','30.00','10','15'),
(default,'4','2','4','10.00','12','5'),
(default,'4','3','1','25.00','13','5'),
(default,'4','4','2','13.50','15','5'),
(default,'4','1','3','15.00','3', NULL),
(default,'5','2','5','30.00','3', NULL),
(default,'6','1','1','25.00','22','15'),
(default,'6','2','3','15.00','25','20'),
(default,'7','1','1','25.00','10','3'),
(default,'7','2','2','13.50','10','4'),
(default,'7','3','3','15.00','10','4'),
(default,'7','4','5','30.00','10','1');

select * from ITENS_COMPRADOS;

/* MODIFICAR */
set SQL_SAFE_UPDATES = 0;

update ITENS_COMPRADOS set DESCONTO = 3.5 where DESCONTO = 5;

/* SOMA*/
select sum(QUANTIDADE) as TOTAL_VALOR from ITENS_COMPRADOS where VALOR_UNIT > 25;

/* CONTA */
select count(*) as TOTAL_PROD1 from ITENS_COMPRADOS where COD_PROD = 1;	

/* MEDIA */
select AVG(VALOR_UNIT) as MEDIA from ITENS_COMPRADOS;

/* VALOR TOTAL */
select sum((VALOR_UNIT - ifnull(DESCONTO, 0)) * QUANTIDADE) as VALOR_TOTAL_VENDIDO from ITENS_COMPRADOS;

/* MAIOR OU MENOR */
select max(VALOR_UNIT) as VALOR_MAIOR from ITENS_COMPRADOS;

select min(VALOR_UNIT) as VALOR_MAIOR from ITENS_COMPRADOS;

/* AGRUPAR */
select COD_PROD, count(*) as AGRUPAR from ITENS_COMPRADOS group by COD_PROD order by COD_PROD;

/* ITENS VENDIDOS SEM DESCONTO */
select ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT  from ITENS_COMPRADOS where DESCONTO is null;

/* ITENS VENDIDOS COM DESCONTO */
select ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, (VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100))) * QUANTIDADE as VALOR_TOTAL_VENDIDO from ITENS_COMPRADOS where DESCONTO is not null;
 