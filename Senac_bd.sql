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
	estado nvarchar(35) not null
);

create table curso(
	id_curso int identity(1,1) primary key,
	nome_curso nvarchar(35) not null,
	data_inicio date  not null,
	data_termino date not null,
	carga_horario int not null,
	valor_curso smallmoney not null
	modalidade varchar(30) not null,
	unidade varchar(30) not null,
	descricao nvarchar(100)
);

create table uc(
	id_uc int identity(1,1) primary key,
	data_inicio date,
	data_termino date,
	horario_uc time
);

create table funcionario(
	id_funcionario int identity(1,1) primary key,
	nome varchar(50) not null,
	telefone nvarchar(11) not null,
	email nvarchar(30) unique,
	data_nascimento date unique not null,
	documento nvarchar(20) unique not null,
	salario smallmoney,
	id_endereco int unique not null,
	foreign key (id_endereco) references endereco(id_endereco)
);

create table senac(
	unidade int identity(1,1) primary key,
	cnpj varchar(30) unique not null,
	nome varchar(30) not null,
	telefone nvarchar(11) not null,
	email nvarchar(30) unique,
	id_endereco int unique not null,
	foreign key (id_endereco) references endereco(id_endereco)
);

create table aluno(
	cpf char(11)  primary key,
	nome varchar(30) not null,
	telefone nvarchar(30) not null,
	email nvarchar(30) not null,
	data_inicio date not null,
	data_termino date not null,
	avaliacao nvarchar(100),
	id_endereco int unique not null,
	foreign key (id_endereco) references endereco(id_endereco)
);

create table pedagogo(
	id_pedagogo int identity(1,1) primary key,
	turma nvarchar(15),
	id_funcionario int unique not null,
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table asg(
	id_asg int identity(1,1) primary key,
	turma nvarchar(15),
	id_funcionario int unique not null,
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table professor(
	id_professor int identity(1,1) primary key,
	turma nvarchar(15),
	id_funcionario int unique not null,
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table contrato(
	id_contrato int identity(1,1) primary key,
	unidade int unique not null,
	id_funcionario int unique not null,
	foreign key (unidade) references senac(unidade),
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table cursos(
	id_cursos int identity(1,1) primary key,
	id_curso int unique not null,
	unidade int unique not null,
	turno char(10) not null,
	foreign key (id_curso) references curso(id_curso),
	foreign key (unidade) references senac(unidade)
);



create table turma(
	id_turma int identity(1,1) primary key,
	id_curso int unique not null,
	id_uc int unique not null,
	foreign key (id_curso) references curso(id_curso),
	foreign key (id_uc) references uc(id_uc)
);

create table matricula(
	id_matricula int identity(1,1) primary key,
	unidade int unique not null,
	cpf char(11) unique not null,
	foreign key (unidade) references senac(unidade),
	foreign key (cpf) references aluno(cpf)
);

create table a_psg(
	id_psg int identity(1,1) primary key,
	cpf char(11) unique not null,
	foreign key (cpf) references aluno(cpf)
);

create table a_comercial(
	id_comercial int identity(1,1) primary key,
	cpf char(11) unique not null,
	foreign key (cpf) references aluno(cpf)
);

create table a_bolsista(
	id_bolsista int identity(1,1) primary key,
	cpf char(11) unique not null,
	foreign key (cpf) references aluno(cpf)
);	