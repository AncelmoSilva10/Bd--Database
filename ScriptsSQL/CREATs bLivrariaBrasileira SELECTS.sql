USE bdLivrariaBrasileira

--A quantidade de livros agrupado pelo nome do g�nero
SELECT COUNT(tbLivro.codLivro) 'Quantidade de Livros', tbGenero.nomeGenero FROM tbGenero
	INNER JOIN tbLivro ON tbLivro.codGenero = tbGenero.codGenero
	GROUP BY tbGenero.nomeGenero


--A soma das p�ginas agrupada pelo nome do autor
SELECT SUM(tbLivro.numPaginas) 'Soma da Quantidade de P�ginas', tbAutor.nomeAutor FROM tbAutor
	INNER JOIN tbLivro ON tbLivro.codAutor = tbAutor.codAutor
	GROUP BY tbAutor.nomeAutor


--A m�dia de p�ginas agrupada pelo nome do autor em ordem alfab�tica (de A a Z)
SELECT AVG(tbLivro.numPaginas) 'M�dia das P�ginas', tbAutor.nomeAutor FROM tbAutor
	INNER JOIN tbLivro ON tbLivro.codAutor = tbAutor.codAutor
	GROUP BY tbAutor.nomeAutor
	ORDER BY tbAutor.nomeAutor 


--A quantidade de livros agrupada pelo nome da editora em ordem alfab�tica inversa (de Z a A)
SELECT COUNT(tbLivro.codLivro) 'Quantidade de Livros' , tbEditora.nomeEditora FROM tbEditora
	INNER JOIN tbLivro ON tbLivro.codEditora = tbEditora.codEditora
	GROUP BY tbEditora.nomeEditora
	ORDER BY tbEditora.nomeEditora DESC


--A soma de p�ginas doslivrosagrupados pelo nome doautor que sejam de autores cujo nome comece com a letra �C�
SELECT SUM(tbLivro.numPaginas) 'Soma da Quantidade de Paginas', tbAutor.nomeAutor FROM tbAutor
	INNER JOIN tbLivro ON tbLivro.codAutor = tbAutor.codAutor
	WHERE tbAutor.nomeAutor LIKE 'C%'
	GROUP BY tbAutor.nomeAutor
	

--A  quantidade  de  livros  agrupados  pelo  nome  do  autor,  cujo  nome  do  autor  seja �Machado de Assis� ou �Cora Coralina�ou �Graciliano Ramos� ou �Clarice Lispector�
SELECT COUNT(tbLivro.codLivro) 'Quantidade de Livros' , tbAutor.nomeAutor FROM tbAutor
	INNER JOIN  tbLivro ON tbLivro.codAutor = tbAutor.codAutor
	WHERE tbAutor.nomeAutor IN ('Machado de Assis', 'Cora Coralina', 'Graciliano Ramos', 'Clarice Lispector')
	GROUP BY tbAutor.nomeAutor


--A soma das p�ginas dos livros agrupadas pelo nome da editora cujo n�mero de p�ginas esteja entre 200 e 500 (inclusive)
SELECT SUM(tbLivro.numPaginas)'Soma de N�meros de P�ginas', tbEditora.nomeEditora FROM tbEditora
	INNER JOIN tbLivro ON tbLivro.codEditora = tbEditora.codEditora
	WHERE tbLivro.numPaginas BETWEEN 200 AND 500
	GROUP BY tbEditora.nomeEditora


--O nome dos livros ao lado do nome das editoras e do nome dos autores
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor, tbEditora.nomeEditora FROM tbLivro
	INNER JOIN tbEditora ON tbLivro.codEditora = tbEditora.codEditora
	INNER JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor


--O nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for �Cia das Letras�
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor, tbEditora.nomeEditora FROM tbLivro
	INNER JOIN tbEditora ON tbLivro.codEditora = tbEditora.codEditora
	INNER JOIN tbAutor ON tbLivro.codAutor = tbAutor.codAutor
	WHERE tbEditora.nomeEditora IN ('Cia das Letras')


--O nome dos livros ao lado dos nomes dos autores, somente dos livros que n�o forem do autor ��rico Ver�ssimo�
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor FROM tbAutor
	INNER JOIN tbLivro ON tbLivro.codAutor = tbAutor.codAutor
	WHERE tbAutor.nomeAutor <> '�rico Ver�ssimo'


--Os nomes  dos  autores  ao  lado  dos  nomes dos  livros,  inclusive  daqueles  que  n�o  tem livros cadastrados
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor FROM tbAutor
	LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor


--Os nomes  dos  autores  ao  lado  dos  nomes dos  livros,  inclusive  daqueles  que  n�o tem autores cadastrados
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor FROM tbAutor
	RIGHT JOIN tbLivro ON tbLivro.codAutor = tbAutor.codAutor


--O nome dos autores ao lado dos nomes dos livros, indiferente do autor ter ou n�o livro publicado, e indiferente do livro pertencer a algum autor
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor FROM tbAutor
	FULL JOIN tbLivro ON tbLivro.codAutor = tbAutor.codAutor


--A editora �tica ir� publicar todos os t�tulos dessa livraria. Criar um select que associe os nomes de todos os livros ao lado do nome da editora �tica.
SELECT tbLivro.nomeLivro, tbEditora.nomeEditora FROM tbLivro
	CROSS JOIN tbEditora
	WHERE tbEditora.nomeEditora = '�tica'


--Somente os nomes dos autores que n�o tem livros cadastrados
SELECT tbAutor.nomeAutor FROM tbAutor
	LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor
	WHERE tbLivro.codAutor IS NULL
	

--Os nomes dos g�neros que n�o possuem nenhum livro cadastrado
SELECT tbGenero.nomeGenero FROM tbGenero
	LEFT JOIN tbLivro ON tbGenero.codGenero = tbLivro.codGenero
	WHERE tbLivro.codGenero IS NULL

	
