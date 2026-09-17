CREATE DATABASE BD2026S2_OK

USE BD2026S2_OK

CREATE TABLE Modelo
(
	IDModelo int not null PRIMARY KEY identity,
	Nome varchar(200) not null,
	Descricao varchar(500),
	NumeroLugares int,
	Tipo varchar(100)
)

CREATE TABLE Veiculo
(
	IDVeiculo int not null PRIMARY KEY identity,
	Proprietario varchar(200) not null,
	Placa varchar(50) not null,
	DataCompra datetime,
	IDModelo int not null REFERENCES Modelo(IDModelo),
	Valor numeric(18,2) not null,
	AnoFabricacao int,
	Cor varchar(50)
)

SET DATEFORMAT DMY

INSERT INTO Modelo (Nome, NumeroLugares, Tipo) VALUES
    ('HB20s', 5, 'Sedan'),
    ('HB20', 5, 'Hatch'),
    ('Porsche Spyder', 2, 'Outros'),
    ('Fiesta',  null, 'Hatch') ,
    ('Onix', null, 'Hatch'),
    ('TCross', null, 'SUV'),
    ('Tiguan', 7, 'SUV')

INSERT INTO Modelo VALUES
    ('C3', null, null, 'Hatch'),
    ('Gol', 'Geracao 3', 5, null)

INSERT INTO Veiculo (Proprietario, Placa, DataCompra, IDModelo, Valor, AnoFabricacao) VALUES
    ('Anna Clara', 'ABC1234', '28-10-2013', 1, 50000, 2013),
    ('Enzo Gabriel', 'DEF1234', '27-07-2012', 1, 20000, 2012),
    ('Geovana', 'GHI5678', '31-07-2013', 2, 40000,  2013),
    ('Manuela', 'ABC9090', '11-12-2013', 3, 10000, 2012)

INSERT INTO Veiculo (Proprietario, Placa, IDModelo, Valor, AnoFabricacao) VALUES
    ('Bernardo', 'BER2301', 4, 50000, 2020)

INSERT INTO Veiculo VALUES
    ('Lucas', 'LUC9988', '14-05-2020', 2, 25000, 2020, 'Branca'),
    ('Murilo', 'MUU5334', '20-02-2021', 3, 35000, 2021, 'Azul'),
    ('Marcelo', 'MAH2376', '05-04-2022', 2, 50000, 2022, 'Cinza')

CREATE TABLE Fabricante
(
	IDFabricante int not null identity,
	Nome varchar(200) not null,
	Descricao varchar(500),
	Cidade varchar(150) not null,
	Estado varchar(10) not null,
	CONSTRAINT PKIDFabricante PRIMARY KEY (IDFabricante)
)

INSERT INTO Fabricante (Nome, Cidade, Estado) VALUES
   ('Hyundai', 'Piracicaba', 'SP'), --1	Creta, IX35
   ('Kia', 'Belo Horizonte', 'MG'), --2	Sportage
   ('Caoa Chery', 'An�polis', 'GO'), --3	Tiggo, Arrizo
   ('Chevrolet', 'S�o Caetano', 'SP'), --4	Cruze, Tracker, Spin
   ('Ford', 'S�o Paulo', 'SP'), --5	Ranger
   ('Fiat', 'S�o Paulo', 'SP'), --6	Palio
   ('Citroen', 'Niter�i', 'RJ'),
   ('Toyota', 'Itu', 'SP'),
   ('Jeep', 'Uberl�ndia', 'MG')

ALTER TABLE Modelo ADD IDFabricante INT

ALTER TABLE Modelo ADD CONSTRAINT FKModeloFabricante FOREIGN KEY (IDFabricante) REFERENCES Fabricante(IDFabricante)

