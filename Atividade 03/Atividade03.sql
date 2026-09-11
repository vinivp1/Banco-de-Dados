-- Passo 1
SELECT 
	* 
FROM Modelo

-- Passo 2
SELECT 
	* 
FROM Veiculo

-- Passo 3
SELECT 
	Nome,
	Tipo,
	NumeroLugares
FROM Modelo
order by Nome asc

-- Passo 4
SELECT 
	Proprietario,
	Placa,
	DataCompra,
	Valor
FROM Veiculo
order by DataCompra desc

-- Passo 5
SELECT 
	*
FROM Modelo
where IDmodelo between 3 and 10

-- Passo 6
SELECT 
	*
FROM Veiculo
where IDVeiculo IN (1,3,5,7)

-- Passo 7
SELECT 
	*
FROM Veiculo
where year(DataCompra) = 2022 and MONTH(DataCompra) = 08

-- Passo 8
SELECT 
	Proprietario,
	Placa,
	Valor
FROM Veiculo
where Valor >= 30000

-- Passo 9
SELECT 
	Proprietario,
	AnoFabricacao
FROM Veiculo
where Cores is null

-- SELECT + LIKE
-- Passo 1
SELECT 
	*
FROM Veiculo
where Proprietario = 'Ana' 

-- Passo 2
SELECT 
	*
FROM Veiculo
where Proprietario like 'Ana%'

-- Passo 3
SELECT 
	*
FROM Veiculo
where Proprietario = '%Ana'

-- Passo 4
SELECT 
	*
FROM Veiculo
where Proprietario = '%Ana%'

-- Passo 5
SELECT 
	*
FROM Modelo
where Nome like '_3'

-- Passo 6
SELECT 
	*
FROM Veiculo
where Proprietario like '[AM]'

-- Passo 7
SELECT 
	*
FROM Veiculo
where Proprietario not like '[AM]'

-- Passo 8
SELECT 
	*
FROM Veiculo
where Proprietario like '[A-F%]'

-- Passo 9
SELECT 
	*
FROM Veiculo
where Proprietario not like '[A-F%]'