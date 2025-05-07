USE bdTransito

--1- Criar um trigger que ao veículo tomar uma multa os pontos da multa sejam atualizados na tabela do motorista no campo 
--pontuacaoAcumulada. Caso o motorista alcance 20 pontos informar via mensagem que o mesmo poderá ter sua habilitação suspensa. 
CREATE TRIGGER tgAtualizaPontos ON tbMultas 
AFTER INSERT
AS
BEGIN
    DECLARE @idMotorista INT, @idVeiculo INT, @numPontos INT, @pontuacaoAtual INT
    
   
    SET @idVeiculo = (SELECT idVeiculo FROM INSERTED)
    SELECT @numPontos = pontosMulta FROM INSERTED
    
    
    SET @idMotorista = (SELECT idMotorista FROM tbVeiculo WHERE idVeiculo = @idVeiculo)
    
    
    UPDATE tbMotorista
		SET pontuacaoAcumulada = pontuacaoAcumulada + @numPontos
		WHERE idMotorista = @idMotorista
    
    
    SELECT @pontuacaoAtual = pontuacaoAcumulada FROM tbMotorista WHERE idMotorista = @idMotorista
    
    
    IF @pontuacaoAtual >= 20 
    BEGIN 
        PRINT 'Você pode ter sua Habilitação Suspensa!'
    END
    
   
    SELECT * FROM tbMultas
    SELECT * FROM tbMotorista
    SELECT * FROM tbVeiculo
END


--Testando
INSERT INTO tbMotorista(nomeMotorista, dataNascimentoMotorista, cpfMotorista, CNHMotorista, pontuacaoAcumulada)
	VALUES ('João Silva', '1980-05-15', '123.456.789-00', '123456789', 0)

INSERT INTO tbVeiculo(modeloVeiculo, placa, renavam, anoVeiculo, idMotorista)
	VALUES ('Fiat Uno', 'ABC-1234', '12345678901234', 2015, 1)

INSERT INTO tbMultas(dataMulta, pontosMulta, idVeiculo)
VALUES
	(GETDATE(), 25, 1)


--Atividade 2
--Exercício A - Ao ser feito um depósito atualize o saldo da conta corrente somando a quantia depositada
CREATE TRIGGER tgAtualizaSaldoDeposito ON tbDeposito
AFTER INSERT
AS
BEGIN
    DECLARE @numConta INT, @valorDeposito REAL

    
    SELECT @numConta = numConta, @valorDeposito = valorDeposito FROM INSERTED

    UPDATE tbContaCorrente
    SET saldoConta = saldoConta + @valorDeposito
    WHERE numConta = @numConta
END

--TESTANDO
-- Teste de criação de cliente e conta com saldo inicial
INSERT INTO tbCliente (nomeCliente, cpfCliente)
    VALUES ('Carlos Silva', '12345678901')

INSERT INTO tbContaCorrente (codCliente)
    VALUES (1)  -- O saldo será 0 devido ao valor padrão

-- Adicionando um depósito
INSERT INTO tbDeposito (valorDeposito, numConta, dataDeposito, horaDeposito)
    VALUES (500, 1, GETDATE(), GETDATE())

-- Verificando as tabelas
SELECT * FROM tbCliente
SELECT * FROM tbDeposito
SELECT * FROM tbContaCorrente

--Exercício B - Ao ser feito um saque atualize o saldo da conta corrente descontando o valor caso tenha saldo suficiente
-- Trigger para atualizar o saldo ao fazer saque
CREATE TRIGGER tgAtualizaSaldoSaque ON tbSaque
AFTER INSERT
AS
BEGIN
    DECLARE @numConta INT, @valorSaque REAL, @saldoConta REAL

   
    SELECT @numConta = numConta, @valorSaque = valorSaque FROM INSERTED

    
    SELECT @saldoConta = saldoConta FROM tbContaCorrente WHERE numConta = @numConta

    
    IF @saldoConta >= @valorSaque
    BEGIN
        
        UPDATE tbContaCorrente
        SET saldoConta = saldoConta - @valorSaque
        WHERE numConta = @numConta
    END
    ELSE
    BEGIN
        PRINT 'Saldo insuficiente para realizar o saque.'
    END
END

--TESTANDO
INSERT INTO tbSaque (valorSaque, numConta, dataSaque, horaSaque)
VALUES (200.00, 1, GETDATE(), GETDATE())

SELECT * FROM tbSaque
SELECT * FROM tbContaCorrente