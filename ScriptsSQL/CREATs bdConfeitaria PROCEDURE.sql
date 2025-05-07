USE bdConfeitaria

--Criar uma Stored Procedure para inserir as categorias de produto conforme abaixo
CREATE PROCEDURE Insere_Categoria
	@nomeCategoriaProduto VARCHAR(50)
AS
BEGIN
	INSERT INTO tbCategoriaProduto(nomeCategoriaProduto)
	VALUES(@nomeCategoriaProduto)
END

EXEC Insere_Categoria
	@nomeCategoriaProduto = 'Bolo Festa'

EXEC Insere_Categoria
	@nomeCategoriaProduto = 'Bolo Simples'

EXEC Insere_Categoria
	@nomeCategoriaProduto = 'Torta'

EXEC Insere_Categoria
	@nomeCategoriaProduto = 'Salgado'
	
SELECT * FROM tbCategoriaProduto


--Criar uma Stored Procedure para inserir os produtos abaixo, sendo que, a procedure deverá antes de inserir verificar se o nome do produto já existe, evitando assim que um produto seja duplicado:
CREATE PROCEDURE Insere_Produto
	@nomeProduto VARCHAR(200),
	@precoKiloProduto REAL,
	@codCategoriaProduto INT
AS
BEGIN
	IF EXISTS(SELECT 1 FROM tbProduto WHERE nomeProduto = @nomeProduto)
	BEGIN
		PRINT 'O Produto já existe no sistema.'
	END
	ELSE
	BEGIN
		INSERT INTO tbProduto(nomeProduto,precoKiloProduto,codCategoriaProduto)
		VALUES(@nomeProduto,@precoKiloProduto,@codCategoriaProduto)
		    PRINT 'Produto inserido com exito.'
    END
END

EXEC Insere_Produto
	@nomeProduto = 'Bolo Floresta Negra',
	@precoKiloProduto = 42.00,
	@codCategoriaProduto = 1

EXEC Insere_Produto
	@nomeProduto = 'Bolo Prestígio',
	@precoKiloProduto = 43.00,
	@codCategoriaProduto = 1

EXEC Insere_Produto
	@nomeProduto = 'Bolo Nutella',
	@precoKiloProduto = 44.00,
	@codCategoriaProduto = 1

EXEC Insere_Produto
	@nomeProduto = 'Bolo Formigueiro',
	@precoKiloProduto = 17.00,
	@codCategoriaProduto = 2

EXEC Insere_Produto
	@nomeProduto = 'Bolo de Cenoura',
	@precoKiloProduto = 19.00,
	@codCategoriaProduto = 2

EXEC Insere_Produto
	@nomeProduto = 'Torta de Palmito',
	@precoKiloProduto = 45.00,
	@codCategoriaProduto = 3

EXEC Insere_Produto
	@nomeProduto = 'Torta de Frango e catupiry',
	@precoKiloProduto = 47.00,
	@codCategoriaProduto = 3

EXEC Insere_Produto
	@nomeProduto = 'Torta de escarola',
	@precoKiloProduto = 44.00,
	@codCategoriaProduto = 3

EXEC Insere_Produto
	@nomeProduto = 'Coxinha Frango',
	@precoKiloProduto = 25.00,
	@codCategoriaProduto = 4

EXEC Insere_Produto
	@nomeProduto = 'Esfiha Carne',
	@precoKiloProduto = 27.00,
	@codCategoriaProduto = 4

EXEC Insere_Produto
	@nomeProduto = 'Folhado queijo',
	@precoKiloProduto = 31.00,
	@codCategoriaProduto = 4

EXEC Insere_Produto
	@nomeProduto = 'Risoles misto',
	@precoKiloProduto = 29.00,
	@codCategoriaProduto = 4

SELECT * FROM tbProduto


--Criar uma stored procedure para cadastrar os clientes abaixo relacionados, sendo que deverão ser feitas duas validações
CREATE PROCEDURE Insere_CadastrarCliente
    @nomeCliente VARCHAR(250),
    @dataNascimentoCliente DATE,
    @ruaCliente VARCHAR(80),
    @ruaCasaCliente VARCHAR(80),
    @cepCliente VARCHAR(8),
    @bairroCliente VARCHAR(50),
    @cidadeCliente VARCHAR(50),
    @estadoCliente CHAR(2),
    @cpfCliente CHAR(11),
    @sexoCliente CHAR(2)
