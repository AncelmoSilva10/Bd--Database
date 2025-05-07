CREATE DATABASE bdEscola

USE bdEscola

CREATE TABLE tbCurso(
	codCurso INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso VARCHAR (50)
	,cargaHorarioCurso VARCHAR(4)
	,valorCurso REAL
)

CREATE TABLE tbAluno(
	codAluno INT PRIMARY KEY IDENTITY(1,1)
	,nomeAluno VARCHAR(50)
	,dataNascimentoAluno DATETIME
	,rgAluno VARCHAR(14)
	,naturalidadeAluno VARCHAR(2)
)

CREATE TABLE tbTurma(
	codTurma INT PRIMARY KEY IDENTITY(1,1)
	,nomeTurma VARCHAR (50)
	,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
	,horarioTurma DATETIME
)

CREATE TABLE tbMatricula(
	codMatricula INT PRIMARY KEY IDENTITY(1,1)
	,dataMatricula DATETIME
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
)