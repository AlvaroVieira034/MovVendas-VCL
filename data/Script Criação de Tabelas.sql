use testewk

create table tab_produto (
   cod_produto int identity(1,1) not null primary key,
   des_descricao varchar(100),
   val_preco float
  );

insert into tab_produto (des_descricao, val_preco) values ('HD EXTERNO SEAGATE 1 TB', 760);
insert into tab_produto (des_descricao, val_preco) values ('PEN DRIVE 16 GB', 22);


create table tab_cliente (
   cod_cliente int identity(1,1) not null primary key,
   des_nomecliente varchar(100),
   des_cidade varchar(100),
   des_uf varchar(2)
  );

insert into tab_cliente (des_nomecliente, des_cidade, des_uf) values ('ALVARO VIEIRA', 'BELO HORIZONTE', 'MG');
insert into tab_cliente (des_nomecliente, des_cidade, des_uf) values ('JOICE AMORIM', 'NOVA LIMA', 'MG');

create table tab_venda (
   cod_venda int identity(1,1) not null primary key,
   dta_venda date,
   cod_cliente varchar(100),
   val_venda float
);

insert into tab_venda (dta_venda, cod_cliente, val_venda)
values ('2024-01-01', 1, 760);
insert into tab_venda (dta_venda, cod_cliente, val_venda)
values ( '2024-01-01', 2, 44);

CREATE TABLE tab_venda_item (
   id_venda INT identity(1,1) NOT NULL PRIMARY KEY,
   cod_venda INT NOT NULL,
   cod_produto INT NOT NULL,
   val_quantidade INT NOT NULL,
   val_precounitario FLOAT,
   val_totalitem FLOAT,
   CONSTRAINT fk_cod_venda FOREIGN KEY (cod_venda) REFERENCES tab_venda (cod_venda)
);

insert into tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem)
values (1, 1, 1, 760, 760);

insert into tab_venda_item (cod_venda, cod_produto, val_quantidade, val_precounitario, val_totalitem)
values (2, 2, 2, 22, 44);

select * from tab_cliente
select * from tab_produto
select * from tab_venda
select * from tab_venda_item