INSERT INTO Modelo (Nome, Tipo, IDFabricante) VALUES
    ('Creta', 'SUV', 1), --10
    ('IX35', 'SUV', 1), --11
    ('Sportage', 'SUV', 2), --12
    ('Tiggo', 'Outros', 3), --13
    ('Arrizo', 'Hatch', 3), --14
    ('Cruze', 'Hatch', 4), --15
    ('Tracker', 'SUV', 4), --16
    ('Spin', 'Sedan', 4), --17
    ('Ranger', 'Outros', 5), --18
    ('Palio', 'Hatch', 6) --19

INSERT INTO Veiculo (Proprietario, Placa, DataCompra, IDModelo, valor, AnoFabricacao, Cor) VALUES
    ('Bella', 'AAA111', GETDATE(), 10, 25000, 2020, 'Preto'),
    ('Larissa', 'BBB222', GETDATE(), 11, 30000, 2020, 'Branco'),
    ('Zoe', 'CCC3333', GETDATE(), 12, 35000, 2020, 'Branco'),
    ('Gabriela', 'DDD4444', GETDATE(), 13, 40000, 2020, 'Prata'),
    ('Benjamin', 'EEE5555', GETDATE(), 14, 45000, 2020, 'Prata'),
    ('Bento', 'FFF6666', GETDATE(), 15, 50000, 2020, 'Branco'),
    ('Davi', 'GGG7777', GETDATE(), 16, 55000, 2020, 'Preto')

-- Questão 1
SELECT
	m.Nome,
    m.Tipo,
    f.Nome as [Nome Fabricante]
FROM Modelo m
INNER JOIN Fabricante f
    ON m.IDFabricante = f.IDFabricante

-- Questão 2
SELECT
	v.Proprietario,
    v.Placa,
    m.Nome as [Nome Modelo]
FROM Veiculo v
INNER JOIN Modelo m
    ON v.IDModelo = m.IDModelo

-- Questão 3
SELECT
    f.Nome as [Nome Fabricante],
    count(*) as [Quantidade Modelos]
FROM Fabricante f 
INNER JOIN Modelo m
    ON m.IDFabricante = f.IDFabricante
group by f.Nome

-- Questão 4
SELECT
    v.Proprietario as [Nome Proprietário],
    m.Nome as [Nome Modelo],
    f.Nome as [Nome Fabricante]
FROM Veiculo v
INNER JOIN Modelo m
    ON v.IDModelo = m.IDModelo
INNER JOIN Fabricante f 
    ON m.IDFabricante = f.IDFabricante

-- Questão 5
SELECT
    m.Nome as [Nome Modelo],
    m.Tipo as [Tipo Modelo],
    f.Nome as [Nome Fabricante]
FROM Modelo m
LEFT JOIN Fabricante f 
    ON m.IDFabricante = f.IDFabricante

-- Questão 6
SELECT
    f.Nome as [Nome Fabricante],
    count(m.IDFabricante) as [Quantidade de Modelos]
FROM Fabricante f 
LEFT JOIN Modelo m 
    ON f.IDFabricante = m.IDFabricante 
group by f.Nome

-- Questão 7
SELECT
	v.Proprietario,
    m.Tipo,
    m.Nome as [Nome Modelo],
    f.Nome as [Nome Fabricante]
FROM Veiculo v
RIGHT JOIN Modelo m
    ON v.IDModelo = m.IDModelo
LEFT JOIN Fabricante f
    ON m.IDFabricante = f.IDFabricante

-- Questão 8
SELECT
    m.Nome as [Nome Modelo],
    count(v.IDModelo) as [Quantidade Modelos]
FROM Modelo m
RIGHT JOIN Veiculo v 
    ON m.IDModelo = v.IDModelo 
group by m.Nome

-- Questão 9
SELECT
	m.Nome,
    m.Tipo,
    f.Nome as [Nome Fabricante],
    f.Cidade as [Cidade Fabricante]
FROM Modelo m
FULL JOIN Fabricante f
    ON m.IDFabricante = f.IDFabricante

-- Questão 10
SELECT
	*
FROM Veiculo v
CROSS JOIN Modelo m