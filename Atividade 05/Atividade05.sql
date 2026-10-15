-- Questao 1
CREATE or ALTER PROCEDURE spMinhaPrimeiraProc
as
BEGIN
	SELECT 'Olá Mundo'
END

EXEC spMinhaPrimeiraProc

-- Questao 2
CREATE or ALTER PROCEDURE spAtualizaCor
(
	@id int,
	@NovaCor varchar(50)
)
as
BEGIN
	update Veiculo set Cor = @NovaCor
	where IDVeiculo = @id
END

EXEC spAtualizaCor @NovaCor = Azul, @id = 2

select * from Veiculo

-- Questao 3
CREATE or ALTER PROCEDURE spCalcularMedia
(
	@Nota1 decimal(18,2),
	@Nota2 decimal(18,2)
)
as
BEGIN
	declare @media decimal(18,2)
	set @media = @Nota1 * 0.4 + @Nota2 * 0.6
	select @media [Média]
END

EXEC spCalcularMedia @Nota1 = 8, @Nota2 = 10

-- Questao 4
select * from Modelo
CREATE or ALTER PROCEDURE spAddModelo
(
	@Nome varchar(80), 
	@Descricao varchar(500), 
	@NumeroLugares int, 
	@Tipo varchar(50), 
	@IDFabricante int 
)
as
BEGIN
	insert into Modelo (Nome, Descricao, NumeroLugares, Tipo, IDFabricante) VALUES
	(@Nome, @Descricao, @NumeroLugares, @Tipo, @IDFabricante)
END

EXEC spAddModelo Palio, Null, 5, Hatch, Null

-- Questao 5
CREATE or ALTER PROCEDURE spAreaTrianguloRetangulo
(
	@base int, 
	@altura int, 
	@result int OUTPUT  
)
as
BEGIN
	set @result = @base * @altura
	select @result [Area]
END

declare @res int
EXEC spAreaTrianguloRetangulo 3, 5, @res OUTPUT
print @res
