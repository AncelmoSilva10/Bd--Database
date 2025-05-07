USE bdEscolaDeIdiomas

-- Criar uma consulta que retorne o nome e o preço dos cursos que custem abaixo do valor médio
SELECT TbCurso.nomeCurso, tbCurso.valorCurso FROM tbCurso
	WHERE tbCurso.valorCurso < (SELECT AVG(tbCurso.valorCurso) FROM tbCurso)


--Criar uma consulta que retorne o nome e o rg do aluno mais novo
SELECT tbAluno.nomeAluno, tbAluno.rgAluno FROM tbAluno
	WHERE tbAluno.dataNascAluno = (SELECT MAX(tbAluno.dataNascAluno) FROM tbAluno)


-- Criar uma consulta que retorne o nome do aluno mais velho
SELECT tbAluno.nomeAluno FROM tbAluno
	WHERE tbAluno.dataNascAluno = (SELECT MIN(tbAluno.dataNascAluno) FROM tbAluno)


-- Criar uma consulta que retorne o nome e o valor do curso mais caro
SELECT tbCurso.nomeCurso, tbCurso.valorCurso FROM tbCurso
	WHERE tbCurso.valorCurso = (SELECT MAX(tbCurso.valorCurso) FROM tbCurso)


--Criar uma consulta que retorne o nome do aluno e o nome do curso, do aluno que fez a última matrícula
SELECT tbAluno.nomeAluno, tbCurso.nomeCurso FROM tbMatricula
	INNER JOIN tbAluno ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
	WHERE tbMatricula.dataMatricula = (SELECT MAX(tbMatricula.dataMatricula) FROM tbMatricula)


--Criar uma consulta que retorne o nome do primeiro aluno a ser matriculado na escola de Idiomas
SELECT tbAluno.nomeAluno FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
	WHERE tbMatricula.dataMatricula = (SELECT MIN(tbMatricula.dataMatricula) FROM tbMatricula)


--Criar uma consulta que retorne o nome, rg e data de nascimento de todos os alunos que estejam matriculados no curso de inglês
SELECT tbAluno.nomeAluno, tbAluno.rgAluno, tbAluno.dataNascAluno FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
	WHERE tbCurso.nomeCurso = 'Inglês'
	

