USE bdEscola

SELECT * FROM tbCurso
UPDATE tbCurso
SET nomeCurso = 'Inglês Britânico'
	WHERE codCurso = 1

UPDATE tbCurso
SET nomeCurso = 'Alemão'
	,cargaHorarioCurso = '4000'
	,valorCurso = '790'
	WHERE codCurso = 2


SELECT * FROM tbAluno
UPDATE tbAluno
SET nomeAluno = 'Paulo Santos de Almeida'
	WHERE codAluno = 1

UPDATE tbAluno
SET nomeAluno = 'Mariana Aparecida Barbosa dos Santos'
	WHERE codAluno = 5

UPDATE tbAluno
SET rgAluno = '32.348.863-7'
	WHERE codAluno = 3

UPDATE tbAluno
SET naturalidadeAluno = 'MG'
	WHERE codAluno = 1

UPDATE tbAluno
SET naturalidadeAluno = 'MS'
	WHERE codAluno = 5





SELECT * FROM tbTurma
UPDATE tbTurma
SET nomeTurma = '1|B'
	,horarioTurma = '1900-01-01 18:30:00'
	,codCurso = 1
	WHERE codTurma = 2

UPDATE tbTurma
SET nomeTurma = '1AA'
	,horarioTurma = '1900-01-01 19:30:00'
	,codCurso = 2
	WHERE codTurma = 3



SELECT * FROM tbMatricula
UPDATE tbMatricula
SET codAluno = 2
	,codTurma = 2
	WHERE codMatricula = 2

UPDATE tbMatricula
SET dataMatricula = '15/08/2015'
	WHERE codMatricula = 5



