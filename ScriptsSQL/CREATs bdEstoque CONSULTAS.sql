USE bdEstoque

--Criar uma consulta que retorne o código do produto, o nome do produto e o nome do fabricante somente daqueles produtos que custam igual ao valor mais alto
SELECT tbProduto.codProduto, tbProduto.descricaoProduto, tbFabricante.nomeFabricante  FROM tbProduto
	INNER JOIN tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante
	WHERE tbProduto.valorProduto = (SELECT MAX(tbProduto.valorProduto) FROM tbProduto)


--Criar uma consulta que retorne o nome do produto e o nome do fabricante e o valor somente dos produtos que custem acima do valor médio dos produtos em estoque
SELECT tbProduto.descricaoProduto, tbProduto.valorProduto, tbFabricante.nomeFabricante FROM tbProduto
	INNER JOIN tbFabricante ON tbProduto.codFabricante = tbFabricante.codFabricante
	WHERE tbProduto.valorProduto > (SELECT AVG(tbProduto.valorProduto) FROM tbProduto) 


--Criar uma consulta que retorne o nome dos clientes que tiveram vendas com valor acima do valor médio das vendas
SELECT tbCliente.nomeCliente FROM tbVenda
	INNER JOIN tbCliente ON tbVenda.codCliente = tbCliente.codCliente
	WHERE tbVenda.valorTotalVenda > (SELECT AVG(tbVenda.valorTotalVenda) FROM tbVenda)


--Criar uma consulta que retorno o nome e o preço dos produtos mais caros
SELECT descricaoProduto, valorProduto FROM tbProduto
	WHERE valorProduto = (SELECT MAX(valorProduto) FROM tbProduto)


--Criar uma consulta que retorne o nome e o preço do produto mais barato
SELECT descricaoProduto, valorProduto FROM tbProduto
	WHERE valorProduto = (SELECT MIN(valorProduto) FROM tbProduto)