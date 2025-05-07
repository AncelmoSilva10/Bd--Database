USE bdEstoque

UPDATE tbProduto 
	SET valorProduto = valorProduto * 0.1 + valorProduto
	WHERE codFabricante = 1


UPDATE tbProduto 
	SET valorProduto = valorProduto - valorProduto * 0.07
	WHERE codFabricante = 2


UPDATE tbProduto 
	SET quantidadeProduto = quantidadeProduto - 30
	WHERE codFornecedor = 1 


UPDATE tbCliente 
	SET nomeCliente= 'Adriana Nogueira Silva Campos'
	WHERE codCliente = 5 


UPDATE tbVenda
	SET valorTotalVenda = valorTotalVenda - valorTotalVenda * 0.05
	WHERE codVenda <= 4


DELETE tbItensVenda
	WHERE codProduto = 5


UPDATE tbProduto
	SET valorProduto = valorProduto - valorProduto * 0.2
	WHERE quantidadeProduto >1000

UPDATE tbVenda
	SET valorTotalVenda = valorTotalVenda - valorTotalVenda * 0.1
	WHERE codCliente = 3

UPDATE tbProduto
	SET valorProduto = valorProduto * 0.06 + valorProduto
	WHERE codProduto = 5

UPDATE tbProduto
	SET valorProduto = valorProduto * 0.06 + valorProduto
	WHERE codProduto = 7	

UPDATE tbVenda
	SET valorTotalVenda = valorTotalVenda * 0.02 + valorTotalVenda
	WHERE codVenda <= 4
