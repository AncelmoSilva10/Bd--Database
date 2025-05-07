USE bdEscolaIdiomas

--Crie uma função que informada uma data da matrícula , retorne o dia da semana
CREATE FUNCTION dbo.fc_diaSemana(@Data DATE)
RETURNS VARCHAR(40) 
AS
BEGIN
    DECLARE @DiaSemana VARCHAR(40)
    DECLARE @Dia INT;

    SET @Dia = DATEPART(DW, @Data)

    IF @Dia = 1 
    BEGIN
        SET @DiaSemana = 'DOMINGO'
    END
    IF @Dia = 2  
    BEGIN
        SET @DiaSemana = 'SEGUNDA-FEIRA'
    END
    IF @Dia = 3
    BEGIN
        SET @DiaSemana = 'TERÇA-FEIRA'
    END
    IF @Dia = 4  
    BEGIN
        SET @DiaSemana = 'QUARTA-FEIRA'
    END
    IF @Dia = 5  
    BEGIN
        SET @DiaSemana = 'QUINTA-FEIRA'
    END
    IF @Dia = 6  
    BEGIN
        SET @DiaSemana = 'SEXTA-FEIRA'
    END
    IF @Dia = 7  
    BEGIN
        SET @DiaSemana = 'SÁBADO'
    END

    RETURN @DiaSemana
END

--Testando
SELECT dataMatrícula AS 'Data da Matrícula', dbo.fc_diaSemana(dataMatrícula) AS 'Dia da Semana' FROM tbMatricula


--Crie uma função que de acordo com a carga horária do curso exiba curso rápido ou curso extenso. (Rápido menos de 1000 horas)
CREATE FUNCTION dbo.fc_tipoCurso(@CargaHoraria INT)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @TipoCurso VARCHAR(20)

    IF @CargaHoraria < 1000
    BEGIN
        SET @TipoCurso = 'Curso Rápido'
    END
    ELSE
    BEGIN
        SET @TipoCurso = 'Curso Extenso'
    END

    RETURN @TipoCurso
END

--Testando
SELECT nomeCurso AS 'Nome do Curso', cargahorariaCurso AS 'Carga Horária',dbo.fc_tipoCurso(cargahorariaCurso) AS 'Tipo do Curso' FROM tbCurso


--Crie uma função que de acordo com o valor do curso exiba  curso caro ou curso barato. (Curso caro acima de 400)
CREATE FUNCTION dbo.fc_valorCurso (@valorCurso REAL)
RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @tipoCurso VARCHAR(20)

	IF @valorCurso>400
	BEGIN
		SET @tipoCurso = 'Curso Caro'
	END
	ELSE
	BEGIN
		SET @tipoCurso = 'Curso Barato'
	END

	RETURN @tipoCurso

END

--Testando
SELECT nomeCurso AS 'Nome do Curso', valorCurso AS 'Valor do Curso', dbo.fc_valorCurso(valorCurso) AS 'Tipo do Curso' FROM tbCurso


--Criar uma função que informada a data da matrícula converta-a no formato dd/mm/aaaa
CREATE FUNCTION dbo.fc_formatarData(@DataMatricula SMALLDATETIME)
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @DataFormatada VARCHAR(10)
    
    
    SET @DataFormatada = FORMAT(@DataMatricula, 'dd/MM/yyyy')

    RETURN @DataFormatada
END

--Testando
SELECT codMatricula AS 'Código da Matrícula',dbo.fc_formatarData(dataMatrícula) AS 'Data da Matrícula Formatada' FROM tbMatricula





