-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS testewk;
USE testewk;

-- Iniciar transação
START TRANSACTION;

-- Criar tabela de produtos
CREATE TABLE IF NOT EXISTS tab_produto (
   cod_produto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   des_descricao VARCHAR(100),
   val_preco DOUBLE
);

-- Inserir dados na tabela de produtos
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('HD EXTERNO SEAGATE 1 TB', 760);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('PEN DRIVE 16 GB', 22);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('PLACA DE VIDEO GEFORCE', 865);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('KIT TECLADO E MOUSE DELL', 128);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('MOUSE PAD EM COURO', 45);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('ROTEADOR HUAWEI', 268);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('PLACA MAE INTEL I7 12a GERAÇÃO', 1580);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('NOTEBOOK DELL GAMER', 12760);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('MONITOR SAMSUNG 24 POL', 1138);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('MOUSE SEM FIO LOGITECH', 85);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('TECLADO SEM FIO LOGITECH', 90);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('IMPRESSORA HP LASER', 1465);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('TONER IMPRESSORA HP', 418);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('MONITOR LG 22 POL', 962);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('HD SSD 1 TB', 825);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('NOTEBOOK DELL I5 8GB SSD 1TB', 3760);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('CADEIRA GAMER DXRACER', 1760);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('PLACA MAE ASUS', 1250);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('GABINETE GAMER', 657);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('KIT TECLADO/MOUSE/HEADSET GAMER', 760);
INSERT INTO tab_produto (des_descricao, val_preco) VALUES ('HEADSET LOGITECH', 160);


-- Criar tabela de clientes
CREATE TABLE IF NOT EXISTS tab_cliente (
   cod_cliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   des_nomecliente VARCHAR(100),
   des_cidade VARCHAR(100),
   des_uf VARCHAR(2)
);

-- Inserir dados na tabela de clientes
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('ALVARO VIEIRA', 'BELO HORIZONTE', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('JOICE AMORIM', 'NOVA LIMA', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('PEDRO MARTINS DOS SANTOS', 'BELO HORIZONTE', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('CARLA DIAS', 'CONTAGEM', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('VICTOR DO HORTO', 'BELO HORIZONTE', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('PATRICIA VIEIRA', 'NOVA LIMA', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('MARLI BARROS', 'SAO PAULO', 'SP');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('JAIME ELIAS PESCE', 'SAO PAULO', 'SP');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('JAQUELINE MARIA DA COSTA', 'NOVA LIMA', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('RONALDO GAUCHO', 'BELO HORIZONTE', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('DIEGO TARDELLI', 'BELO HORIZONTE', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('EDER ALEIXO', 'VESPASIANO', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('SIMONE SILVA', 'BELO HORIZONTE', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('MARCELO VIEIRA', 'BELO HORIZONTE', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('MARIA TERESA FRANÇA', 'ARAGUARI', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('RAQUEL COSTA', 'BELO HORIZONTE', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('CAROLINA ANDRADE', 'NOVA LIMA', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('HULK PARAIBA', 'BELO HORIZONTE', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('ALANA BITTENCOURT', 'NOVA LIMA', 'MG');
INSERT INTO tab_cliente (des_nomecliente, des_cidade, des_uf) VALUES ('REINALDO JOSE DE LIMA', 'BELO HORIZONTE', 'MG');


-- Criar tabela de vendas
CREATE TABLE IF NOT EXISTS tab_venda (
   cod_venda INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   dta_venda DATE,
   cod_cliente INT NOT NULL,
   val_venda DOUBLE,
   CONSTRAINT fk_cod_cliente FOREIGN KEY (cod_cliente) REFERENCES tab_cliente(cod_cliente)
);

-- Inserir dados na tabela de vendas
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-01-01', 1, 760);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-01-01', 2, 44);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-02-10', 12, 175);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-06-11', 10, 3760);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-07', 4, 320);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-09', 2, 1797);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-09', 16, 1250);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-10', 7, 1883);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-10', 5, 1258);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-11', 12, 3993);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-12', 10, 440);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-12', 1, 4722);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-16', 11, 1138);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-16', 12, 160);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-18', 8, 1848);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-19', 8, 1760);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-19', 14, 657);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-19', 14, 3760);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-20', 17, 825);
INSERT INTO tab_venda (dta_venda, cod_cliente, val_venda) VALUES ('2024-09-22', 1, 2445);



-- Criar tabela de itens da venda
CREATE TABLE IF NOT EXISTS tab_venda_item (
   id_venda INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
   cod_venda INT NOT NULL,
   cod_produto INT NOT NULL,
   val_quantidade INT NOT NULL,
   val_precounitario DOUBLE,
   val_totalitem DOUBLE,
   CONSTRAINT fk_cod_venda FOREIGN KEY (cod_venda) REFERENCES tab_venda(cod_venda),
   CONSTRAINT fk_cod_produto FOREIGN KEY (cod_produto) REFERENCES tab_produto(cod_produto)
);

-- Inserir dados na tabela de itens da venda
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (1, 1, 1, 760, 760);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (2, 2, 2, 22, 44);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (3, 10, 1, 85, 85);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (3, 11, 1, 85, 85);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (4, 16, 1, 3760, 3760);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (5, 21, 2, 160, 320);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (6, 1, 1, 760, 760);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (6, 2, 2, 44, 44);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (6, 3, 1, 865, 865);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (6, 4, 1, 128, 128);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (7, 18, 1, 1250, 1250);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (8, 12, 1, 1465, 1465);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (8, 13, 1, 418, 418);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (9, 18, 1, 1250, 1250);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (10, 14, 1, 962, 962);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (10, 15, 1, 825, 825);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (10, 18, 1, 1250, 1250);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (10, 19, 1, 657, 657);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (10, 20, 1, 329, 329);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (11, 5, 2, 45, 90);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (11, 10, 2, 85, 170);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (11, 11, 2, 90, 180);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (12, 16, 1, 3760, 3760);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (12, 14, 1, 962, 962);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (13, 9, 1, 1138, 1138);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (14, 21, 1, 160, 160);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (15, 6, 1, 268, 268);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (15, 7, 1, 1580, 1580);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (16, 17, 1, 1760, 1760);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (17, 19, 1, 657, 657);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (18, 16, 1, 3760, 3760);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (19, 15, 1, 825, 825);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (20, 7, 1, 1580, 1580);
INSERT INTO tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem) VALUES (20, 3, 1, 865, 865);

-- Confirmar a transação
COMMIT;
