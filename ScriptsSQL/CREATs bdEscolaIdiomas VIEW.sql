USE bdEscolaIdiomas

--Crie uma visão “Preço_Baixo” que exiba o código, nome do curso, carga horária e o valor do curso de todos os cursos que tenha preço inferior ao preço médio
CREATE VIEW Preco_Baixo AS
	SELECT codCurso, nomeCurso, cargahorariaCurso, valorCurso FROM tbCurso
	WHERE valorCurso < (SELECT AVG(valorCurso) FROM tbCurso)
	
SELECT * FROM Preco_Baixo

--Usando a visão “Preço_Baixo”, mostre todos os cursos ordenados por carga horária.
SELECT nomeCurso, cargahorariaCurso FROM Preco_Baixo
	ORDER BY cargahorariaCurso
	
--Crie uma visão “Alunos_Turma” que exiba o curso e a quantidade de alunos por turma.
CREATE VIEW Alunos_Turma AS
	SELECT nomeCurso AS Curso, nomeTurma AS Turma, COUNT(tbMatricula.codAluno) AS Quantidade_Alunos FROM tbMatricula
	INNER JOIN tbTurma  ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN  tbCurso  ON tbTurma.codCurso = tbCurso.codCurso
	GROUP BY  tbCurso.nomeCurso, tbTurma.nomeTurma

SELECT * FROM Alunos_Turma

-- Usando a visão “Alunos_Turma” exiba a turma com maior número de alunos
SELECT  Turma, Quantidade_Alunos FROM Alunos_Turma
	WHERE  Quantidade_Alunos = (SELECT MAX(Quantidade_Alunos) FROM Alunos_Turma)

--Crie uma visão “Turma_Curso que exiba o curso e a quantidade de turmas.
CREATE VIEW Turma_Curso AS 
	SELECT tbCurso.nomeCurso AS Curso, COUNT(tbTurma.codTurma) AS Quantidade_Turma FROM tbTurma
	INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
	GROUP BY tbCurso.nomeCurso

SELECT * FROM Turma_Curso

--Usando a visão “Turma_Curso exiba o curso com menor número de turmas.
SELECT Curso, Quantidade_Turma FROM  Turma_Curso
	WHERE Quantidade_Turma = (SELECT MIN(Quantidade_Turma) FROM Turma_Curso)


