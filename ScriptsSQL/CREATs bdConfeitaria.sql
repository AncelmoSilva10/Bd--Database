CREATE DATABASE bdConfeitaria
GO
USE bdConfeitaria

CREATE TABLE tbCliente(
	codCliente INT PRIMARY KEY IDENTITY(1,1)
	,nomeCliente VARCHAR(250)
	,dataNascimentoCliente DATE
	,ruaCliente VARCHAR(80)
	,ruaCasaCliente VARCHAR(80)
	,cepCliente VARCHAR(8)
	,bairroCliente VARCHAR(50)
	,cidadeCliente VARCHAR(50)
	,estadoCliente CHAR(2)
	,cpfCliente CHAR (11)
	,sexoCliente CHAR(2)
)

CREATE TABLE tbEncomenda(
	codEncomenda INT PRIMARY KEY IDENTITY(1,1)
	,dataEncomenda DATE
	,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
	,valorTotalEncomenda REAL
	,dataEntregaEncomenda DATE
)

CREATE TABLE tbCategoriaProduto(
	codCategoriaProduto INT PRIMARY KEY IDENTITY(1,1)
	,nomeCategoriaProduto VARCHAR(50)
)

CREATE TABLE tbProduto(
	codProduto INT PRIMARY KEY IDENTITY(1,1)
	,nomeProduto VARCHAR(200)
	,precoKiloProduto REAL
	,codCategoriaProduto INT FOREIGN KEY REFERENCES tbCategoriaProduto(codCategoriaProduto)
)

CREATE TABLE tbItensEncomenda(
	codItensEncomenda INT PRIMARY KEY IDENTITY(1,1)
	,codEncomenda INT FOREIGN KEY REFERENCES tbCliente(codCliente)
	,codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto)
	,quantidadeKilos INT
	,subTotal REAL
)



