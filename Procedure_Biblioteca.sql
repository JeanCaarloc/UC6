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
1. Criar uma procedure para inserir um registro de funcionário do tipo educador, 
recebendo nome e matrícula como parâmetros
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
02 Criar uma procedure para listar os livros de uma categoria específica, recebendo o
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
03 Criar uma procedure para obter os nomes dos funcionários de um determinado
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
04 Criar uma procedure para exibir os títulos dos livros publicados antes de um ano
específico, recebendo o ano como parâmetro.
*/

create procedure sp_exibir_livros_ano
	@ano nvarchar(30)
as
begin
	select titulo from livro
	where ano_publicacao < @ano;
end;

exec sp_exibir_livros_ano @ano = '2000'


/*
05 Criar uma procedure para contar o número total de livros em uma biblioteca
específica, recebendo o CNPJ da biblioteca como parâmetro.
*/

create procedure sp_numero_total_livros
	@cnpj nvarchar(14)
as
begin
	select count(livro_biblioteca.numero_registro) as total_livros
	from LIVRO
	join livro_biblioteca on livro.numero_registro = livro_biblioteca.numero_registro
	where cnpj = @cnpj
end;

exec sp_numero_total_livros @cnpj = '23456789000134';


/*
06 Criar uma procedure para listar os eventos de um tipo específico que aconteceram
após um ano determinado, recebendo o tipo de evento e o ano como parâmetros.
*/

create procedure sp_lista_eventos
	@tipo nvarchar (30),
	@ano nvarchar (5)
as
begin
	select *
	from evento
	where tipo = @tipo and year(data) < 2021;
end;

exec sp_lista_eventos @tipo = 'workshop', @ano = 2017


/*
07 Criar uma procedure para mostrar os nomes dos usuários que fizeram empréstimos
de livros em um mês e ano específicos, recebendo o mês e o ano como parâmetros.
*/

create procedure sp_emprestimo
	@mes int,
	@ano int
as
begin
	select usuario.nome from usuario
	join emprestimo on usuario.matricula = emprestimo.matricula
	where year(data_emprestimo) = @ano and month (data_emprestimo) = @mes
end;

exec sp_emprestimo @mes = 4 , @ano 2024;
/*
8. Criar uma procedure para encontrar os títulos dos livros de uma categoria específica
que contenham uma palavra-chave no título, recebendo a categoria e a palavrachave como parâmetros.
*/
create procedure sp_livros_titulo_sociologia
	@sociologia nvarchar(100)
as
begin
	select * from livro
	join sociologia on sociologia.numero_registro = livro.numero_registro
	where titulo like '%'+@sociologia+'%' ;
end;

exec sp_livros_titulo_sociologia @sociologia = 'casa';

/*
9. Criar uma procedure para listar os títulos dos periódicos disponíveis em uma
biblioteca específica, recebendo o CNPJ da biblioteca como parâmetro.
*/

create procedure sp_lista_titulos_periodicos
as
begin
	select titulo from periodico
	join periodico_biblioteca on periodico_biblioteca.numero_registro = periodico.numero_registro
	where cnpj = '45678901000156';
end;

exec sp_lista_titulos_periodicos;

/*
10.Criar uma procedure para exibir o título e o autor dos livros emprestados por um
usuário específico, recebendo o ID do usuário como parâmetro
*/


/*
11.Criar uma procedure para inserir um registro de funcionário do tipo educador,
recebendo nome e matrícula como parâmetros
*/

create procedure sp_inserir_funcionario_educador_
	@matricula nvarchar(6),
	@nome nvarchar(50)
as
begin
	insert into funcionario(matricula, nome) values (@matricula, @nome)
	insert into educador(matricula, nome) values (@matricula, @nome)
end;

exec sp_inserir_funcionario_educador_ @matricula = 'ED0305' , @nome = 'Pedro Gomes';

/*
12.Criar uma procedure para listar os livros de uma categoria específica, recebendo o
nome da categoria como parâmetro
*/

create procedure sp_livros_ciencia_listados
as
begin
	select * from livro
	join ciencia on ciencia.numero_registro = livro.numero_registro
end;

exec sp_livros_ciencia_listados;

/*
13.Criar uma procedure para obter os nomes dos funcionários de um determinado
cargo, recebendo o cargo como parâmetro.
*/

create procedure sp_nomes_funcionarios_atendentes
as
begin
	select * from funcionario
	join atendente on funcionario.matricula = atendente.matricula
end;

exec sp_nomes_funcionarios_atendentes;

/*
14.Criar uma procedure para exibir os títulos dos livros publicados antes de um ano
específico, recebendo o ano como parâmetro.
*/

create procedure sp_titulos_livros_antes_2021
as
begin
	select titulo, ano_publicacao from livro
	where ano_publicacao < 2021;
end;

exec sp_titulos_livros_antes_2021


/*
15.Criar uma procedure para contar o número total de livros em uma biblioteca
específica, recebendo o CNPJ da biblioteca como parâmetro.
*/

create procedure sp_contar_total_livros_biblioteca
as
begin
	select count(*) as total_livros
	from livro_biblioteca 
	where cnpj = '45678901000156';
end;

exec sp_contar_total_livros_biblioteca;

/*
16.Criar uma procedure para listar os eventos de um tipo específico que aconteceram
após um ano determinado, recebendo o tipo de evento e o ano como parâmetros.
*/

create procedure sp_lista_evento_workshop_ano
as
begin
	select * from evento
	where tipo = 'workshop' and year(data) = 2020;
end;

exec sp_lista_evento_workshop_ano;

/*
17.Criar uma procedure para mostrar os nomes dos usuários que fizeram empréstimos
de livros em um mês e ano específicos, recebendo o mês e o ano como parâmetros.
*/



/*
18.Criar uma procedure para encontrar os títulos dos livros de uma categoria específica
que contenham uma palavra-chave no título, recebendo a categoria e a palavrachave como parâmetros.
*/

create procedure sp_livro_ciencia
as
begin
	select titulo from livro
	join ciencia on ciencia.numero_registro = livro.numero_registro
	where titulo like '%Natureza%' ;
end;

exec sp_livro_ciencia;



/*
19.Criar uma procedure para listar os títulos dos periódicos disponíveis em uma
biblioteca específica, recebendo o CNPJ da biblioteca como parâmetro.
*/

create procedure sp_lista_periodicos_biblioteca
as
begin
	select titulo from periodico
	join periodico_biblioteca on periodico_biblioteca.numero_registro = periodico.numero_registro
	where cnpj = 89012345000190;
end;

exec sp_lista_periodicos_biblioteca;

	
	

/*
20.Criar uma procedure para exibir o título e o autor dos livros emprestados por um
usuário específico, recebendo o ID do usuário como parâmetro.
*/

