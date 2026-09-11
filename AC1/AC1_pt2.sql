-- Questão 1:
SELECT
	*
FROM Classe

-- Questão 2:
SELECT
	Nome,
	DataNascimento,
	Poder
FROM Personagem
WHERE Poder BETWEEN 0 and 75

-- Questão 3:
SELECT
	Nome,
	Descricao,
	Origem
FROM Raca
WHERE Nome like '%Orc%'

-- Questão 4:
SELECT
	Nome,
	Poder
FROM Personagem
ORDER BY Poder DESC

-- Questão 5:
SELECT
	*
FROM Personagem
WHERE Year(DataNascimento) >= 2000
  and Poder BETWEEN 50 and 100

-- Questão 6:
SELECT
	count(Poder) as 'Quantidade de Poderes',
	max(Poder) as 'Maior Poder'
FROM Personagem

-- Questão 7:
SELECT
	IDRaca as 'Código da Raça',
	count(IDRaca) as 'Quantidade de Personagens'
FROM Personagem
GROUP BY IDRaca

-- Questão 8:
SELECT
	IDRaca as 'Código da Raça',
	avg(Poder) as 'Média de Poder'
FROM Personagem
GROUP BY IDRaca

-- Questão 9:
SELECT
	IDRaca as 'Código da Raça',
	count(IDPersonagem) as 'Total Personagens'
FROM Personagem
GROUP BY IDRaca
having count(IDPersonagem) > 2

-- Questão 10:
SELECT
	IDClasse as 'Código da Classe',
	avg(Poder) as 'Média de Poder'
FROM Personagem
GROUP BY IDClasse
having avg(Poder) > 50