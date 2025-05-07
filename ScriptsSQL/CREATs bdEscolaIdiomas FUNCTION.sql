USE bdEscolaIdiomas

--Crie uma fun��o que informada uma data da matr�cula , retorne o dia da semana
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
        SET @DiaSemana = 'TER�A-FEIRA'
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
        SET @DiaSemana = 'S�BADO'
    END

    RETURN @DiaSemana
END

--Testando
SELECT dataMatr�cula AS 'Data da Matr�cula', dbo.fc_diaSemana(dataMatr�cula) AS 'Dia da Semana' FROM tbMatricula


--Crie uma fun��o que de acordo com a carga hor�ria do curso exiba curso r�pido ou curso extenso. (R�pido menos de 1000 horas)
CREATE FUNCTION dbo.fc_tipoCurso(@CargaHoraria INT)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @TipoCurso VARCHAR(20)

    IF @CargaHoraria < 1000
    BEGIN
        SET @TipoCurso = 'Curso R�pido'
    END
    ELSE
    BEGIN
        SET @TipoCurso = 'Curso Extenso'
    END

    RETURN @TipoCurso
END

--Testando
SELECT nomeCurso AS 'Nome do Curso', cargahorariaCurso AS 'Carga Hor�ria',dbo.fc_tipoCurso(cargahorariaCurso) AS 'Tipo do Curso' FROM tbCurso


--Crie uma fun��o que de acordo com o valor do curso exiba  curso caro ou curso barato. (Curso caro acima de 400)
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


--Criar uma fun��o que informada a data da matr�cula converta-a no formato dd/mm/aaaa
CREATE FUNCTION dbo.fc_formatarData(@DataMatricula SMALLDATETIME)
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @DataFormatada VARCHAR(10)
    
    
    SET @DataFormatada = FORMAT(@DataMatricula, 'dd/MM/yyyy')

    RETURN @DataFormatada
END

--Testando
SELECT codMatricula AS 'C�digo da Matr�cula',dbo.fc_formatarData(dataMatr�cula) AS 'Data da Matr�cula Formatada' FROM tbMatricula





