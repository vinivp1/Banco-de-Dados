-- Aula 25/11

CREATE TABLE LogAuditoria (
	IDLog int identity primary key,
	Tabela VARCHAR(4000),
	DadosAntigos VARCHAR(4000),
	DadosNovos VARCHAR(4000),
	Obseracoes VARCHAR(1000),
	DataRegistro datetime
)

-- INSERT

CREATE OR ALTER TRIGGER tgrLogInsertVeiculo
ON Veiculo
AFTER INSERT
AS
BEGIN
	INSERT INTO LogAuditoria
	SELECT
		'Tab. Veiculo' Tabela,
		null DadosAntigos,
		'Nome: ' + Proprietario + ' - Placa: ' + Placa + ' - Cor: ' + coalesce(Cor,'---'), 
		'Validando INSERTED...' Observacoes,
		GETDATE() DataRegistro
	FROM inserted
END

SELECT * FROM Veiculo order by IDVeiculo desc
insert into Veiculo values ('Vinicius', 'GAS8R34', GETDATE(), 1, 85000, 2025, 'Preto')
SELECT * FROM LogAuditoria

-- DELETE

CREATE OR ALTER TRIGGER tgrLogDeleteVeiculo
ON Veiculo
AFTER DELETE
AS
BEGIN
	INSERT INTO LogAuditoria
	SELECT
		'Tab. Veiculo' Tabela,
		'Nome: ' + Proprietario + ' - Placa: ' + Placa + ' - Cor: ' + coalesce(Cor,'---'), -- pode usar isnull() no lugar do coalesce, funciona igual
		null DadosNovos,
		'Validando DELETED...' Observacoes,
		GETDATE() DataRegistro
	FROM deleted
END

SELECT * FROM Veiculo order by IDVeiculo desc
DELETE FROM Veiculo where IDVeiculo in (1004, 1003, 1002) 
SELECT * FROM LogAuditoria

-- UPDATE

CREATE OR ALTER TRIGGER tgrLogUpdateVeiculo
ON Veiculo
AFTER UPDATE
AS
BEGIN
	INSERT INTO LogAuditoria
	SELECT
		'Tab. Veiculo' Tabela,
		'Antigo Dono: ' + d.Proprietario, 
		'Novo Dono: ' + i.Proprietario, 
		'Insert + Deleted ...' Observacoes,
		GETDATE() DataRegistro
	FROM inserted i
	INNER JOIN deleted d
		ON i.IDVeiculo = d.IDVeiculo
END

SELECT * FROM Veiculo order by IDVeiculo desc
UPDATE Veiculo set Proprietario = 'Carlos' where IDVeiculo = 2
SELECT * FROM LogAuditoria