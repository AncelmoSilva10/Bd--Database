CREATE DATABASE bdUniv
GO
USE bdUniv

CREATE TABLE tbCurso(
	idCurso INT PRIMARY KEY IDENTITY(1,1)
	,tipoCurso VARCHAR (50)
)

CREATE TABLE tbDisciplinaCurso(
	idDisciplinaCurso INT PRIMARY KEY IDENTITY(1,1)
	,tipoDisciplina VARCHAR (50)
)

CREATE TABLE tbDisciplinas(
	idDisciplinas INT PRIMARY KEY IDENTITY(1,1)
	,idCurso INT FOREIGN KEY REFERENCES tbCurso(idCurso)
	,idDisciplinaCurso	INT FOREIGN KEY REFERENCES tbDisciplinaCurso(idDisciplinaCurso)
)


CREATE TABLE tbTurma(
	idTurma INT PRIMARY KEY IDENTITY(1,1)
	,anoFormação SMALLDATETIME
	,numSala INT
	,idCurso INT FOREIGN KEY REFERENCES tbCurso(idCurso)
)


CREATE TABLE tbAluno(
	idAluno INT PRIMARY KEY IDENTITY(1,1)
	,nomeAluno VARCHAR (50)
	,rgAluno VARCHAR(14) UNIQUE
	,cpfAluno VARCHAR(13) UNIQUE
	,lograAluno VARCHAR(50)
	,numAluno VARCHAR(10)
	,cepAluno CHAR(8)
	,bairroAluno VARCHAR (30)
	,cidadeAluno VARCHAR(30)
	,ufAluno CHAR(2)
	,complementoAluno VARCHAR(10)
	,idTurma INT FOREIGN KEY REFERENCES tbTurma(idTurma)
)


CREATE TABLE tbProfessor(
	idProfessor INT PRIMARY KEY IDENTITY(1,1)
	,nomeProfessor	VARCHAR (50)
	,rgProfessor VARCHAR(14) UNIQUE
	,cpfProfessor VARCHAR(13) UNIQUE
)


CREATE TABLE tbLecionarDisciplina(
	idLecionarDisciplina INT PRIMARY KEY IDENTITY(1,1)
	,idProfessor INT FOREIGN KEY REFERENCES tbProfessor(idProfessor)
	,idDisciplinas INT FOREIGN KEY REFERENCES tbDisciplinas(idDisciplinas)
)
