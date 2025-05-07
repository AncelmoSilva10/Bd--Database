USE bdEstoque

SELECT descricaoProduto, nomeFabricante FROM tbProduto
	INNER JOIN tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante


SELECT descricaoProduto, nomeFornecedor FROM tbProduto
	INNER JOIN tbFornecedor ON tbProduto.codFornecedor = tbFornecedor.codFornecedor


SELECT SUM(quantidadeProduto) 'Quantidade de Produtos ', nomeFabricante FROM tbProduto
	INNER JOIN tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante
		GROUP BY nomeFabricante


SELECT valorTotalVenda, nomeCliente FROM tbVenda
	INNER JOIN tbCliente ON tbVenda.codCliente = tbCliente.codCliente


SELECT AVG(valorProduto) 'Média dos Preços dos Produtos', nomeFornecedor FROM tbProduto
	INNER JOIN tbFornecedor ON tbProduto.codFornecedor = tbFornecedor.codFornecedor
	GROUP BY nomeFornecedor


SELECT SUM(valorTotalVenda) 'Valor Total de Vendas', nomeCliente FROM tbVenda
	INNER JOIN tbCliente ON tbVenda.codCliente = tbVenda.codVenda
	GROUP BY nomeCliente
	ORDER BY nomeCliente


SELECT SUM(valorProduto) 'Soma dos Preços dos Produtos', nomeFabricante FROM tbProduto
	INNER JOIN tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante
	GROUP BY nomeFabricante


SELECT AVG(valorProduto) 'Média dos Preços dos Produtos ', nomeFornecedor FROM tbProduto
	INNER JOIN tbFornecedor ON tbProduto.codFornecedor = tbFornecedor.codFornecedor
	GROUP BY nomeFornecedor


SELECT SUM(valorTotalVenda) 'Soma Total de Vendas', tbProduto.descricaoProduto FROM tbVenda
	INNER JOIN tbItensVenda ON tbVenda.codVenda = tbItensVenda.codVenda
	INNER JOIN tbProduto ON tbItensVenda.codProduto = tbProduto.codProduto
	GROUP BY descricaoProduto


SELECT SUM(valorTotalVenda) 'Soma Total de Vendas', nomeCliente FROM tbVenda
	INNER JOIN tbCliente ON tbVenda.codCliente =tbCliente.codCliente
	WHERE MONTH(tbVenda.dataVenda) = 2
	GROUP BY nomeCliente