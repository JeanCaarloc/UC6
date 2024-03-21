-- Criar o banco de dados
create database senac;
use senac;
-- Criando a tabela funcionario

create table endereco(
	id_endereco int identity(1,1) primary key,
	cep numeric(8) not null,
	rua_avenida nvarchar(35) not null,
	numero float not null,
	complemento nvarchar(35),
	bairro nvarchar(35) not null,
	cidade nvarchar(35) not null,
	estado nvarchar(35)
);

create table curso(
	id_curso int identity(1,1) primary key,
	nome_curso nvarchar(35) not null,
	data_inicio date not null,
	data_termino date not null,
);

create table funcionario(
	id_funcionario int identity(1,1) primary key,
	nome varchar(50) not null,
	telefone nvarchar(11) not null,
	email nvarchar(30) unique,
	data_nascimento date not null,
	documento nvarchar(20) unique,
	salario smallmoney
);

create table senac(
	id_senac int identity(1,1) primary key,
);