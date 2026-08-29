CREATE DATABASE AC1

use AC1

-- Questao 1
CREATE TABLE Habilidade (
	IDHabilidade int identity not null,
	Nome varchar(200) not null,
	MultiplicadorPoder int
)

ALTER TABLE Habilidade ADD CONSTRAINT PKIDHabilidade PRIMARY KEY (IDHabilidade)

CREATE TABLE Classe (
	IDClasse int identity not null,
	Nome varchar(100) not null,
	Caracteristicas varchar(1000),
	IDHabilidade int
)

ALTER TABLE Classe ADD CONSTRAINT PKIDClasse PRIMARY KEY (IDClasse)
ALTER TABLE Classe ADD CONSTRAINT FKIDHabilidade FOREIGN KEY (IDHabilidade) REFERENCES Habilidade(IDHabilidade)

CREATE TABLE Raca (
	IDRaca int identity not null,
	Nome varchar(100) not null,
	Descricao varchar(500),
	Origem varchar(150) not null,
	Perdido datetime
)

ALTER TABLE Raca ADD CONSTRAINT PKIDRaca PRIMARY KEY (IDRaca)

CREATE TABLE Personagem (
	IDPersonagem int identity not null,
	Nome varchar(100) not null,
	Descricao varchar(500),
	DataNascimento datetime not null,
	IDRaca int not null,
	IDClasse int not null
)

ALTER TABLE Personagem ADD CONSTRAINT PKIDPersonagem PRIMARY KEY (IDPersonagem)
ALTER TABLE Personagem ADD CONSTRAINT FKIDRaca FOREIGN KEY (IDRaca) REFERENCES Raca(IDRaca)
ALTER TABLE Personagem ADD CONSTRAINT FKIDClasse FOREIGN KEY (IDClasse) REFERENCES Classe(IDClasse)


-- Questao 2
ALTER TABLE Personagem ADD Poder int not null

-- Questao 3
ALTER TABLE Classe ALTER COLUMN Caracteristicas varchar(1500)

-- Questao 4
ALTER TABLE Raca DROP COLUMN Perdido

-- Questao 5
INSERT INTO Habilidade (Nome, MultiplicadorPoder) 
VALUES 
('Magia Arcana', 3),
('Fúria de Batalha', 2),
('Furtividade Suprema', 2),
('Golpe Fantasma', 1)

INSERT INTO Classe (Nome, Caracteristicas, IDHabilidade) 
VALUES 
('Mago', 'Especialista em magias arcanas de longo alcance, capaz de conjurar feitiços destrutivos e utilitários.', 1),
('Bárbaro', 'Guerreiro brutal com alto dano corpo a corpo, usa sua fúria para aumentar a força em combate.', 2),
('Guerreiro', null, 3)

INSERT INTO Raca (Nome, Descricao, Origem) 
VALUES 
('Elfo', 'Seres longevos e ágeis, com profunda conexão com a natureza e aptidão mágica inata.', 'Florestas de Prata'),
('Orc', 'Criaturas robustas de grande força física, conhecidas por sua bravura implacável em batalha.', 'Terras Antigas'),
('Humano', 'Uma raça extremamente versátil, com alta capacidade de adaptação aos mais diversos ambientes.', 'Reinos Centrais')

INSERT INTO Personagem (Nome, Descricao, DataNascimento, IDRaca, IDClasse, Poder) 
VALUES 
('Aelar', 'Um elfo sábio focado em utilizar o poder dos elementos para proteger seu povo.', '1850-05-15', 1, 1, 1500),
('Grommash', 'Um orc corpulento e temido em toda a região pela sua brutalidade ao empunhar machados.', '1995-10-22', 2, 2, 1100),
('Lyra', 'Uma ladina astuta e sarcástica, procurada pelo império por roubar relíquias sagradas.', '2001-02-10', 3, 3, 900),
('Arthur', 'Um cavaleiro honrado em busca de justiça e glória.', '1990-08-12', 3, 3, 1200)

-- Questao 6
UPDATE Classe set Caracteristicas = 'Descrição não informada'
where Caracteristicas is null

-- Questao 7
UPDATE Personagem set Poder = Poder + 10
where IDClasse = 3

-- Questao 8
UPDATE Raca set Descricao = 'Raça revisada pela guilda dos historiadores.',
	   Origem = 'Terras Antigas do Norte'
where Origem = 'Terras Antigas'

-- Questao 9
DELETE FROM Personagem 
where Year(DataNascimento) BETWEEN 1970 and 1990

-- Questao 10
DELETE FROM Habilidade 
where MultiplicadorPoder < 2