AS
BEGIN

    IF EXISTS (SELECT 1 FROM tbCliente WHERE cpfCliente = @cpfCliente)
    BEGIN
        PRINT 'Cliente CPF ' + @cpfCliente + ' já cadastrado'
    END
    ELSE
    BEGIN
        -- Verifica se o bairro é Itaquera ou Guaianases
        IF @bairroCliente NOT IN ('Itaquera', 'Guaianases')
        BEGIN
            PRINT 'Não foi possível cadastrar o cliente ' + @nomeCliente + ' pois o bairro ' + @bairroCliente + ' não é atendido pela confeitaria'
        END
        ELSE
        BEGIN
            -- Se as validações passarem, insere o cliente na tabela
            INSERT INTO tbCliente (nomeCliente, dataNascimentoCliente, ruaCliente, ruaCasaCliente, cepCliente, bairroCliente, cidadeCliente, estadoCliente, cpfCliente, sexoCliente)
            VALUES (@nomeCliente, @dataNascimentoCliente, @ruaCliente, @ruaCasaCliente, @cepCliente, @bairroCliente, @cidadeCliente, @estadoCliente, @cpfCliente, @sexoCliente)

            PRINT 'Cliente cadastrado com sucesso'
        END
    END
END

EXEC Insere_CadastrarCliente 
    @nomeCliente = 'Samira Fatah',
    @dataNascimentoCliente = '1990-05-05',
    @ruaCliente = 'Rua Aguapeí',
    @ruaCasaCliente = '1000',
    @cepCliente = '08.090-000',
    @bairroCliente = 'Guaianases',
    @cidadeCliente = 'São Paulo',
    @estadoCliente = 'SP',
    @cpfCliente = '08.090-000',   
    @sexoCliente = 'F'

EXEC Insere_CadastrarCliente
    @nomeCliente = 'Celia Nogueira',
    @dataNascimentoCliente = '1992-06-06',
    @ruaCliente = 'Rua Andes',
    @ruaCasaCliente = '234',
    @cepCliente = '08.456-090',
    @bairroCliente = 'Guaianases',
    @cidadeCliente = 'São Paulo',
    @estadoCliente = 'SP',
    @cpfCliente = '08.456-090',  
    @sexoCliente = 'F'

EXEC Insere_CadastrarCliente
    @nomeCliente = 'Paulo Cesar Siqueira',
    @dataNascimentoCliente = '1984-04-04',
    @ruaCliente = 'Rua Castelo do Piauí',
    @ruaCasaCliente = '232',
    @cepCliente = '08.109-000',
    @bairroCliente = 'Itaquera',
    @cidadeCliente = 'São Paulo',
    @estadoCliente = 'SP',
    @cpfCliente = '08.109-000',   
    @sexoCliente = 'M'

EXEC Insere_CadastrarCliente
    @nomeCliente = 'Rodrigo Favoroni',
    @dataNascimentoCliente = '1991-04-09',
    @ruaCliente = 'Rua Sansão Castelo Branco',
    @ruaCasaCliente = '10',
    @cepCliente = '08.431-090',
    @bairroCliente = 'Guaianases',
    @cidadeCliente = 'São Paulo',
    @estadoCliente = 'SP',
    @cpfCliente = '08.431-090',  
    @sexoCliente = 'M'

EXEC Insere_CadastrarCliente 
    @nomeCliente = 'Flávia Regina Brito',
    @dataNascimentoCliente = '1992-04-22',
    @ruaCliente = 'Rua Mariano Moro',
    @ruaCasaCliente = '300',
    @cepCliente = '08.200-123',
    @bairroCliente = 'Itaquera',
    @cidadeCliente = 'São Paulo',
    @estadoCliente = 'SP',
    @cpfCliente = '08.200-123',  
    @sexoCliente = 'F'

SELECT * FROM tbCliente




--Criar via stored procedure as encomendas abaixo relacionadas, fazendo as verificações abaixo: 
CREATE PROCEDURE Insere_Encomenda
    @codCliente INT,
    @dataEncomenda DATE,
    @dataEntregaEncomenda DATE,
    @valorTotalEncomenda REAL
AS
BEGIN
    DECLARE @cpfCliente CHAR(11)
    DECLARE @nomeCliente VARCHAR(250)
    DECLARE @codEncomenda INT

    SELECT @cpfCliente = cpfCliente, @nomeCliente = nomeCliente 
    FROM tbCliente
    WHERE codCliente = @codCliente

    IF @cpfCliente IS NULL
    BEGIN
        PRINT 'Não foi possível efetivar a encomenda pois o cliente com código ' + CONVERT(VARCHAR(10), @codCliente) + ' não está cadastrado'
    END
    ELSE
    BEGIN
        IF @dataEntregaEncomenda < @dataEncomenda
        BEGIN
            PRINT 'Não é possível entregar uma encomenda antes da encomenda ser realizada'
        END
        ELSE
        BEGIN
            INSERT INTO tbEncomenda (codCliente, dataEncomenda, valorTotalEncomenda, dataEntregaEncomenda)
            VALUES (@codCliente, @dataEncomenda, @valorTotalEncomenda, @dataEntregaEncomenda)

            SELECT @codEncomenda = MAX(codEncomenda) FROM tbEncomenda 
            WHERE codCliente = @codCliente

            PRINT 'Encomenda ' + CONVERT(VARCHAR(10), @codEncomenda) + ' para o cliente ' + @nomeCliente + ' (CPF: ' + @cpfCliente + ') efetuada com sucesso'
        END
    END
