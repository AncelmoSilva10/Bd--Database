USE bdEstoque

SELECT SUM(valorProduto) 'Soma total P&G' FROM tbProduto
	WHERE codFabricante = 02


SELECT AVG(valorProduto) 'M�dia pre�o P&G' FROM tbProduto
	WHERE codFabricante = 02


SELECT SUM(valorProduto) 'Soma total Unilever' FROM tbProduto
	WHERE codFabricante = 1


SELECT AVG(valorProduto) 'M�dia pre�o Bunge' FROM tbProduto
	WHERE codFabricante = 3


SELECT SUM(quantidadeProduto)  'Qtde total da Bungue' FROM tbProduto
	WHERE codFabricante = 3


SELECT AVG(valorProduto) 'M�dia pre�o Unilever' FROM tbProduto
	WHERE codFabricante = 1


SELECT AVG(quantidadeProduto) 'M�dia total da qtde da P&G' FROM tbProduto
	WHERE codFabricante = 2


SELECT AVG(quantidadeProduto) 'M�dia dos Produtos em Estoque abaixo de 200' FROM tbProduto
	WHERE quantidadeProduto < 200


SELECT AVG(quantidadeProduto) 'M�dia dos Produtos Unilever' FROM tbProduto
	WHERE codFabricante = 1


SELECT SUM(valorTotalVenda) 'Soma da Venda entre Fev e Mar 2014' FROM tbVenda
	WHERE codVenda BETWEEN 1 AND 5


SELECT SUM(quantidadeProduto) 'Soma da Qtde de Amaciantes' FROM tbProduto
	WHERE descricaoProduto LIKE '%Amaciante%' 


SELECT MAX(valorProduto) 'Valor do Produto mais Caro' FROM tbProduto


SELECT MIN(valorProduto) 'Valor do Produto mais Barato' FROM tbProduto


SELECT AVG(quantidadeProduto) 'Pre�o m�dio dos Amaciantes' FROM tbProduto
	WHERE descricaoProduto LIKE '%Amaciante%' 


SELECT COUNT(descricaoProduto) 'Quanto Itens Diferentes existe no Estoque' FROM tbProduto


SELECT COUNT(descricaoProduto) 'Quanto Itens s�o da Unilever' FROM tbProduto
	WHERE codFabricante = 1


SELECT COUNT(descricaoProduto) 'Quanto Itens n�o s�o da Unilever' FROM tbProduto
	WHERE codFabricante != 1


SELECT SUM(quantidadeProduto) 'A soma da qtde de Produtos acima de 800' FROM tbProduto
	WHERE quantidadeProduto > 800


SELECT AVG(valorProduto) 'O pre�o m�dio dos Produtos acima de 1000 no estoque da Unilever' FROM tbProduto
	WHERE quantidadeProduto > 1000 AND codFabricante = 1


SELECT AVG(valorTotalVenda) 'A m�dia de Vendas ocorridas em 2014' FROM tbVenda
