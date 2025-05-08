-- Criação do Banco de Dados " 
CREATE DATABASE andrea_market_db;

-- Seleção do Banco
USE andrea_market_db;

-- 1) CRIAÇÃO DAS TABELAS 
-- Criação da Tabela "produtor"
CREATE TABLE produtor (
codProd int auto_increment primary key,
nomeProdutor varchar(100) NOT NULL
);

-- Criação da Tabela "item"
CREATE TABLE item (
idItem  int auto_increment primary key,
nomeItem varchar(100) NOT NULL,
valorUnit decimal(10,2) NOT NULL
);

-- Criação da Tabela "nf"
CREATE TABLE nf (
idNf int auto_increment primary key,
numeroNF varchar(20) NOT NULL,
dataNf date NOT NULL
);

-- Criação da Tabela "venda"
CREATE TABLE venda (
idVenda int auto_increment primary key,
fkNf int,
fkItem int,
fkProd int,
quantidade int NOT NULL,
desconto decimal(10,2) DEFAULT 0.00,
foreign key(fkNf) references nf(idNf),
foreign key(fkItem) references item(idItem),
foreign key(fkProd) references produtor(codProd)
);

-- 2) Criação de informações de 5 produtos, 5 itens, 5 produtores e 7nfs

-- Inserindo 5 produtos a Tabela "item"
INSERT INTO item (idItem, nomeItem, valorUnit) VALUES
(1, 'Feijão', 8.80),
(2, 'Arroz', 6.50),
(3, 'Café', 12.00),
(4, 'Ovo', 21.00),
(5, 'Òleo', 9.50);

-- Visualizando a Tabela "item"
SELECT * FROM item; 

-- Inserindo 5 produtores a Tabela "produtor"
INSERT INTO produtor (codProd, nomeProdutor) VALUES
(1, 'Osvaldo Silva'),
(2, 'Maria Souza'),
(3, 'Carlos Lima'),
(4, 'Ana Costa'),
(5, 'Pedro Rocha');

-- Visualizando a Tabela produtor
SELECT * FROM produtor;

-- Inserindo 7 notas fiscais a Tabale "nf"
INSERT INTO nf (idNf, numeroNF, dataNf) VALUES
(1, 'NF001', '2024-01-10'),
(2, 'NF002', '2024-01-15'),
(3, 'NF003', '2024-01-20'),
(4, 'NF004', '2024-02-01'),
(5, 'NF005', '2024-02-10'),
(6, 'NF006', '2024-03-01'),
(7, 'NF007', '2024-03-10');

-- Visualizando a Tabela produtor
SELECT * FROM nf;

-- 3) REPRODUZIR INFORMAÇÕES NA TABELA DE VENDAS (FIGURA)
INSERT INTO venda (fkNf, fkItem, fkProd, quantidade, desconto) VALUES
(1, 1, 1, 10, 5),
(1, 2, 2, 3, 0),
(1, 3, 3, 2, 0),
(1, 4, 4, 1, 0),
(1, 5, 5, 1, 0),
(2, 1, 3, 4, 0),
(2, 2, 4, 5, 0),
(2, 3, 5, 7, 0),
(3, 1, 1, 5, 0),
(3, 2, 4, 4, 0),
(3, 3, 5, 5, 0),
(3, 4, 2, 7, 0),
(4, 1, 5, 10, 15),
(4, 2, 4, 12, 5),
(4, 3, 1, 13, 5),
(4, 4, 2, 15, 5),
(5, 1, 3, 3, 0),
(5, 2, 5, 6, 0),
(6, 1, 1, 22, 15),
(6, 2, 3, 20, 0),
(7, 1, 1, 10, 3),
(7, 2, 2, 10, 4),
(7, 4, 5, 10, 1);

-- Visualizando a Tabela produtor
SELECT * FROM venda;

-- 4) Faça as seguintes mudanças:

-- Atualizar o valor do produto da tabela "item" com código 5 para 2 reais a menos
UPDATE item 
SET valorUnit = valorUnit - 2 
WHERE idItem = 5;

-- Adicione as colunas endereço na tabela "produtor"
ALTER TABLE produtor 
ADD COLUMN endereço VARCHAR(100),
ADD COLUMN cidade VARCHAR(45),
ADD COLUMN UF VARCHAR(2);

-- Atualize cada um dos endereços
UPDATE produtor 
SET endereço = 'Rua Portela, 130, Vila Carolina', cidade = 'Petrolina', UF = 'PE' 
WHERE codProd = 1;

UPDATE produtor 
SET endereço = 'Av. Júlio de Melo, 781, Centro', cidade = 'Rio de Janeiro', UF = 'RJ' 
WHERE codProd = 2;

UPDATE produtor 
SET endereço = 'Trav. Princesa Isabel, 312, Areia Branca', cidade = 'Fortaleza', UF = 'CE' 
WHERE codProd = 3;

UPDATE produtor 
SET endereço = 'Av. D, 321, João de Deus', cidade = 'Curitiba', UF = 'PR' 
WHERE codProd = 4;

UPDATE produtor 
SET endereço = 'Rua Cordel Encantado, 133', cidade = 'Recife', UF = 'PE' 
WHERE codProd = 5;

-- Para o produto 3 da NF 3 adicione um desconto de 10%
UPDATE venda 
SET desconto = 10
WHERE fkItem = 3 AND fkNf = 3;

 -- Liste todos os dados da tabela  "item"
SELECT * FROM item;

--  Liste apenas o nome dos produtores (Selecionar colunas especificas)
SELECT nomeProdutor
FROM produtor;

-- Liste o nome e o valor unitário dos itens cujo o valor unitário serja maior que 50 reais
SELECT nomeItem, valorUnit
FROM item
WHERE valorUnit > 9;

-- Mostre o nome de todos os produtores que estejam na cidade de Fortaleza
SELECT nomeProdutor
FROM produtor
WHERE cidade = 'Fortaleza';

-- Exiba o número da nota e a data de emissão das notas fiscais emitidas no dia (definir dia cadastrado no banco)
SELECT numeroNf, dataNf 
FROM nf 
WHERE dataNf = '2024-01-10';

-- SELECT com Limit

-- Mostre os 3 primeiros itens da tabela item
SELECT nomeItem 
FROM item 
LIMIT 3;

-- Liste os 2 primeiros produtores cadastrados no Estado de PE
SELECT *
FROM produtor 
WHERE UF = 'PE' 
LIMIT 2;

-- Liste o nome e o valor unitário dos itens ordenados do mais caro para o mais barato
SELECT nomeItem, valorUnit 
FROM item 
ORDER BY valorUnit DESC;

-- Exiba os nomes dos produtores ordenados por ordem alfabética pela cidade
SELECT nomeProdutor, cidade 
FROM produtor 
ORDER BY cidade ASC;

-- Conte o quantos tipos de produtos foram vendidos por nota fiscal 
SELECT fkNf, COUNT(DISTINCT fkItem) AS tipos_produtos 
FROM venda 
GROUP BY fkNf;

-- Conte quantas vendas cada produtor participou 
SELECT fkProd, COUNT(*) AS total_vendas 
FROM venda 
GROUP BY fkProd;

-- Liste todas as cidades únicas onde há produtores
SELECT DISTINCT cidade 
FROM produtor;

-- Mostre todos os percentuais de desconto diferentes aplicados nas vendas
SELECT DISTINCT desconto 
FROM venda;





