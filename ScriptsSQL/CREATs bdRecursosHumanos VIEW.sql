USE bdRecursosHumanos;


--Criar uma view para exibir a quantidade de funcionários por nome de departamento
CREATE VIEW vwQtdFunc_Departamento AS
	SELECT tbDepartamento.nomeDepartamento, COUNT(tbFuncionario.codFuncionario) AS quantidadeFuncionarios FROM tbDepartamento 
	INNER JOIN tbFuncionario  ON tbFuncionario.codDepartamento  = tbDepartamento.codDepartamento
	GROUP BY tbDepartamento.nomeDepartamento
	
SELECT quantidadeFuncionarios, nomeDepartamento FROM vwQtdFunc_Departamento

--Usando a viewanterior, exibir somente o nome do departamento que possui o menor número de funcionários
SELECT nomeDepartamento, quantidadeFuncionarios FROM vwQtdFunc_Departamento
	WHERE quantidadeFuncionarios = (SELECT MIN(quantidadeFuncionarios) FROM vwQtdFunc_Departamento)

--Criar uma viewpara exibir a soma dos salários por nome de departamento
CREATE VIEW vwSomaSalarios_Departamento AS
	SELECT tbDepartamento.nomeDepartamento, SUM(tbFuncionario.salarioFuncionario) AS somaSalarios FROM tbDepartamento
	INNER JOIN tbFuncionario  ON tbFuncionario.codDepartamento  = tbDepartamento.codDepartamento
	GROUP BY tbDepartamento.nomeDepartamento
	
SELECT somaSalarios, nomeDepartamento FROM vwSomaSalarios_Departamento

--Utilizando a viewdo exercício anterior, mostrar somente a maior soma dentre os departamentos
SELECT somaSalarios, nomeDepartamento FROM vwSomaSalarios_Departamento
	WHERE somaSalarios = (SELECT MAX(somaSalarios) FROM vwSomaSalarios_Departamento)

--Criar uma viewpara exibir somente o nome dos funcionários e o nome dos departamentos daqueles funcionários que não possuem dependentes
CREATE VIEW vwFuncionariosSemDependentes AS
SELECT tbFuncionario.nomeFuncionario, tbDepartamento.nomeDepartamento FROM tbFuncionario
	INNER JOIN tbDepartamento ON tbFuncionario.codDepartamento = tbDepartamento.codDepartamento
	LEFT JOIN tbDependente ON tbFuncionario.codFuncionario = tbDependente.codFuncionario
	WHERE tbDependente.codDependente IS NULL

SELECT nomeFuncionario, nomeDepartamento FROM vwFuncionariosSemDependentes

--Criar uma viewque exiba a quantidade de dependentes por nome de funcionáriO
CREATE VIEW vwQtdDependentes_Funcionario AS
	SELECT tbFuncionario.nomeFuncionario, COUNT(tbDependente.codDependente) AS quantidadeDependentes FROM tbFuncionario
	INNER JOIN tbDependente ON tbFuncionario.codFuncionario = tbDependente.codFuncionario
	GROUP BY tbFuncionario.nomeFuncionario

SELECT quantidadeDependentes, nomeFuncionario FROM vwQtdDependentes_Funcionario

--Utilizando a viewanterior, mostrar somente o nome do funcionário que possui mais dependentes
SELECT quantidadeDependentes, nomeFuncionario FROM vwQtdDependentes_Funcionario
	WHERE  quantidadeDependentes=(SELECT MAX( quantidadeDependentes) FROM vwQtdDependentes_Funcionario)

--Criar uma viewpara exibir a quantidade de dependentes por departamento
CREATE VIEW vwQtdDependentes_PorDepartamento AS
	SELECT tbDepartamento.nomeDepartamento, COUNT(tbDependente.codDependente) AS quantidadeDependentes FROM tbDepartamento
	INNER JOIN tbFuncionario ON tbDepartamento.codDepartamento = tbFuncionario.codDepartamento
	INNER JOIN tbDependente ON tbFuncionario.codFuncionario = tbDependente.codFuncionario
	GROUP BY tbDepartamento.nomeDepartamento

SELECT quantidadeDependentes, nomeDepartamento FROM vwQtdDependentes_PorDepartamento

--Utilizando a view do exercícios anterior, apresentar a soma geral dos dependentes
SELECT SUM(quantidadeDependentes) AS 'Soma Total' FROM vwQtdDependentes_PorDepartamento




