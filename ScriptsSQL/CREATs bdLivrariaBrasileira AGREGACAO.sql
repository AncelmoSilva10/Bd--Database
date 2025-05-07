USE bdLivrariaBrasileira

SELECT COUNT(nomeLivro) 'Total de Livros que começam com P' FROM tbLivro
	WHERE nomeLivro LIKE 'P%'

SELECT MAX(numPaginas) 'Maior Número de Páginas dos Livros' FROM tbLivro

SELECT MIN(numPaginas) 'Menor Número de Páginas dos Livros' FROM tbLivro

SELECT AVG(numPaginas) 'Média dos Números de Páginas dos Livros' FROM tbLivro

SELECT SUM(numPaginas) 'Somas do Nº de Páginas da Editora 01' FROM tbLivro
	WHERE codEditora = 1

SELECT SUM(numPaginas) 'Soma do Nº de Páginas dos livros que começam com A' FROM tbLivro
	WHERE nomeLivro LIKE 'A%'

SELECT AVG(numPaginas) 'Média de Nº de Páginas dos Livros do Aurtor 03' FROM tbLivro
	WHERE codAutor = 3

SELECT COUNT(nomeLivro) 'Quantidade de Livros que são da Editora 04' FROM tbLivro
	WHERE codEditora = 4

SELECT AVG(numPaginas) 'Média do Nº de Paginas dos Livros que tem Estrela no nome' FROM tbLivro
	WHERE nomeLivro LIKE '%estrela%'

SELECT COUNT(nomeLivro) 'A qntd de Livros que tem a Palavra Poema no seu Nome' FROM tbLivro
	WHERE nomeLivro LIKE '%poema%'

SELECT tbGenero.nomeGenero, COUNT(tbLivro.codLivro) 'Qntd por Genero de Livros'FROM tbLivro
INNER JOIN tbGenero ON tbLivro.codGenero = tbGenero.codGenero
GROUP BY tbGenero.nomeGenero


