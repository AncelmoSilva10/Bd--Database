CREATE DATABASE bdBanco;
USE bdBanco;

-- Tabela de Cliente
CREATE TABLE tbCliente (
    codCliente INT PRIMARY KEY IDENTITY(1,1),
    nomeCliente VARCHAR(100),
    cpfCliente VARCHAR(11)
);

-- Tabela de Conta Corrente
CREATE TABLE tbContaCorrente (
    numConta INT PRIMARY KEY IDENTITY(1,1),
    saldoConta REAL DEFAULT 0,
    codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
);

-- Tabela de Depósito
CREATE TABLE tbDeposito (
    codDeposito INT PRIMARY KEY IDENTITY(1,1),
    valorDeposito REAL,
    numConta INT FOREIGN KEY REFERENCES tbContaCorrente(numConta),
    dataDeposito DATE,
    horaDeposito TIME
);

-- Tabela de Saque
CREATE TABLE tbSaque (
    codSaque INT PRIMARY KEY IDENTITY(1,1),
    valorSaque REAL,
    numConta INT FOREIGN KEY REFERENCES tbContaCorrente(numConta),
    dataSaque DATE,
    horaSaque TIME
);