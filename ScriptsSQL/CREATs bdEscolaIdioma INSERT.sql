use bdEscolaDeIdiomas

INSERT INTO tbAluno(nomeAluno, rgAluno, cpfAluno, logradouro, numero, complemento, cep, bairro, cidade, dataNascAluno)
VALUES
	('Patrick Lessa Teixeira', '123456789', '12345678900', 'Rua Faultline', '10A', 'casa', '08121210', 'Silverchair Paulista', 'S�o Paulo', '03/05/2002')
	, ('Igor Morais Da Silva', '123456789', '12345678900', 'Rua Hardwired', '31', 'casa', '08120565', 'Nirvana Paulistano', 'Campo Grande', '10/02/2001')
	, ('Ana Silva', '123456789', '12345678900', 'Rua Blackened', 'Bloco B-10A', 'apartamento', '08121880', 'Bairro do Limoeiro', 'S�o Paulo', '11/11/2003')
	, ('Icaro Oliva', '123456789', '12345678900', 'Rua Shade', '654', 'casa', '08121770', 'Silverchair Paulista', 'S�o Paulo', '06/02/2001')
	, ('Beatriz Campos', '123456789', '12345678900', 'Rua Sirens', '789', 'casa', '08121990', 'Vadder Paulista', 'S�o Paulo', '23/08/2001')

INSERT INTO tbTelefoneAluno(numTelAlu, codAluno)
VALUES 
	('1125629643', 1)
	, ('35962925729', 2)
	, ('1186547998', 4)

INSERT INTO tbCurso(nomeCurso, valorCurso)
VALUES
	('Ingl�s', 150.99)
	, ('Espanhol', 99.99)

INSERT INTO tbNivel(descNivel)
VALUES
	('Iniciante')
	, ('Intermedi�rio')
	, ('Avan�ado')

INSERT INTO tbPeriodo(descPeriodo)
VALUES
	('Manh�')
	, ('Tarde')

INSERT INTO tbTurma(descTurma, codCurso, codNivel, codPeriodo, horario, diaSemana)
VALUES 
	('Ingl�s 1A', 1, 1, 1, '07:00:00', 'S�bado')
	, ('Ingl�s 2A', 1, 2, 2, '13:00:00', 'S�bado')
	, ('Espanhol 1A', 2, 1, 2, '13:00:00', 'S�bado')

INSERT INTO tbMatricula(dataMatricula, codAluno, codTurma)
VALUES
	('18/07/2019', 1, 1)
	, ('10/01/2019', 2, 2)
	, ('17/07/2019', 3, 3)
	, ('24/05/2019', 4, 1)
	, ('11/01/2019', 5, 2)

	SELECT * FROM tbAluno
	SELECT * FROM tbCurso
	SELECT * FROM tbMatricula
	SELECT * FROM tbNivel
	SELECT * FROM tbPeriodo
	SELECT * FROM tbTelefoneAluno
	SELECT * FROM tbTurma
