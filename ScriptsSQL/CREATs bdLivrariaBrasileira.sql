CREATE DATABASE bdLivrariaBrasileira
GO
USE bdLivrariaBrasileira

CREATE TABLE tbAutor(
	codAutor INT PRIMARY KEY IDENTITY(1,1)
	,nomeAutor VARCHAR (100)
)

CREATE TABLE tbEditora(
	codEditora INT PRIMARY KEY IDENTITY(1,1)
	,nomeEditora VARCHAR (100)
)

CREATE TABLE tbGenero(
	codGenero INT PRIMARY KEY IDENTITY(1,1)
	,nomeGenero VARCHAR (100)
)

CREATE TABLE tbLivro(
	codLivro INT PRIMARY KEY IDENTITY(1,1)
	,nomeLivro VARCHAR (100)
	,numPaginas INT
	,codGenero INT FOREIGN KEY REFERENCES tbGenero(codGenero)
	,codAutor INT FOREIGN KEY REFERENCES tbAutor(codAutor)
	,codEditora INT FOREIGN KEY REFERENCES tbEditora(codEditora)
)


