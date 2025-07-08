## Comandos SQL

```sql
--1. Buscar o nome e ano dos filmes
SELECT Nome, Ano
FROM Filmes
ORDER BY Ano;

--2.  Buscar o nome, ano e duração dos filmes, ordenados por ordem crescente pelo ano
SELECT Nome, Ano, Duracao
FROM Filmes
ORDER BY Ano ASC;

--3. Buscar pelo filme "De Volta para o Futuro", trazendo nome, ano e duração
SELECT Nome, Ano, Duracao
FROM Filmes
WHERE Nome = 'De Volta para o Futuro';

--4. Buscar os filmes lançados em 1997
SELECT Nome, Ano, Duracao
FROM Filmes
WHERE Ano = 1997;

--5. Buscar os filmes lançados APÓS o ano 2000
SELECT Nome, Ano, Duracao
FROM Filmes
WHERE Ano > 2000
ORDER BY Ano;

--6. Buscar os filmes com duração maior que 100 e menor que 150, ordenando pela duração em ordem crescente

SELECT Nome, Ano, Duracao
FROM Filmes
WHERE Duracao > 100 AND Duracao < 150
ORDER BY Duracao ASC;

--7. Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela quantidade em ordem decrescente

SELECT Ano, Quantidade
FROM (
    SELECT Ano, COUNT(*) AS Quantidade, MAX(Duracao) AS DuracaoMaxima
    FROM Filmes
    GROUP BY Ano
) AS sub
ORDER BY Quantidade DESC;

--8. Buscar os atores do gênero masculino, retornando o PrimeiroNome, UltimoNome

SELECT id, PrimeiroNome, UltimoNome, Genero
FROM Atores
WHERE Genero = 'M';


-- Buscar os atores do gênero feminino, retornando PrimeiroNome, UltimoNome, ordenando pelo PrimeiroNome

SELECT id, PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome ASC;

-- Buscar o nome do filme e o gênero
SELECT f.nome AS nome_filme, g.genero AS genero
FROM filmes f
JOIN filmesgenero fg ON f.id = fg.idfilme
JOIN generos g ON fg.idgenero = g.id;

-- Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT f.nome AS nome_filme, g.genero AS genero
FROM filmes f
JOIN filmesgenero fg ON f.id = fg.idfilme
JOIN generos g ON fg.idgenero = g.id
WHERE g.genero = 'Mistério';

-- Buscar o nome do filme e os atores, trazendo PrimeiroNome, UltimoNome e seu Papel
SELECT 
  f.nome AS nome_filme, 
  a.PrimeiroNome, 
  a.UltimoNome, 
  e.papel
FROM filmes f
JOIN elencofilme e ON f.id = e.idfilme
JOIN atores a ON e.idator = a.id;