END


EXEC Insere_Encomenda 
	@codCliente = 1,
	@dataEncomenda = '08/08/2015',
	@valorTotalEncomenda = '450.00',
	@dataEntregaEncomenda = '15/08/2015'

EXEC Insere_Encomenda
	@codCliente = 2,
	@dataEncomenda = '10/10/2015',
	@valorTotalEncomenda = '200.00',
	@dataEntregaEncomenda = '15/10/2015'

EXEC Insere_Encomenda
	@codCliente = 3,
	@dataEncomenda = '10/10/2015',
	@valorTotalEncomenda = '150.00',
	@dataEntregaEncomenda = '10/12/2015'

EXEC Insere_Encomenda
	@codCliente = 1,
	@dataEncomenda = '06/10/2015',
	@valorTotalEncomenda = '250.00',
	@dataEntregaEncomenda = '12/10/2015'

EXEC Insere_Encomenda
	@codCliente = 4,
	@dataEncomenda = '05/10/2015',
	@valorTotalEncomenda = '150.00',
	@dataEntregaEncomenda = '12/10/2015'

SELECT * FROM tbEncomenda

--Ao adicionar a encomenda, criar uma Stored procedure, para que sejam inseridos os itens da encomenda conforme tabela a seguir. 
CREATE PROCEDURE Insere_ItensEncomenda
    @codEncomenda INT,
    @codProduto INT,
    @quantidadeKilos REAL,
    @subTotal REAL
AS
BEGIN
    INSERT INTO tbItensEncomenda (codEncomenda, codProduto, quantidadeKilos, subTotal)
    VALUES (@codEncomenda, @codProduto, @quantidadeKilos, @subTotal)

    PRINT 'Item inserido com sucesso na encomenda!'
END

EXEC Insere_ItensEncomenda
    @codEncomenda = 1,
    @codProduto = 1,
    @quantidadeKilos = 2.5,
    @subTotal = 105.00

EXEC Insere_ItensEncomenda
    @codEncomenda = 1,
    @codProduto = 10,
    @quantidadeKilos = 2.6,
    @subTotal = 70.00

EXEC Insere_ItensEncomenda
    @codEncomenda = 1,
    @codProduto = 9,
    @quantidadeKilos = 6,
    @subTotal = 150.00

EXEC Insere_ItensEncomenda
    @codEncomenda = 1,
    @codProduto = 12,
    @quantidadeKilos = 4.3,
    @subTotal = 125.00

EXEC Insere_ItensEncomenda
    @codEncomenda = 2,
    @codProduto = 9,
    @quantidadeKilos = 8,
    @subTotal = 200.00

EXEC Insere_ItensEncomenda
    @codEncomenda = 3,
    @codProduto = 11,
    @quantidadeKilos = 3.2,
    @subTotal = 100.00

EXEC Insere_ItensEncomenda
    @codEncomenda = 3,
    @codProduto = 2,
    @quantidadeKilos = 2,
    @subTotal = 50.00

EXEC Insere_ItensEncomenda
    @codEncomenda = 4,
    @codProduto = 3,
    @quantidadeKilos = 3.5,
    @subTotal = 150.00

EXEC Insere_ItensEncomenda
    @codEncomenda = 4,
    @codProduto = 3,
    @quantidadeKilos = 2.2,
    @subTotal = 100.00

EXEC Insere_ItensEncomenda
    @codEncomenda = 5,
    @codProduto = 6,
    @quantidadeKilos = 3.4,
    @subTotal = 150.00

SELECT * FROM tbItensEncomenda


--Após todos os cadastros, criar Stored procedures para alterar o que se pede: 
--O preço dos produtos da categoria “Bolo festa” sofreram um aumento de 10% 
CREATE PROCEDURE AumentarPrecoBoloFesta
AS
BEGIN
    UPDATE tbProduto
    SET precoKiloProduto = precoKiloProduto * 1.10
    WHERE codCategoriaProduto = 1
END

--O preço dos produtos categoria “Bolo simples” estão em promoção e terão um desconto de 20%; 
CREATE PROCEDURE DescontarPrecoBoloSimples
AS
BEGIN
    UPDATE tbProduto
    SET precoKiloProduto = precoKiloProduto * 0.80
    WHERE codCategoriaProduto = 2 
