create procedure spListarFuncionarios
as
begin
	select * from FUNCIONARIO;
end;

exec spListarFuncionarios;


-- Crie uma procedure que retorna todos os livros de tecnologia

create procedure spLivrosTecnologia
as
begin
	select * from livro
	join TECNOLOGIA on tecnologia.numero_registro = livro.numero_registro;
end;

exec spLivrosTecnologia;

/*
Cria um procedimento para buscar um livro pelo nome
*/

create procedure sp_buscar_livro
	@titulo nvarchar(100)
as
begin
	select * from livro where titulo like @titulo
end;

exec sp_buscar_livro_concatenado @titulo = 'desenvolvimento';

create procedure sp_buscar_livro_concatenado
	@titulo nvarchar(100)
as
begin
	select * from livro where titulo like '%'+@titulo+'%'
end;



/*
Crie uma procedure que retonar todos os livros de ano(2016)
*/

create procedure sp_retornar_livro__ano
	@ano_publicacao nvarchar(30)
as
begin
	select * from livro
	where ano_publicacao like @ano_publicacao
end;

exec sp_retornar_livro__ano @ano_publicacao = '2016';


/*
Crie uma procedure que filtra os livros de tecnologia por ano
*/

create procedure sp_livro_tecnologia_ano
	@tecnologia_ano nvarchar(30)
as
begin
	select * from livro
	join tecnologia on tecnologia.numero_registro = livro.numero_registro
	where ano_publicacao = @tecnologia_ano
end;

exec sp_livro_tecnologia_ano @tecnologia_ano = '2016';

/*
Criar procedure para inserir registro de funcionario
*/

create procedure sp_inserir_funcionario
	@matricula nvarchar(6),
	@nome nvarchar(50)
as
begin
	insert into funcionario(matricula, nome) values (@matricula,@nome)
end;

exec sp_inserir_funcionario @matricula = 'TI0202', @nome = 'Manoel Gomes';


/*
Criar procedure para inserir registro de funcionario do tipo educador
*/

create procedure sp_inserir_funcionario_educador
	@matricula nvarchar(6),
	@nome nvarchar(50)
as
begin
	insert into funcionario(matricula, nome) values (@matricula,@nome)

	insert into educador(matricula, nome) values (@matricula,@nome)
end;


exec sp_inserir_funcionario_educador @matricula = 'ED0203', @nome = 'Joao Gomes';

/*
Criar uma procedure para listar os livros de uma categoria específica, recebendo o
nome da categoria como parâmetro.
*/

create procedure sp_buscar_livro_sociologia
as
begin
	select * from livro
	join sociologia on sociologia.numero_registro = livro.numero_registro
end;

exec sp_buscar_livro_sociologia;



/*
Criar uma procedure para obter os nomes dos funcionários de um determinado
cargo, recebendo o cargo como parâmetro.
*/


create procedure sp_cargo_funcionario
as
begin
	select funcionario.nome from funcionario 
	join atendente on atendente.matricula = funcionario.matricula
end;

exec sp_cargo_funcionario;

/*
Criar uma procedure para exibir os títulos dos livros publicados antes de um ano
específico, recebendo o ano como parâmetro.
*/

create procedure sp_exibir_livros_ano
as
begin
	select * from livro
	where ano_publicacao < '2022'
end;

exec sp_exibir_livros_ano;


/*
Criar uma procedure para contar o número total de livros em uma biblioteca
específica, recebendo o CNPJ da biblioteca como parâmetro.
*/

create procedure sp_total_livros_biblioteca
	
as
begin
	select count(*) as total_livros
	from livro_biblioteca
	where cnpj = 56789012000167
end;

exec sp_total_livros_biblioteca;


/*
Criar uma procedure para listar os eventos de um tipo específico que aconteceram
após um ano determinado, recebendo o tipo de evento e o ano como parâmetros.
*/

create procedure 