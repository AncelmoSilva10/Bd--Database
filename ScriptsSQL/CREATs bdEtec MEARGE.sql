USE bdEtec

-- Inserindo alunos aprovados de tb2A em tb3
MERGE tb3 AS dest
USING (SELECT RM, nomeAluno, status FROM tb2A WHERE status = 'APROVADO') AS ori
ON dest.RM = ori.RM
WHEN NOT MATCHED THEN
    INSERT (RM, nomeAluno, status)
    VALUES (ori.RM, ori.nomeAluno, ori.status);

-- Inserindo alunos aprovados de tb2B em tb3
MERGE tb3 AS dest
USING (SELECT RM, nomeAluno, status FROM tb2B WHERE status = 'APROVADO') AS ori
ON dest.RM = ori.RM
WHEN NOT MATCHED THEN
    INSERT (RM, nomeAluno, status)
    VALUES (ori.RM, ori.nomeAluno, ori.status);

SELECT * FROM tb3;



