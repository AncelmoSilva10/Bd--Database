CREATE DATABASE bdTransito
USE bdTransito
GO

CREATE TABLE tbMotorista(
	idMotorista INT PRIMARY KEY IDENTITY(1,1)
	,nomeMotorista VARCHAR(250)
	,dataNascimentoMotorista DATE
	,cpfMotorista VARCHAR(20)
	,CNHMotorista VARCHAR(15)
	,pontuacaoAcumulada INT
)

CREATE TABLE tbVeiculo(
	idVeiculo INT PRIMARY KEY IDENTITY(1,1)
	,modeloVeiculo VARCHAR(50)
	,placa VARCHAR(10)
	,renavam VARCHAR(20)
	,anoVeiculo INT
	,idMotorista INT FOREIGN KEY REFERENCES tbMotorista(idMotorista)
)

CREATE TABLE tbMultas(
	idMulta INT PRIMARY KEY IDENTITY(1,1)
	,dataMulta DATE
	,horaMulta TIME
	,pontosMulta INT
	,idVeiculo INT FOREIGN KEY REFERENCES tbVeiculo(idVeiculo)
)


