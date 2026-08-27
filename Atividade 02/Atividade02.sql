INSERT INTO Modelo(Nome, Tipo)
values ('HB20S', 'Sedan')

INSERT INTO Modelo(Nome, Descricao, NumeroLugares, Tipo)
values ('C3', 'Legal...', 5, 'Hatch')

select * from Modelo

set dateformat dmy

insert into Veiculo(Proprietario, Placa, DataCompra, IDModelo, Valor, AnoFabricacao, Cores)
values('Vinicius', 'ABC1X34', '26-08-2026', 2, 30000, 2012, 'Branco')

insert into Veiculo(Proprietario, Placa, DataCompra, IDModelo, Valor, AnoFabricacao, Cores)
values('Guilherme', 'ADF1X67', '28-11-2025', 1, 50000, 2014, 'Preto')

insert into Veiculo(Proprietario, Placa, DataCompra, IDModelo, Valor, AnoFabricacao, Cores)
values('Jhonatan', 'ADF1X69', '30-12-2023', 1, 20000, 2001, 'Preto')

select * from Veiculo

select * from Modelo

UPDATE Modelo set Descricao = 'Carrro Familia', NumeroLugares = 5
where Nome = 'HB20S'

DELETE FROM Veiculo 
where AnoFabricacao = 2001