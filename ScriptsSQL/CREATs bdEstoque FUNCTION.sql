USE bdEstoque

--Criar uma fun��o que retorne o dia de semana da venda (no formato segunda, ter�a, etc) ao lado do c�digo da venda, valor total da venda e sua data
CREATE FUNCTION dbo.fc_diaSemana(@Data DATE)
RETURNS VARCHAR(40) 
AS
BEGIN
    DECLARE @DiaSemana VARCHAR(40)
    DECLARE @Dia INT

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


    RETURN  @DiaSemana

END

--Testando
SELECT dbo.fc_diaSemana(dataVenda) 'Dia da Venda', dataVenda AS 'Data Venda',  codVenda, valorTotalVenda FROM tbVenda


--Criar uma fun��o que receba o c�digo do cliente e retorne o total de vendas que o cliente j� realizou
CREATE FUNCTION dbo.fc_TotalVendasPorCliente(@CodCliente INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalVendas INT

    SELECT @TotalVendas = COUNT(*) FROM tbVenda
		WHERE codCliente = @CodCliente

    RETURN @TotalVendas
END

--Testando
SELECT dbo.fc_TotalVendasPorCliente(codCliente) AS 'Total de Vendas pelo Codigo do Cliente EM ORDEM' FROM tbVenda


--Criar uma fun��o que receba o c�digo de um vendedor e o m�s e informe o total de vendas do vendedor no m�s informado
CREATE FUNCTION dbo.fc_TotalVendasPorFornecedorEMes (@CodigoFornecedor INT,@Mes INT,@Ano INT)
RETURNS REAL
AS
BEGIN
    DECLARE @TotalVendas REAL

    SELECT @TotalVendas = SUM(tbVenda.valorTotalVenda) FROM tbVenda
		INNER JOIN tbItensVenda ON tbVenda.codVenda = tbItensVenda.codVenda
		INNER JOIN tbProduto ON tbItensVenda.codProduto = tbProduto.codProduto
			WHERE tbProduto.codFornecedor = @CodigoFornecedor
			 AND MONTH(tbVenda.dataVenda) = @Mes
			 AND YEAR(tbVenda.dataVenda) = @Ano

    RETURN @TotalVendas
END

--Testando
DECLARE @CodigoFornecedor INT = 1  
DECLARE @Mes INT = 5            
DECLARE @Ano INT = 2014          

SELECT dbo.fc_TotalVendasPorFornecedorEMes(@CodigoFornecedor, @Mes, @Ano) AS TotalVendas


--Criar uma fun��o que usando o bdEstoque diga se o cpf do cliente � ou n�o v�lido
CREATE FUNCTION dbo.cpf_valido (@CPF VARCHAR(11))
RETURNS CHAR(1)
AS
BEGIN
    DECLARE @INDICE INT,
            @SOMA INT,
            @DIG1 INT,
            @DIG2 INT,
            @CPF_TEMP VARCHAR(11),
            @DIGITOS_IGUAIS CHAR(1),
            @RESULTADO CHAR(1);

    SET @RESULTADO = 'N';
    SET @DIGITOS_IGUAIS = 'S';
    
    -- Verificando se o CPF tem 11 d�gitos
    IF LEN(@CPF) <> 11
    BEGIN
        RETURN @RESULTADO;  -- Retorna 'N' se o CPF n�o tiver 11 d�gitos
    END

    -- Verificando se os d�gitos s�o iguais
    SET @CPF_TEMP = SUBSTRING(@CPF, 1, 1);
    SET @INDICE = 2;  -- Come�a a partir do segundo d�gito

    WHILE (@INDICE <= 11)
    BEGIN
        IF SUBSTRING(@CPF, @INDICE, 1) <> @CPF_TEMP
            SET @DIGITOS_IGUAIS = 'N';
        SET @INDICE = @INDICE + 1;
    END

    -- Caso os d�gitos n�o sejam todos iguais, come�o o c�lculo dos d�gitos
    IF @DIGITOS_IGUAIS = 'N' 
    BEGIN
        -- C�lculo do 1� d�gito
        SET @SOMA = 0;
        SET @INDICE = 1;

        WHILE (@INDICE <= 9)
        BEGIN
            SET @SOMA = @SOMA + CONVERT(INT, SUBSTRING(@CPF, @INDICE, 1)) * (11 - @INDICE);
            SET @INDICE = @INDICE + 1;
        END

        SET @DIG1 = 11 - (@SOMA % 11);
        IF @DIG1 > 9
            SET @DIG1 = 0; 

        -- C�lculo do 2� d�gito
        SET @SOMA = 0;
        SET @INDICE = 1;

        WHILE (@INDICE <= 10)
        BEGIN
            SET @SOMA = @SOMA + CONVERT(INT, SUBSTRING(@CPF, @INDICE, 1)) * (12 - @INDICE);
            SET @INDICE = @INDICE + 1;
        END

        SET @DIG2 = 11 - (@SOMA % 11);
        IF @DIG2 > 9
            SET @DIG2 = 0; 

        -- Validando
        IF (@DIG1 = SUBSTRING(@CPF, LEN(@CPF) - 1, 1)) AND (@DIG2 = SUBSTRING(@CPF, LEN(@CPF), 1))
            SET @RESULTADO = 'S';
        ELSE
            SET @RESULTADO = 'N';
    END

    RETURN @RESULTADO;
END

--Testando
SELECT nomeCliente AS 'Nome Cliente', dbo.cpf_valido(cpfCliente) 'CPF do Cliente' FROM tbCliente
