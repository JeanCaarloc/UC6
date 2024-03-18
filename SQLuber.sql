-- Criando um banco de dados
create database uber;

-- Usando o banco de dados criado
use uber;
-- Criando uma tabela na Uber
create table  uber(
	cnpj nvarchar(14) primary key,
	nome nchar(30),
	telefone numeric(11),
	email nvarchar(50),
	url_site nvarchar(50)
);

insert into uber(
	cnpj, nome, telefone, email, url_site
)
values
('12345678901234','UberBR','84912345678','uberbr@gmail.com','https://www.uber.com/br/pt-br/'),
('12345678900000','UberEUA','14145435515', 'uberusa@gmail.com','https://www.uber.com/en/');


create table enderecouber(
	id_enderecouber int primary key,
	pais nvarchar(30),
	estado nvarchar(30),
	cidade nvarchar(30),
	bairro nvarchar(30),
	rua nvarchar(30), 
	cnpj nvarchar(14) 
	foreign key (cnpj) references uber(cnpj)
);

select * from enderecouber;

insert into enderecouber(
	id_enderecouber, pais, estado, cidade, bairro, rua, cnpj
)
values
(1, 'Brasil', 'Rio Grande do Norte', 'Natal', 'Vila Olimpia', 'rua Olimpia 36', '12345678901234');

create table conta(
	id_registro int primary key,
	foto image,
	cnpj nvarchar(14)
	foreign key (cnpj) references uber(cnpj)
);

insert into conta(
	id_registro, foto, cnpj
)
values
(1,0x89504E470D0A1A0A0000000D4948445200000028000000D8000000D8000000D80000006D88,'12345678901234');

select * from conta;

create table cash(
	id_cash int primary key,
	valor numeric,
	id_registro int,
	foreign key (id_registro) references conta(id_registro)
);

create table endereco(
	id_endereco int primary key,
	cidade nvarchar(30),
	bairro nvarchar(30),
	rua nvarchar(30),
);

insert into endereco(
	id_endereco, cidade, bairro, rua
)
values
('1', 'Rio Grande do Norte', 'Nossa Senhora da Apresentação', 'Pico da Tijuca'),
('2', 'São Paulo', 'Interlagos', 'Vila da  Paz');

insert into endereco(
	id_endereco, cidade, bairro, rua
)
values
('3','Natal','Potengi','Rua do Senac');

create table cliente(
	id_cliente int primary key,
	nome nvarchar(50),
	cpf char(11),
	numero char(13),
	email nvarchar (50),
	genero nchar (20),
	data_nascimento date,
	id_endereco int,
	foreign key (id_endereco) references endereco(id_endereco)
);

--Alterar Informacoes de Cliente Pf e PJ

insert into cliente(
	id_cliente, nome, cpf, numero, email, genero, data_nascimento, id_endereco
)
values
(1,'Jeremias','31649765432','84954327812','Jeremiassenac@gmail.com','Masculino','1993-02-01','2'), -- Pessoa Fisica
(2,'Cleide','31649765000','84954327111','Cleidesenac@gmail.com','Feminina','1990-10-9','1'); -- Pessoa Juridica

select * from cliente;

create table pf(
	id_pf int primary key,
	id_cliente int,
	foreign key (id_cliente) references cliente(id_cliente)
);

create table pj(
	id_pj int primary key,
	id_cliente int,
	foreign key (id_cliente) references cliente(id_cliente)
);

create table motorista(
	id_motorista int primary key,
	nome nvarchar(50),
	cpf char(11),
	numero char(13),
	email nvarchar(50),
	cnh char(9),
	data_nascimento date,
	id_endereco int,
	foreign key (id_endereco) references endereco(id_endereco)
);

insert into motorista(
	id_motorista, nome, cpf, numero, email, cnh, data_nascimento, id_endereco
)
values
(1,'Whinderson', '32165498712','84974859636','Whindersonsenac@gmail.com','924723741','1995-05-01','1');

select * from motorista;

create table carro(
	id_placacarro char(7) primary key, 
	ano nchar(9),
	modelo nvarchar(15),
	cor nvarchar(10),
	id_motorista int,
	foreign key (id_motorista) references motorista(id_motorista)
);

create table uberx(
	id_uberx int primary key,
	id_placacarro char(7),
	foreign key (id_placacarro) references carro(id_placacarro)
);

create table uberflash(
	id_uberflash int primary key,
	id_placacarro char(7),
	foreign key (id_placacarro) references carro(id_placacarro)
);

create table ubercomfort(
	id_ubercomfort int primary key,
	id_placacarro char(7),
	foreign key (id_placacarro) references carro(id_placacarro)
);

create table moto(
	id_placamoto char(7) primary key,
	ano nchar(9),
	modelo nvarchar(15),
	cor nvarchar(10),
	id_motorista int,
	foreign key (id_motorista) references motorista(id_motorista)
);

create table corrida(
	id_motorista int,
	id_cliente int,
	id_corrida int primary key,
	preco numeric,
	id_endereco int,
	foreign key (id_endereco) references endereco(id_endereco),
	foreign key (id_motorista) references motorista(id_motorista),
	foreign key (id_cliente) references cliente(id_cliente)
);

create table pagamento(
	id_pagamento int primary key,
	id_corrida int,
	foreign key (id_corrida) references corrida(id_corrida),
);

create table dinheiro(
	id_dinheiro int primary key,
	id_pagamento int,
	foreign key (id_pagamento) references pagamento (id_pagamento)
);

create table cartao(
	id_cartao int primary key,
	bandeira nvarchar(15),
	tipo_cartao nvarchar(15),
	validade_cartao nchar(5),
	numero_cartao nchar(16),
	id_pagamento int,
	foreign key (id_pagamento) references pagamento (id_pagamento)
);

create table debito(
	id_debito int primary key,
	id_cartao int,
	foreign key (id_cartao) references cartao (id_cartao)
);

create table credito(
	id_credito int primary key,
	id_cartao int,
	limite numeric,
	foreign key (id_cartao) references cartao (id_cartao)
);

create table pix(
	id_pix int primary key,
	chave_pix nvarchar(30),
	id_pagamento int,
	foreign key (id_pagamento) references pagamento (id_pagamento)
);

create table extrato(
	id_extrato int primary key,
	id_registro int,
	id_corrida int,
	foreign key (id_corrida) references corrida(id_corrida),
	foreign key (id_registro) references conta(id_registro)
);

create table avaliacao(
	id_avaliacao numeric primary key,
	comentario text,
	id_motorista int,
	id_cliente int,
	id_corrida int,
	foreign key (id_corrida) references corrida(id_corrida),
	foreign key (id_motorista) references motorista(id_motorista),
	foreign key (id_cliente) references cliente(id_cliente)
);

select * from uber;
select * from endereco;
select * from enderecouber;