END


--O preço dos produtos categoria “Torta” aumentaram 25% 
CREATE PROCEDURE AumentarPrecoTorta
AS
BEGIN
    UPDATE tbProduto
    SET precoKiloProduto = precoKiloProduto * 1.25
    WHERE codCategoriaProduto = 3
END

--O preço dos produtos categoria “Salgado”, com exceção da esfiha de carne, sofreram um aumento de 20%
CREATE PROCEDURE AumentarPrecoSalgadoExcetoEsfihaCarne
AS
BEGIN
    UPDATE tbProduto
    SET precoKiloProduto = precoKiloProduto * 1.20
    WHERE codCategoriaProduto = 4 
    AND nomeProduto <> 'Esfiha de carne'
END

-- Execute a stored procedure para aumentar o preço dos produtos da categoria “Bolo festa” em 10%
EXEC AumentarPrecoBoloFesta

-- Execute a stored procedure para aplicar um desconto de 20% nos produtos da categoria “Bolo simples”
EXEC DescontarPrecoBoloSimples

-- Execute a stored procedure para aumentar o preço dos produtos da categoria “Torta” em 25%
EXEC AumentarPrecoTorta

-- Execute a stored procedure para aumentar o preço dos produtos da categoria “Salgado”, exceto esfiha de carne, em 20%
EXEC AumentarPrecoSalgadoExcetoEsfihaCarne


SELECT * FROM tbProduto


--Criar uma procedure para excluir clientes pelo CPF sendo que:
CREATE PROCEDURE Excluir_Cliente_Por_CPF
    @cpfCliente CHAR(11)
AS
BEGIN
    DECLARE @nomeCliente VARCHAR(250)
    DECLARE @encomendaQuantidade INT

    -- Obter o nome do cliente com base no CPF
    SELECT @nomeCliente = nomeCliente FROM tbCliente 
    WHERE cpfCliente = @cpfCliente

    -- Verificar a quantidade de encomendas do cliente
    SELECT @encomendaQuantidade = COUNT(*) FROM tbEncomenda
    INNER JOIN tbCliente ON tbEncomenda.codCliente = tbCliente.codCliente
    WHERE tbCliente.cpfCliente = @cpfCliente

    IF @nomeCliente IS NULL
    BEGIN
        PRINT 'Cliente com CPF ' + @cpfCliente + ' não encontrado.'
    END
    ELSE IF @encomendaQuantidade > 0
    BEGIN
        PRINT 'Impossível remover esse cliente pois o cliente ' + @nomeCliente + ' possui encomendas.'
    END
    ELSE
    BEGIN
        DELETE FROM tbCliente 
        WHERE cpfCliente = @cpfCliente

        PRINT 'Cliente ' + @nomeCliente + ' removido com sucesso.'
    END
END

--EXEMPLO
EXEC Excluir_Cliente_Por_CPF @cpfCliente = '08.090-000'


--Criar uma procedure que permita excluir qualquer item de uma encomenda
CREATE PROCEDURE Excluir_Item_Encomenda
    @codEncomenda INT,
    @codProduto INT
AS
BEGIN
    DECLARE @dataEntregaEncomenda DATE
    DECLARE @subTotalItem REAL
    
    -- Verificar a data de entrega da encomenda
    SELECT @dataEntregaEncomenda = dataEntregaEncomenda 
    FROM tbEncomenda 
    WHERE codEncomenda = @codEncomenda

    -- Verificar se a data de entrega é maior que a data atual
    IF @dataEntregaEncomenda > GETDATE() -- Fiz para Pegar a Data Atual da Maquina
    BEGIN
        -- Obter o valor do item a ser removido
        SELECT @subTotalItem = subTotal 
        FROM tbItensEncomenda 
        WHERE codEncomenda = @codEncomenda AND codProduto = @codProduto

        -- Remover o item da encomenda
        DELETE FROM tbItensEncomenda 
        WHERE codEncomenda = @codEncomenda AND codProduto = @codProduto

        -- Atualizar o valor total da encomenda
        UPDATE tbEncomenda 
        SET valorTotalEncomenda = valorTotalEncomenda - @subTotalItem 
        WHERE codEncomenda = @codEncomenda

        PRINT 'Item removido com sucesso e valor da encomenda atualizado.'
    END
    ELSE
    BEGIN
        PRINT 'Não é possível remover itens de encomendas cuja data de entrega já passou ou é hoje.'
    END
END

--EXEMPLO
EXEC Excluir_Item_Encomenda 
    @codEncomenda = 1, 
    @codProduto = 1













