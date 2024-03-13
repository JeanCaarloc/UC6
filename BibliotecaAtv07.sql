create database biblioteca;

use biblioteca;


create table cliente(
	cod_cliente int primary key,
	nome nvarchar(20),
	email nvarchar(30),
	telefone_1 numeric(11),
	telefone_2 numeric(11),
	rua nvarchar(30),
	bairro nvarchar(30),
	cidade nvarchar(30),
	estado nvarchar(30)
);

insert into cliente(
	cod_cliente, nome, email, telefone_1, telefone_2, rua, bairro, cidade, estado
)
values
(1, 'Bartolomeu', 'Bartolomeusenac@gmail.com','11987654360', '11925361485', 'rua senac Pcliente 21', 'Capão Redondo', 'São Paulo', 'São Paulo'),
(2, 'Jeronimo', 'Jeronimosenac@gmail.com', '11985259636', '11974143685', 'rua senac Scliente 41', 'Tatuape', 'São Paulo', 'São Paulo');

create table pessoa_fisica(
	cod_cliente int,
	rg char(9),
	cpf int primary key
	foreign key (cod_cliente) references cliente(cod_cliente)
);

insert into pessoa_fisica(
	cod_cliente, rg, cpf
)
values
(1,'851236544','0789321452');

create table pessoa_juridica(
	cod_cliente int,
	cnpj char(14) primary key,
	ie char (9),
	foreign key (cod_cliente) references cliente (cod_cliente)
);

--ie significa inscrição estadual

insert into pessoa_juridica(
	cod_cliente, cnpj,ie
)
values
(2,'851236544','78925874136987','');

create table pedido(
	cod_pedido int primary key,
	cod_cliente int,
	data_pedido date,
	valor_pedido numeric
	foreign key (cod_cliente) references cliente (cod_cliente)
);

create table editora(
	cod_editora int primary key,
	telefone_1 numeric(11),
	telefone_2 numeric(11),
	nome_contato nvarchar(20),
	email nvarchar(20)
);

create table livro(
	cod_livro int primary key,
	cod_editora int,
	valor decimal(6),
	ano_publicacao date,
	categoria nvarchar(15),
	titulo nvarchar(15),
	autor nvarchar(20),
	foreign key (cod_editora) references editora (cod_editora)

);

create table estoque(
	cod_editora int,
	cod_livro int,
	qtde_estoque SmallInt,
	cod_estoque int primary key,
	foreign key (cod_editora) references editora (cod_editora),
	foreign key (cod_livro) references livro (cod_livro)
);


create table item_pedido(
	cod_pedido int,
	cod_livro int,
	qtde_pedido numeric,
	valor_item decimal(7),
	foreign key (cod_pedido) references pedido (cod_pedido),
	foreign key (cod_livro) references livro (cod_livro)
);





