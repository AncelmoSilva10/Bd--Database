USE bdEscolaIdiomas

--Crie uma vis�o �Pre�o_Baixo� que exiba o c�digo, nome do curso, carga hor�ria e o valor do curso de todos os cursos que tenha pre�o inferior ao pre�o m�dio
CREATE VIEW Preco_Baixo AS
	SELECT codCurso, nomeCurso, cargahorariaCurso, valorCurso FROM tbCurso
	WHERE valorCurso < (SELECT AVG(valorCurso) FROM tbCurso)
	
SELECT * FROM Preco_Baixo

--Usando a vis�o �Pre�o_Baixo�, mostre todos os cursos ordenados por carga hor�ria.
SELECT nomeCurso, cargahorariaCurso FROM Preco_Baixo
	ORDER BY cargahorariaCurso
	
--Crie uma vis�o �Alunos_Turma� que exiba o curso e a quantidade de alunos por turma.
CREATE VIEW Alunos_Turma AS
	SELECT nomeCurso AS Curso, nomeTurma AS Turma, COUNT(tbMatricula.codAluno) AS Quantidade_Alunos FROM tbMatricula
	INNER JOIN tbTurma  ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN  tbCurso  ON tbTurma.codCurso = tbCurso.codCurso
	GROUP BY  tbCurso.nomeCurso, tbTurma.nomeTurma

SELECT * FROM Alunos_Turma

-- Usando a vis�o �Alunos_Turma� exiba a turma com maior n�mero de alunos
SELECT  Turma, Quantidade_Alunos FROM Alunos_Turma
	WHERE  Quantidade_Alunos = (SELECT MAX(Quantidade_Alunos) FROM Alunos_Turma)

--Crie uma vis�o �Turma_Curso que exiba o curso e a quantidade de turmas.
CREATE VIEW Turma_Curso AS 
	SELECT tbCurso.nomeCurso AS Curso, COUNT(tbTurma.codTurma) AS Quantidade_Turma FROM tbTurma
	INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
	GROUP BY tbCurso.nomeCurso

SELECT * FROM Turma_Curso

--Usando a vis�o �Turma_Curso exiba o curso com menor n�mero de turmas.
SELECT Curso, Quantidade_Turma FROM  Turma_Curso
	WHERE Quantidade_Turma = (SELECT MIN(Quantidade_Turma) FROM Turma_Curso)


