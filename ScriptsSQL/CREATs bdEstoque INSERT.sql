USE bdEstoque

INSERT INTO tbCliente (nomeCliente, cpfCliente, emailCliente, SexoCliente, dataNascimentoCliente)

	VALUES
		('Amando Jos� Santana','12345678900','amandojsantana@outlook.com','m','1961-02-21 00:00:00')
		,('Sheila Carvalho Leal','45678909823','scarvalho@g.com.br','f','1978-09-13 00:00:00')
		,('Carlos Henrique Souza','76598278299','cherique@g.com.br','m','1981-09-08 00:00:00')
		,('Maria Aparecida Souza','87365309899','mapdasouza@outlook.com','m','1962-07-07 00:00:00')
		,('Adriana Nogueira Silva','76354309388','drica1977@g.com.br','f','1977-04-09 00:00:00')
		,('Paulo Henrique Silva','873901231141','phsilva80@hotmail.com','m','1987-02-02 00:00:00')

SELECT * FROM tbCliente


INSERT INTO tbFabricante(nomeFabricante)
	
	VALUES
		('Unilever')
		,('P&G')
		,('Bunge')

SELECT * FROM tbFabricante


INSERT INTO tbFornecedor(nomeFornecedor,contatoFornecedor)
	
	VALUES
		('Atacad�o' , 'Carlos Santos')
		,('Assai', 'Maria Stella')
		,('Rold�o','Paulo C�sar')

SELECT * FROM tbFornecedor


INSERT INTO tbProduto(descricaoProduto,valorProduto,quantidadeProduto,codFabricante,codFornecedor)
	
	VALUES
	('Amaciante Downy','5.76','1500','2','1')
	,('Amaciante Confort','5.45','2300','1','1')
	,('Sab�o em P� OMO','5.99','1280','1','2')
	,('Margarina Qualy','4.76','2500','3','1')
	,('Salsicha Hot Dog Sadia','6.78','2900','3','2')
	,('Mortadela Perdig�o','2.50','1200','3','3')
	,('Hamburguer Sadia','9.89','1600','3','1')
	,('Fralda Pampers','36.00','340','2','3')
	,('Xampu Seda','5.89','800','1','2')
	,('Condicionador Seda','6.50','700','1','3')

SELECT * FROM tbProduto


INSERT INTO tbVenda(dataVenda,valorTotalVenda,codCliente)

	VALUES
		('01/02/2014','4500.00','1')
		,('03/02/2014','3400.00','1')
		,('10/02/2014','2100.00','2')
		,('15/02/2014','2700.00','3')
		,('17/03/2014','560.00','3')
		,('09/04/2014','1200.00','4')
		,('07/05/2014','3500.00','5')
		,('07/05/2014','3400.00','1')
		,('05/05/2014','4000.00','2')

SELECT * FROM tbVenda

INSERT INTO tbItensVenda(codVenda,codProduto,quantidadeItensVenda,subTotalItensVenda)

	VALUES
		('1','1','200','1500.00')
		,('1','2','300','3000.00')
		,('2','4','120','1400.00')
		,('2','2','200','1000.00')
		,('2','3','130','1000.00')
		,('3','5','200','2100.00')
		,('4','4','120','1000.00')
		,('4','5','450','700.00')
		,('5','5','200','560.00')
		,('6','7','200','600.00')
		,('6','6','300','600.00')
		,('8','1','300','2500.00')
		,('8','2','200','1000.00')
		,('9','6','250','1700.00')
		,('9','5','200','1700.00')
		,('9','4','1000','4000.00')

SELECT * FROM tbItensVenda
