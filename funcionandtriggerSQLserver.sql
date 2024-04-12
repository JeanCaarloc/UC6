/*
Função para contar o numero total livros em uma biblioteca
*/


create function fn_contar_livros(@cnpj nvarchar(14))
returns int 
as
begin
	declare @total_livros int; 
	select @total_livros = count(*) from livro_biblioteca
	where cnpj = @cnpj;
	return @total_livros
end;

select dbo.fn_contar_livros('23456789000134') as total_livros;

select * from LIVRO_BIBLIOTECA; 




/* Criar uma funcao que retorne o numero total dos funcionarios
*/

create function fn_contar_funcionarios()
returns int
as
begin
	declare @total_funcionarios int;
	select @total_funcionarios = count(funcionario.matricula) from funcionario
	return @total_funcionarios
end;


select dbo.fn_contar_funcionarios() as total_funcionarios;

/*
Crie uma função que calcula a quantidade de eventos do tipo palestra
*/

create function fn_total_eventos(@tipo nvarchar(30))
returns int
as
begin
	declare @total_eventos_palestra int;
	select @total_eventos_palestra = count(*) from evento
	where tipo = @tipo
	return @total_eventos_palestra
end;


select dbo.fn_total_eventos('workshop') as total_eventos_palestra;