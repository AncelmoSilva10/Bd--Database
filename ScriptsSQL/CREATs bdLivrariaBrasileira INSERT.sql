USE bdLivrariaBrasileira

INSERT INTO tbAutor(nomeAutor)
VALUES
	('Machado  de  Assis')
	,('Cora  Coralina')
	,('Graciliano  Ramos')
	,('Clarice  Lispector')
	,('Erico Verissimo')

SELECT * FROM tbAutor


INSERT INTO tbEditora(nomeEditora)
VALUES
	('Cia das Letras')
	,('Atica')
	,('Saraiva')

SELECT * FROM tbEditora


INSERT INTO tbGenero(nomeGenero)
VALUES
	('Romance')
	,('Posi')
	,('Literatura Brasileira')

SELECT * FROM tbGenero


INSERT INTO tbLivro(nomeLivro, codAutor, codEditora, codGenero, numPaginas)
VALUES
	('Dom Casmurro', '1', '1', '1', ' 240')
	,('Memórias Póstumas de Brás Cubas', '1', '1', '1', '200')
	,('Quincas Borba', '1', '1', '1', '250')
	,('Poemas dos Becos de Goiás e Estórias Mais', '2', '1', '1', '200')
	,('Meu Livro de Cordel', '2', '1', '1', '100')
	,('Estórias da Casa Velha da Ponte', '2', '2', '2', '150')
	,('Vidas Secas', '3', '2', '2', '150')
	,('Angústia', '3', '2', '2', '250')
	,('São Bernardo', '3', '2', '2', '200')
	,('A Hora da Estrela', '4', '2', '2', '160')
	,('Perto do Coração Selvagem', '4', '3', '3', '200')
	,('A Paixão Segundo G.H.', '4', '3', '3', '200')
	,('O Tempo e o Vento', '5', '3', '3', '800')
	,('Incidente em Antares', '5', '3', '3', '400')
	,('Olhai os Lírios do Campo', '5', '3', '3', '350')

SELECT * FROM tbLivro