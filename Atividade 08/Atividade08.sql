--

CREATE TRIGGER tgr_nome_do_trigger
ON nome_da_tabela
AFTER INSERT
AS
BEGIN
-- Lógica do Trigger
END

ENABLE TRIGGER tgr_nome_do_trigger -- ou DISABLE
ON Tabela

CREATE TABLE LogInfo 
(
	ID int primary key identity,
	Tabela VARCHAR(1000),
	Informacoes VARCHAR(5000),
	Datalog DATETIME
)

CREATE OR ALTER TRIGGER tgrValidarFabricante
ON Fabricante
AFTER INSERT
AS
BEGIN
	DECLARE @hoje INT
	SET @hoje = day(getdate())
	IF @hoje >= 20
	BEGIN
		RAISERROR('Cadastro bloqueado',10,1)
		ROLLBACK
	END
	begin
		insert into LogInfo values ('Tab. Fabricante', 'Cadastro OK', GETDATE())
	end
END

INSERT INTO Fabricante VALUES ('Novo Fabricante', null, 'Piracicaba', 'SP')
SELECT * FROM Fabricante
SELECT * FROM LogInfo

--insert
create or alter trigger tgrInsertVeiculo
ON Veiculo
after insert
as
begin 
	insert into LogInfo values('Tab Veiculo', 'Inserindo Veiculo', getdate())
end

insert into Veiculo values ('Amanda', 'AMO9I87', getdate(), 1, 300000, 2020, 'Branco')
select * from Veiculo
select * from LogInfo 

-- update
CREATE OR ALTER TRIGGER tgrUpdateVeiculo 
ON Veiculo
AFTER UPDATE
AS
BEGIN
	INSERT INTO LogInfo VALUES('Tab. Veiculo', 'Atualizando...', getdate())
END

UPDATE Veiculo set Cor = 'Preta' where IDVeiculo = 1
select * from Veiculo
select * from LogInfo 

-- delete
CREATE OR ALTER TRIGGER tgrDeleteVeiculo 
ON Veiculo
AFTER DELETE
AS
BEGIN
	INSERT INTO LogInfo VALUES('Tab. Veiculo', 'Apagando Veiculo', getdate())
END

DELETE Veiculo where IDVeiculo = 1
select * from Veiculo
select * from LogInfo 

-- insert + update + delete
CREATE OR ALTER TRIGGER tgrFullVeiculo 
ON Veiculo
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	INSERT INTO LogInfo VALUES('Tab. Veiculo', 'Todos DMLs', getdate())
END

UPDATE Veiculo set Cor = 'Preta' where IDVeiculo = 1
select * from Veiculo
select * from LogInfo 

DISABLE TRIGGER tgrUpdateVeiculo ON Veiculo		