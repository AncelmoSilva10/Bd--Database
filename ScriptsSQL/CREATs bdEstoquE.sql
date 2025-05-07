CREATE DATABASE bdEstoque
GO
USE bdEstoque

CREATE TABLE tbCliente(
	codCliente INT PRIMARY KEY IDENTITY(1,1)
	,nomeCliente VARCHAR(50) NOT NULL
	,cpfCliente CHAR(13) UNIQUE
	,emailCliente VARCHAR(100) UNIQUE
	,sexoCliente CHAR(2)
	,dataNascimentoCliente DATE
)

CREATE TABLE tbFabricante(
	codFabricante INT PRIMARY KEY IDENTITY(1,1)
	,nomeFabricante VARCHAR(50)
)

CREATE TABLE tbFornecedor(
	codFornecedor INT PRIMARY KEY IDENTITY(1,1)
	,nomeFornecedor VARCHAR(50) NOT NULL
	,contatoFornecedor VARCHAR (30)
)

CREATE TABLE tbVenda(
	codVenda INT PRIMARY KEY IDENTITY(1,1)
	,dataVenda DATE
	,valorTotalVenda REAL
	,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
)

CREATE TABLE tbProduto(
	codProduto INT PRIMARY KEY IDENTITY(1,1)
	,descricaoProduto VARCHAR(50)
	,valorProduto REAL
	,quantidadeProduto INT
	,codFabricante INT FOREIGN KEY REFERENCES tbFabricante(codFabricante)
	,codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor (codFornecedor)
)

CREATE TABLE tbItensVenda(
	codItensVenda INT PRIMARY KEY IDENTITY(1,1)
	,codVenda INT FOREIGN KEY REFERENCES tbVenda(codVenda)
	,codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto)
	,quantidadeItensVenda INT
	,subTotalItensVenda REAL
)

CREATE TABLE tbSaidaProduto(
	codSaidaProduto INT PRIMARY KEY IDENTITY (1,1)
	,dataSaidaProduto DATE
	,codProduto INT FOREIGN KEY REFERENCES tbProduto (codProduto)
	,quantidadeSaidaProduto INT
)

CREATE TABLE tbEntradaProduto(
	codEntradaProduto INT PRIMARY KEY IDENTITY (1,1)
	,dataEntradaProduto DATE
	,codProduto INT FOREIGN KEY REFERENCES tbProduto (codProduto)
	,quantidadeEntradaProduto INT
)


