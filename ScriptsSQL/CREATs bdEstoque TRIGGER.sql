USE bdEstoque

--Exercicio 1
CREATE TRIGGER tgAtualizaQuantidadeProdutoVenda
ON tbItensVenda
AFTER INSERT
AS
BEGIN
    -- Atualiza a quantidade do produto na tabela tbProduto
    UPDATE tbProduto
    SET tbProduto.quantidadeProduto = tbProduto.quantidadeProduto - inserted.quantidadeItensVenda FROM tbProduto
    INNER JOIN inserted ON tbProduto.codProduto = inserted.codProduto
END

--TESTANDO
--INSERINDO VENDA PARA O CLIENTE DE COD 1
INSERT INTO tbVenda (dataVenda, valorTotalVenda, codCliente)
VALUES (GETDATE(), 500.00, 1)

SELECT * FROM tbVenda

--INSERINDO ITEM (QUANTIDADE) DA VENDA QUE É O COD=1 AMACIANTE
INSERT INTO tbItensVenda (codVenda, codProduto, quantidadeItensVenda, subTotalItensVenda)
VALUES (1, 1, 100, 576.00)--VENDENDO 100

SELECT * FROM tbItensVenda

--VERIFICANDO NA TABELAA PRODUTO
SELECT * FROM tbProduto WHERE codProduto = 1

--------------------------------------------------

--EXERCICIO 2
CREATE TRIGGER tgAtualizaQuantidadeProdutoEntrada
ON tbEntradaProduto
AFTER INSERT
AS
BEGIN
    -- Atualiza a quantidade do produto na tabela tbProduto
    UPDATE tbProduto
    SET tbProduto.quantidadeProduto = tbProduto.quantidadeProduto + inserted.quantidadeEntradaProduto FROM tbProduto
    INNER JOIN inserted ON tbProduto.codProduto = inserted.codProduto
END

--INSERINDO UMA NOVA ENTRADA DE PRODUTO EXISTENTE (AMACIANTE = COD 1)
INSERT INTO tbEntradaProduto (dataEntradaProduto, codProduto, quantidadeEntradaProduto)
VALUES (GETDATE(), 1, 100) --COLOCANDO 100

SELECT * FROM tbEntradaProduto

--VERIFICANDO NA TABLELA PRODUTO O ESTOQUE
SELECT * FROM tbProduto WHERE codProduto = 1


--------------------------------------------

--EXERCICIO 3
CREATE TRIGGER tgInsertSaidaProduto
ON tbItensVenda
AFTER INSERT
AS
BEGIN
    -- Inserir uma nova saída de produto na tabela tbSaidaProduto
    INSERT INTO tbSaidaProduto (dataSaidaProduto, codProduto, quantidadeSaidaProduto)
    SELECT GETDATE(), inserted.codProduto, inserted.quantidadeItensVenda FROM inserted
END

--INSERINDO VENDA DO PRODUTO AMACIANTE COD 1
INSERT INTO tbItensVenda (codVenda, codProduto, quantidadeItensVenda, subTotalItensVenda)
VALUES (1, 1, 50, 288.00)--VENDA DE 50

SELECT * FROM tbItensVenda

--VERIFICANDO
SELECT * FROM tbSaidaProduto









