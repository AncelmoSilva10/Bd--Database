CREATE DATABASE bdLojaRoupas
USE bdLojaRoupas
-- DROP DATABASE  bdLojaRoupas

CREATE TABLE tbCliente(
	codCliente INT PRIMARY KEY
	,nomeCliente VARCHAR(40)
	,cpfCliente VARCHAR(14) UNIQUE
)

CREATE TABLE tbVendedor(
	codVendedor INT PRIMARY KEY
	,nomeVendedor VARCHAR(40)
	,cpfVendedor VARCHAR(14) UNIQUE
)

CREATE TABLE tbFormaPagto(
	codFormaPagto INT PRIMARY KEY
	,descFormaPagto VARCHAR(40)
)

CREATE TABLE tbCategoria(
	codCategoria INT PRIMARY KEY
	,descCategoria VARCHAR(40)
)

CREATE TABLE tbVenda(
	codVenda INT PRIMARY KEY
	,dataVenda DATE
	,valorTotalVenda REAL
	,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
	,codVendedor INT FOREIGN KEY REFERENCES tbVendedor(codVendedor)
)

CREATE TABLE tbParcela(
	codParcela INT PRIMARY KEY
	,codVenda INT FOREIGN KEY REFERENCES tbVenda(codVenda)
	,codFormaPagto INT FOREIGN KEY REFERENCES tbFormaPagto(codFormaPagto)
	,valorParcela REAL
	,dtVenctoParcela DATE
)

CREATE TABLE tbProduto(
	codProduto INT PRIMARY KEY
	,descProduto VARCHAR(40)
	,valor REAL
	,codCategoria INT FOREIGN KEY REFERENCES tbCategoria(codCategoria)
)

CREATE TABLE tbItemVenda(
	codItemVenda INT PRIMARY KEY
	,codVenda	INT FOREIGN KEY REFERENCES tbVenda(codVenda)
	,codProduto	INT FOREIGN KEY REFERENCES tbProduto(codProduto)
	,qtde INT
	,subTotal REAL
)
