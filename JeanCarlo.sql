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

create table uc(
	id_uc int identity(1,1) primary key,
	data_inicio date not null,
	data_termino date not null,
	horas_uc time not null
);

create table forma_pagamento(
	id_formaPagamento int identity(1,1) primary key,
	tipo nvarchar(50) not null,
	descricao nvarchar(2000)
);

create table pagamento(
	id_pagamento int identity(1,1) primary key,
	data_pagamento date not null,
	hora_pagamento time not null,
	parcela int,
	id_formaPagamento int unique not null,
	foreign key (id_formaPagamento) references forma_pagamento(id_formaPagamento)
);

create table funcionario(
	id_funcionario int identity(1,1) primary key,
	nome varchar(50) not null,
	telefone nvarchar(11) not null,
	email nvarchar(30) unique,
	data_nascimento date unique not null,
	documento nvarchar(20) unique not null,
	salario smallmoney not null,
	inicio_contrato date not null,
	experiencia nvarchar(35) not null,
	tempo_experiencia nvarchar(35) not null,
	id_endereco int unique not null,
	foreign key (id_endereco) references endereco(id_endereco)
);

create table curso(
	id_curso int identity(1,1) primary key,
	nome_curso nvarchar(35) not null,
	data_inicio date  not null,
	data_termino date not null,
	carga_horario int not null,
	valor_curso smallmoney not null,
	modalidade varchar(30) not null,
	unidade varchar(30) not null,
	descricao nvarchar(100),
	vagas int not null,
	turno nvarchar(35) not null,
	qnt_matriculas nvarchar(35) not null,
	id_funcionario int unique not null,
	id_pagamento int unique not null,
	foreign key (id_funcionario) references funcionario(id_funcionario),
	foreign key (id_pagamento) references pagamento(id_pagamento)
);

create table livre(
	id_livre int identity(1,1) primary key,
	id_curso int unique not null,
	foreign key (id_curso) references curso(id_curso)
);

create table tecnico(
	id_tecnico int identity(1,1) primary key,
	id_curso int unique not null,
	foreign key (id_curso) references curso(id_curso)
);

create table idioma(
	id_idioma int identity(1,1) primary key,
	id_curso int unique not null,
	foreign key (id_curso) references curso(id_curso)
);

create table italiano(
	id_italiano int identity(1,1) primary key,
	id_idioma int unique not null,
	foreign key (id_idioma) references idioma(id_idioma)
);

create table frances(
	id_frances int identity(1,1) primary key,
	id_idioma int unique not null,
	foreign key (id_idioma) references idioma(id_idioma)
);

create table alemao(
	id_alemao int identity(1,1) primary key,
	id_idioma int unique not null,
	foreign key (id_idioma) references idioma(id_idioma)
);

create table espanhol(
	id_espanhol int identity(1,1) primary key,
	id_idioma int unique not null,
	foreign key (id_idioma) references idioma(id_idioma)
);

create table ingles(
	id_ingles int identity(1,1) primary key,
	id_idioma int unique not null,
	foreign key (id_idioma) references idioma(id_idioma)
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
	cpf char(11) primary key,
	nome varchar(30) not null,
	telefone nvarchar(30) not null,
	email nvarchar(30) not null,
	data_inicio date not null,
	data_termino date not null,
	avaliacao nvarchar(100),
	matricula_curso nvarchar(35)not null,
	genero nvarchar(35),
	id_endereco int unique not null,
	id_pagamento int unique not null,
	foreign key (id_endereco) references endereco(id_endereco),
	foreign key (id_pagamento) references pagamento(id_pagamento)
);

create table pedagogo(
	id_pedagogo int identity(1,1) primary key,
	id_funcionario int unique not null,
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table asg(
	id_asg int identity(1,1) primary key,
	id_funcionario int unique not null,
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table porteiro(
	id_porteiro int identity(1,1) primary key,
	id_funcionario int unique not null,
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table professor(
	id_professor int identity(1,1) primary key,
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
	turno varchar(10) not null,
	foreign key (id_curso) references curso(id_curso),
	foreign key (unidade) references senac(unidade)
);

create table turma(
	id_turma int identity(1,1) primary key,
	id_curso int unique not null,
	id_uc int unique not null,
	id_professor int unique not null,
	cpf char(11) unique not null,
	foreign key (id_professor) references professor(id_professor),
	foreign key (id_curso) references curso(id_curso),
	foreign key (id_uc) references uc(id_uc),
	foreign key (cpf) references aluno(cpf)
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




-- Dados de cada tabela

insert into endereco(
	id_endereco, cep, rua_avenida, numero, complemento, bairro, cidade, estado
)
values
(001, 59056-173, 'Rua Lagoa das Canejas', 20, 'c1', 'Lagoa Nova', 'Natal', 'RN'),
(002, 59068-820, 'Rua Niquelândia', 04, 'b1', 'Pitimbu', 'Natal', 'RN'), 
(003, 59063-070, 'Rua São José de Mipibu', 70, 'c2', 'Lagoa Nova', 'Natal', 'RN'),
(004, 59070-410, 'Rua Igarassu', 93, 'c1', 'Cidade da Esperança', 'Natal', 'RN'),
(005, 59110-210, 'Rua Magé', 832, 'c5', 'Potengi', 'Natal', 'RN'),
(006, 59131-040, 'Rua Ubaira', 24, 'c3', 'Pajuçara', 'Natal', 'RN');


