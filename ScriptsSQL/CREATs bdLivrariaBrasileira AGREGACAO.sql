USE bdLivrariaBrasileira

SELECT COUNT(nomeLivro) 'Total de Livros que come�am com P' FROM tbLivro
	WHERE nomeLivro LIKE 'P%'

SELECT MAX(numPaginas) 'Maior N�mero de P�ginas dos Livros' FROM tbLivro

SELECT MIN(numPaginas) 'Menor N�mero de P�ginas dos Livros' FROM tbLivro

SELECT AVG(numPaginas) 'M�dia dos N�meros de P�ginas dos Livros' FROM tbLivro

SELECT SUM(numPaginas) 'Somas do N� de P�ginas da Editora 01' FROM tbLivro
	WHERE codEditora = 1

SELECT SUM(numPaginas) 'Soma do N� de P�ginas dos livros que come�am com A' FROM tbLivro
	WHERE nomeLivro LIKE 'A%'

SELECT AVG(numPaginas) 'M�dia de N� de P�ginas dos Livros do Aurtor 03' FROM tbLivro
	WHERE codAutor = 3

SELECT COUNT(nomeLivro) 'Quantidade de Livros que s�o da Editora 04' FROM tbLivro
	WHERE codEditora = 4

SELECT AVG(numPaginas) 'M�dia do N� de Paginas dos Livros que tem Estrela no nome' FROM tbLivro
	WHERE nomeLivro LIKE '%estrela%'

SELECT COUNT(nomeLivro) 'A qntd de Livros que tem a Palavra Poema no seu Nome' FROM tbLivro
	WHERE nomeLivro LIKE '%poema%'

SELECT tbGenero.nomeGenero, COUNT(tbLivro.codLivro) 'Qntd por Genero de Livros'FROM tbLivro
INNER JOIN tbGenero ON tbLivro.codGenero = tbGenero.codGenero
GROUP BY tbGenero.nomeGenero


