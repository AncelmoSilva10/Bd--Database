USE bdEstoque

INSERT INTO tbFornecedor(nomeFornecedor,contatoFornecedor)
	VALUES
		('Higas','Rafael Santana')
		,('Rossi','Pedro Rodrigues')
		,('Extra','Ancelmo Silva')

SELECT * FROM tbFornecedor

SELECT tbFornecedor.nomeFornecedor, tbProduto.descricaoProduto FROM tbProduto
	INNER JOIN tbFornecedor ON tbProduto.codFabricante = tbFornecedor.codFornecedor


SELECT tbFornecedor.nomeFornecedor, tbProduto.descricaoProduto FROM tbFornecedor
	LEFT JOIN tbProduto ON tbProduto.codFornecedor = tbFornecedor.codFornecedor


SELECT tbProduto.descricaoProduto, tbFornecedor.nomeFornecedor FROM tbProduto
	RIGHT JOIN tbFornecedor ON tbFornecedor.codFornecedor = tbProduto.codFornecedor


INSERT INTO tbProduto(descricaoProduto,valorProduto,quantidadeProduto)
	VALUES
		('Pão Francês','0.50','30')
		,('Papel Higiênico','24','15')
		,('Biscoito Choco','2.50','20')

SELECT * FROM tbProduto


SELECT tbFornecedor.nomeFornecedor, tbProduto.descricaoProduto FROM tbFornecedor
	FULL JOIN tbProduto ON tbProduto.codFornecedor = tbFornecedor.codFornecedor


SELECT tbFornecedor.nomeFornecedor, tbProduto.descricaoProduto FROM tbFornecedor
	CROSS JOIN tbProduto


SELECT tbProduto.codProduto, tbProduto.descricaoProduto, tbFabricante.nomeFabricante FROM tbFabricante
	INNER JOIN tbProduto ON tbProduto.codFabricante = tbFabricante.codFabricante
	WHERE tbProduto.valorProduto >=36




