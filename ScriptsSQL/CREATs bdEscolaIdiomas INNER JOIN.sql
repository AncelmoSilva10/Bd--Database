USE bdEscolaIdiomas


--Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem
SELECT tbAluno.nomeAluno, tbCurso.nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso


--Apresentar a quantidade de alunos matriculados por nome do curso
SELECT tbCurso.nomeCurso, COUNT(tbMatricula.codMatricula) ' Quantidade de Alunos Matriculados' FROM tbCurso
	INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
	INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
	GROUP BY tbCurso.nomeCurso
	

--Apresentar a quantidade de alunos matriculados por nome da turma
SELECT tbTurma.nomeTurma, COUNT(tbMatricula.codMatricula) 'Quantidade de Alunos Matriculados' FROM tbTurma
	INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
	INNER JOIN tbAluno ON tbMatricula.codMatricula = tbAluno.codAluno
	GROUP BY tbTurma.nomeTurma


--Apresentar a quantidade de alunos que fizeram matricula em maio de 2016
SELECT COUNT(tbMatricula.codMatricula) 'Quantidade de Alunos Matriculados' FROM tbMatricula
	INNER JOIN tbAluno ON tbMatricula.codAluno = tbAluno.codAluno
	WHERE MONTH(tbMatricula.dataMatrícula) = 5
	AND YEAR(tbMatricula.dataMatrícula) = 2016 


--Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas e os nomes dos cursos em que estão matriculados
SELECT tbAluno.nomeAluno, tbTurma.nomeTurma, nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codMatricula = tbMatricula.codAluno
	INNER JOIN tbTurma ON tbMatricula.codAluno = tbTurma.codTurma
	INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
	ORDER BY tbAluno.nomeAluno 


--Apresentar o nome dos cursos e os horários em que eles são oferecidos
SELECT tbCurso.nomeCurso, tbTurma.horarioTurma FROM tbCurso
	INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
	GROUP BY tbCurso.nomeCurso, tbTurma.horarioTurma


--Apresentar a quantidade de alunos nascidos por estado que estejam matriculados no curso de ingles
SELECT COUNT(tbAluno.naturalidadeAluno) 'Quantidade de Alunos nascidos por Estado', tbAluno.naturalidadeAluno FROM tbCurso
	INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
	INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
	INNER JOIN tbAluno ON tbMatricula.codAluno = tbAluno.codAluno
	WHERE nomeCurso = 'Inglês'
	GROUP BY tbAluno.naturalidadeAluno


--Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa
SELECT tbAluno.nomeAluno, FORMAT(tbMatricula.dataMatrícula, 'dd/MM/yyyy') 'Data de Matrícula'FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno	


--Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de inglês
SELECT tbAluno.nomeAluno FROM tbCurso
	INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
	INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
	INNER JOIN tbAluno ON tbMatricula.codAluno = tbAluno.codAluno
	WHERE tbCurso.nomeCurso = 'Inglês' AND tbAluno.nomeAluno LIKE 'A%'


--Apresentar a quantidade de matriculas feitas no ano de 2016
SELECT COUNT(tbMatricula.dataMatrícula) 'Quantidade de Matriculas' FROM tbMatricula
	WHERE YEAR(tbMatricula.dataMatrícula) = 2016
	

--Apresentar a quantidade de matriculas por nome do curso
SELECT COUNT(tbMatricula.codMatricula)'Quantidade de Matriculas', tbCurso.nomeCurso FROM tbCurso
	INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
	INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
	GROUP BY tbCurso.nomeCurso


--Apresentar a quantidade de alunos que fazemos cursos que custam mais de R$300,00
SELECT COUNT(tbAluno.codAluno) 'Quantidade de Alunos', tbCurso.valorCurso FROM tbCurso
	INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
	INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
	INNER JOIN tbAluno ON tbMatricula.codAluno = tbAluno.codAluno
	WHERE tbCurso.valorCurso > 300
	GROUP BY tbCurso.valorCurso


--Apresentar os nomes dos alunos que fazem o curso de alemão
SELECT tbAluno.nomeAluno, tbCurso.nomeCurso FROM tbCurso
	INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
	INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
	INNER JOIN tbAluno ON tbMatricula.codAluno = tbAluno.codAluno
	WHERE tbCurso.nomeCurso = 'Alemão'


	


