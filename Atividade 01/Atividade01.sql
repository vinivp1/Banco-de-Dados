CREATE DATABASE BD2026S2_IN1

use BD2026S2_IN1

--1. Criando a tabela Modelo
CREATE TABLE Modelo(
	IDmodelo int identity,
	Nome varchar(200) not null,
	Descricao varchar(500)
)

--2. Criando a tabela Veículo
CREATE TABLE Veiculo (
	IDVeiculo int identity,
	Proprietario varchar(200) not null,
	Placa varchar(50) not null,
	DataCompra datetime,
	IDModelo int not null,
	Valor decimal(18,2) not null
)

ALTER TABLE Modelo ADD CONSTRAINT PKIDModelo PRIMARY KEY (IDModelo)

ALTER TABLE Veiculo ADD CONSTRAINT PKIDVeiculo PRIMARY KEY (IDVeiculo)
ALTER TABLE Veiculo ADD CONSTRAINT FKVeiculoModelo FOREIGN KEY (IDModelo) REFERENCES Modelo(IDModelo)

CREATE TABLE ExemploChaveComposta(
	IDChave1 int not null,
	IDChave2 int not null,
	Nome varchar(200) not null,
	CONSTRAINT PKChaveComposta Primary key (IDChave1, IDChave2)
)

-- Realizando Alterações
ALTER TABLE Modelo ADD NumeroLugares int
ALTER TABLE Modelo ADD Tipo varchar(100)

ALTER TABLE Veiculo ADD VouApagar decimal(18,2)
ALTER TABLE Veiculo ADD AnoFabricacao int
ALTER TABLE Veiculo ADD Cores varchar(10)

ALTER TABLE Veiculo ALTER COLUMN AnoFabricacao int not null
ALTER TABLE Veiculo ALTER COLUMN Cores varchar(50)

ALTER TABLE Veiculo DROP COLUMN VouApagar
