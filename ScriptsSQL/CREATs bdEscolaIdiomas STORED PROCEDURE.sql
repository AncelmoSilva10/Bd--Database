USE bdEscolaIdiomas

--Criar uma stored procedure “Busca_Aluno”  que receba o código do aluno e retorne seu  nome e data de nascimento.
CREATE PROCEDURE Busca_Aluno
    @codAluno INT
AS
BEGIN
    SELECT nomeAluno, dataNascAluno
    FROM tbAluno
    WHERE codAluno = @codAluno
END

EXEC Busca_Aluno @codAluno = 1



--Criar uma stored procedure “Insere_Aluno” que insira um registro na tabela de Alunos.
CREATE PROCEDURE Insere_Aluno
    @nomeAluno VARCHAR(50),
    @dataNascAluno DATE,
    @rgAluno CHAR(12),
    @naturalidadeAluno CHAR(2)
AS
BEGIN
    INSERT INTO tbAluno(nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno)
    VALUES (@nomeAluno, @dataNascAluno, @rgAluno, @naturalidadeAluno)
END

EXEC Insere_Aluno 
    @nomeAluno = 'João Carlos', 
    @dataNascAluno = '2002-06-15', 
    @rgAluno = '11.222.333-4', 
    @naturalidadeAluno = 'MG'



--Criar uma stored procedure “Aumenta_Preco” que, dados o nome do  curso e um percentual, aumente o valor do curso com a porcentagem informada
CREATE PROCEDURE Aumenta_Preco
    @nomeCurso VARCHAR(50),
    @percentual DECIMAL(5, 2)
AS
BEGIN
    UPDATE tbCurso
    SET valorCurso = valorCurso * (1 + @percentual / 100)
    WHERE nomeCurso = @nomeCurso
END

EXEC Aumenta_Preco 
    @nomeCurso = 'Inglês', 
    @percentual = 10



--Criar uma stored procedure “Exibe_Turma” que, dado o nome da turma exiba todas as informações dela.
CREATE PROCEDURE Exibe_Turma
    @nomeTurma CHAR(3)
AS
BEGIN
    SELECT *
    FROM tbTurma
    WHERE nomeTurma = @nomeTurma
END

EXEC Exibe_Turma @nomeTurma = '1|A'



--Criar uma stored procedure “Exibe_AlunosdaTurma” que, dado o nome da turma exiba os seus alunos.
CREATE PROCEDURE Exibe_AlunosdaTurma
    @nomeTurma CHAR(3)
AS
BEGIN
   SELECT tbAluno.nomeAluno, tbAluno.dataNascAluno, tbAluno.rgAluno, tbAluno.naturalidadeAluno FROM tbAluno 
	INNER JOIN tbMatricula ON tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma ON tbMatricula.codTurma = tbTurma.codTurma
	WHERE tbTurma.nomeTurma = @nomeTurma

END

EXEC Exibe_AlunosdaTurma @nomeTurma = '1|A'



--Criar uma stored procedure para inserir alunos, verificando pelo cpf se o aluno existe ou não, e informar essa condição via mensagem
CREATE PROCEDURE Insere_Aluno_Com_Verificacao
    @nomeAluno VARCHAR(50),
    @dataNascAluno DATE,
    @rgAluno CHAR(12),
    @naturalidadeAluno CHAR(2)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM tbAluno WHERE rgAluno = @rgAluno)
    BEGIN
        PRINT 'Aluno já existe no sistema.'
    END
    ELSE
    BEGIN
        INSERT INTO tbAluno(nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno)
        VALUES (@nomeAluno, @dataNascAluno, @rgAluno, @naturalidadeAluno)
        PRINT 'Aluno inserido com sucesso.'
    END
END

EXEC Insere_Aluno_Com_Verificacao 
    @nomeAluno = 'Ana Paula', 
    @dataNascAluno = '2005-11-22', 
    @rgAluno = '22.333.444-5', 
    @naturalidadeAluno = 'BA'




--Criar uma stored procedure que receba o nome do curso e o nome do aluno e matricule o mesmo no curso pretendido
CREATE PROCEDURE Matricula_Aluno
    @nomeCurso VARCHAR(50),
    @nomeAluno VARCHAR(50)
AS
BEGIN
    DECLARE @codCurso INT
    DECLARE @codAluno INT
    DECLARE @codTurma INT

    SELECT @codCurso = codCurso FROM tbCurso WHERE nomeCurso = @nomeCurso
    SELECT @codAluno = codAluno FROM tbAluno WHERE nomeAluno = @nomeAluno
    SELECT @codTurma = codTurma FROM tbTurma WHERE codCurso = @codCurso

    IF @codCurso IS NULL OR @codAluno IS NULL OR @codTurma IS NULL
    BEGIN
        PRINT 'Curso ou Aluno não encontrado, ou não há turma disponível para este curso.'
    END
    ELSE
    BEGIN
        INSERT INTO tbMatricula(dataMatrícula, codAluno, codTurma)
        VALUES (GETDATE(), @codAluno, @codTurma)
        PRINT 'Aluno matriculado com sucesso.'
    END
END

EXEC Matricula_Aluno 
    @nomeCurso = 'Inglês', 
    @nomeAluno = 'Maria da Gloria'



