CREATE DATABASE bdRecursosHumanos;

USE bdRecursosHumanos;

CREATE TABLE tbDepartamento (
    codDepartamento INT PRIMARY KEY,
    nomeDepartamento VARCHAR(100)
);

CREATE TABLE tbFuncionario (
    codFuncionario INT PRIMARY KEY,
    nomeFuncionario VARCHAR(100),
    cpfFuncionario VARCHAR(11),
    sexoFuncionario CHAR(1),
    dataNascimentoFuncionario DATE,
    salarioFuncionario DECIMAL(10, 2),
    codDepartamento INT,
    FOREIGN KEY (codDepartamento) REFERENCES tbDepartamento(codDepartamento)
);

CREATE TABLE tbDependente (
    codDependente INT PRIMARY KEY,
    nomeDependente VARCHAR(100),
    dataNascimento DATE,
    sexoDependente CHAR(1),
    codFuncionario INT,
    FOREIGN KEY (codFuncionario) REFERENCES tbFuncionario(codFuncionario)
);
