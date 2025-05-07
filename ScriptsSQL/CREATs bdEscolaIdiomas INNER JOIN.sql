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
	WHERE MONTH(tbMatricula.dataMatr�cula) = 5
	AND YEAR(tbMatricula.dataMatr�cula) = 2016 


--Apresentar o nome dos alunos em ordem alfab�tica ao lado do nome das turmas e os nomes dos cursos em que est�o matriculados
SELECT tbAluno.nomeAluno, tbTurma.nomeTurma, nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codMatricula = tbMatricula.codAluno
	INNER JOIN tbTurma ON tbMatricula.codAluno = tbTurma.codTurma
	INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
	ORDER BY tbAluno.nomeAluno 


--Apresentar o nome dos cursos e os hor�rios em que eles s�o oferecidos
SELECT tbCurso.nomeCurso, tbTurma.horarioTurma FROM tbCurso
	INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
	GROUP BY tbCurso.nomeCurso, tbTurma.horarioTurma


--Apresentar a quantidade de alunos nascidos por estado que estejam matriculados no curso de ingles
SELECT COUNT(tbAluno.naturalidadeAluno) 'Quantidade de Alunos nascidos por Estado', tbAluno.naturalidadeAluno FROM tbCurso
	INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
	INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
	INNER JOIN tbAluno ON tbMatricula.codAluno = tbAluno.codAluno
	WHERE nomeCurso = 'Ingl�s'
	GROUP BY tbAluno.naturalidadeAluno


--Apresentar o nome dos alunos ao lado da data de matr�cula no formato dd/mm/aaaa
SELECT tbAluno.nomeAluno, FORMAT(tbMatricula.dataMatr�cula, 'dd/MM/yyyy') 'Data de Matr�cula'FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno	


--Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de ingl�s
SELECT tbAluno.nomeAluno FROM tbCurso
	INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
	INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
	INNER JOIN tbAluno ON tbMatricula.codAluno = tbAluno.codAluno
	WHERE tbCurso.nomeCurso = 'Ingl�s' AND tbAluno.nomeAluno LIKE 'A%'


--Apresentar a quantidade de matriculas feitas no ano de 2016
SELECT COUNT(tbMatricula.dataMatr�cula) 'Quantidade de Matriculas' FROM tbMatricula
	WHERE YEAR(tbMatricula.dataMatr�cula) = 2016
	

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


--Apresentar os nomes dos alunos que fazem o curso de alem�o
SELECT tbAluno.nomeAluno, tbCurso.nomeCurso FROM tbCurso
	INNER JOIN tbTurma ON tbCurso.codCurso = tbTurma.codCurso
	INNER JOIN tbMatricula ON tbTurma.codTurma = tbMatricula.codTurma
	INNER JOIN tbAluno ON tbMatricula.codAluno = tbAluno.codAluno
	WHERE tbCurso.nomeCurso = 'Alem�o'


	


