-- Função Escalar Calculo IPVA 4%
CREATE OR ALTER FUNCTION fnIPVA(@valor decimal(18,2))
RETURNS DECIMAL(18,2)
AS
BEGIN 
	DECLARE @IPVA DECIMAL(18,2)
	SET @IPVA = @valor * 0.04
	RETURN @IPVA
END

SELECT DBO.fnIPVA(100000)

SELECT 
	Proprietario, 
	Valor, 
	DBO.fnIPVA(Valor) IPVA 
FROM Veiculo

-- Função Escalar Calculo Comissao
CREATE OR ALTER FUNCTION fnComissao(@valorCarro DECIMAL(18,2), @data DATE)
RETURNS DECIMAL(18,2)
AS
BEGIN 
    DECLARE @taxa DECIMAL(4,2)
    
    SET @taxa = CASE 
        WHEN YEAR(GETDATE()) - YEAR(@data) > 10 THEN 0.10
        ELSE 0.05
    END
    RETURN @valorCarro * @taxa
END

SELECT DBO.fnComissao(100000,'2013-10-10')
SELECT DBO.fnComissao(100000,'2023-06-17')

-- Inline Table


-- Multi-Statement Table-Valued
CREATE OR ALTER FUNCTION fnVeiculoPorModelo(@idModelo int)
RETURNS @VeiculoModelo TABLE (
    Proprietario varchar(200),
    Placa varchar(50),
    NomeModelo varchar(200),
    NomeFabricante varchar(200)
)
AS 
BEGIN 
    INSERT INTO @VeiculoModelo
    SELECT
        a.Proprietario,
        a.Placa,
        b.Nome,
        c.Nome
    FROM Veiculo a 
    INNER JOIN Modelo b 
        ON a.IDModelo = b.IDmodelo
    LEFT JOIN Fabricante c
        ON b.IDFabricante = c.IDFabricante
    WHERE b.IDmodelo = @idModelo
       OR @idModelo IS NULL
       
    RETURN
END

select * from dbo.fnVeiculoPorModelo(1)

-- Multi-Statement Table-Valued
CREATE OR ALTER FUNCTION fnVeiculo(@idVeiculo int)
RETURNS @VeiculoModelo TABLE (
    IDVeiculo int,
    Proprietario varchar(200),
    IPVA decimal(18,2)
)
AS 
BEGIN 
    INSERT INTO @VeiculoModelo
    SELECT
        a.IDVeiculo,
        a.Proprietario,
        DBO.fnIPVA(a.Valor)
    FROM Veiculo a 
    WHERE a.IDVeiculo = @idVeiculo
       OR @idVeiculo IS NULL    
    RETURN
END
