USE bdRecursosHumanos;
INSERT INTO tbDepartamento VALUES (1, 'Compras'), (2, 'Vendas'), (3, 'TI'), (4, 'Marketing');

INSERT INTO tbFuncionario VALUES
(1, 'Maria Luisa Moura', '12345678900', 'F', '1990-02-10', 3400.00, 1),
(2, 'Mariana Goulart', '45678902399', 'F', '1991-04-08', 2800.00, 2),
(3, 'Pedro Paulo Vidal', '64587223909', 'M', '1965-03-10', 4500.00, 3),
(4, 'Carlos Calbito', '83738223339', 'M', '1970-05-03', 4000.00, 4),
(5, 'Viviane Martins', '77832233399', 'F', '1985-05-20', 4900.00, 2),
(6, 'Analice Mendes', '83738233333', 'F', '1978-10-05', 3000.00, 1),
(7, 'Patricia Ishikawa', '43336699300', 'F', '1978-05-05', 4900.00, 4);

INSERT INTO tbDependente VALUES
(1, 'Lucas Moura', '2015-01-10', 'M', 1),
(2, 'Carlos Calbito Jr', '2000-06-08', 'M', 4),
(3, 'Michele Costa Calbito', '2004-09-09', 'F', 4),
(4, 'Silvana Costa Calbito', '2006-04-04', 'F', 4),
(5, 'Arthur Mendes Silva', '2010-07-07', 'M', 6);