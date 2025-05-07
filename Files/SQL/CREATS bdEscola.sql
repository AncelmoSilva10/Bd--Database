USE bdEscola

SELECT * FROM tbCurso
INSERT INTO tbCurso(nomeCurso, cargaHorarioCurso, valorCurso)
VALUES('Inglês' , '2000', '356.00')
	  ,('Alemão' , '3000', '478.00')


SELECT * FROM tbAluno
INSERT INTO tbAluno(nomeAluno, dataNascimentoAluno, rgAluno, naturalidadeAluno)
VALUES('Paulo Santos' , '2000-10-03 00:00:00', '82.292.122-0', 'SP')
	  ,('Maria da Glória' , '1999-03-10 00:00:00', '35.233.123-0', 'SP')
	  ,('Perla Nogueira Silva' , '1998-04-04 00:00:00', '23.533.211-9', 'SP')
	  ,('Gilson Barros Silva' , '1995-09-09 00:00:00', '34.221.111-x', 'PE')
	  ,('Mariana Barbosa Santos' , '2001-10-10 00:00:00', '54.222.122-9', 'RJ')

SELECT * FROM tbTurma
INSERT INTO tbTurma(nomeTurma, horarioTurma,codCurso)
VALUES ('1|A', '1900-01-01 12:00:00',1)
	   ,('1|B', '1900-01-01 18:00:00',1)
	   ,('1AA', '1900-01-01 19:00:00',2)


SELECT * FROM tbMatricula
INSERT INTO tbMatricula(dataMatricula,codAluno,codTurma)
VALUES ('2015-03-10 00:00:00',1,1)
	   ,('2014-04-05 00:00:00',2,1)
	   ,('2012-03-05 00:00:00',3,2)
	   ,('2016-03-03 00:00:00',1,3)
	   ,('2015-07-05 00:00:00',4,2)
	   ,('2005-05-07 00:00:00',4,3)
	   ,('2015-06-06 00:00:00',5,1)
	   ,('2015-05-05 00:00:00',5,3)