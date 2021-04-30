/* usar DevaneiosDB */ 

	USE DevaneiosDB;

/* selecionar todos os dados de uma tabela */

-- π cpf, pNome, uNome, telefone1, telefone2, data_de_nascimento (Pessoa)

    SELECT * FROM Pessoa;

/* selecionar um subconjunto de atributos de uma tabela */

-- π fk_Pessoa_CPF,salario,turno (Funcionario)

    SELECT fk_Pessoa_CPF, salario, turno FROM Funcionario;
    
/* selecionar dados de uma tabela mediante alguma condição */

-- π codigo_estabelecimento σ fk_Gerente_Pessoa_CPF = '55555555555' Pessoa

    SELECT codigo_estabelecimento FROM motel WHERE fk_Gerente_Pessoa_CPF='55555555555';

/* realizar seleção de dados sem apresentar duplicadas */

-- π fk_Pessoa_CPF,salario,turno (Funcionario)

    SELECT DISTINCT id_Funcao FROM Funcionario;

/* realizar consulta de seleção-projeção-junção */

-- π pNome, uNome, data_de_nascimento (σ pNome='Gabrielle' AND uNome='Aplin') Pessoa

   SELECT pNome, uNome, data_de_nascimento FROM Pessoa
    WHERE pNome='Gabrielle' AND uNome='Aplin';

/* aplicar união */

-- Resultado1 ← π fk_Pessoa_CPF (Seguranca)
-- Resultado2 ← π fk_Pessoa_CPF (Recepcionista)
-- Resultado ← Resultado1 ∪ Resultado2   

    SELECT fk_Pessoa_CPF FROM Seguranca
    UNION
    SELECT fk_Pessoa_CPF FROM Recepcionista;

/* aplicar interseção */

-- Resultado1 ← π fk_Pessoa_CPF (Hospede)
-- Resultado2 ← π fk_Pessoa_CPF (Seguranca)
-- Resultado ← Resultado1 ∩ Resultado2

    SELECT H.fk_Pessoa_CPF FROM Hospede H
    INNER JOIN
    Seguranca S;
    
/* aplicar diferença */

-- Resultado1 ← π fk_Pessoa_CPF FROM Funcionario
-- Resultado2 ← π fk_Pessoa_CPF FROM Hospede
-- Resultado ← Resultado1 - Resultado2

    SELECT fk_Pessoa_CPF FROM Funcionario
    WHERE fk_Pessoa_CPF NOT IN 
    (SELECT fk_Pessoa_CPF FROM Hospede);
    
    
/* aplicar produto cartesiano */

-- Rec ← π Recepcionista
-- Seg ← π Seguranca
-- CS ← Rec ✕ Seg

    SELECT R.* FROM Recepcionista R CROSS JOIN Seguranca S;

/* realizar seleção sob condição que envolva outra seleção */
	SELECT pNome, uNome, telefone1 FROM Pessoa
    WHERE CPF IN (SELECT CPF
	FROM data_idade
	WHERE data_de_nascimento = '1992-09-16 00:0:00');

/* consultar valores de atributos que iniciem por algum termo */
    SELECT pNome, uNome, CPF FROM Pessoa WHERE pNome='Shawn' and uNome LIKE 'M%';

/* ordenar resultados de consultas de forma ascendente */
    SELECT fk_Pessoa_CPF, id_Funcao, salario FROM Funcionario ORDER BY salario ASC; 

/* utilizar função de agregação */
    SELECT AVG(salario) AS media_salario, MAX(salario) AS maior, MIN(salario) AS mais_barato
    FROM Funcionario;

/* realizar agrupamento de resultado de consulta */
    SELECT codigo_estabelecimento, endereco FROM motel GROUP BY fk_Gerente_Pessoa_CPF;

/* criar regra apenas para consultas do banco criado */
    DROP ROLE IF EXISTS 'basic_selection'@'%';
    CREATE ROLE 'basic_selection'@'%';
    GRANT SELECT ON DEVaneiosDB.* TO 'basic_selection'@'%';

/* criar regra para execução de comandos DML e DQL */
	DROP ROLE IF EXISTS 'dml_and_dql'@'%';
    CREATE ROLE 'dml_and_dql'@'%';
    GRANT SELECT,INSERT,UPDATE,DELETE ON DEVaneiosDB.* TO 'dml_and_dql'@'%';

/* criar regra para execução de comandos DDL */
	DROP ROLE IF EXISTS 'ddl_role'@'localhost';
    CREATE ROLE 'ddl_role'@'localhost';
   	GRANT CREATE, ALTER, DROP ON DEVaneiosDB.* TO 'ddl_role'@'localhost';

/* criar usuário que possua a regra padrão para consulta (criada anteriormente) */
	DROP USER IF EXISTS 'basic_user';
    CREATE USER 'basic_user' IDENTIFIED BY '123';
    GRANT 'basic_selection' TO basic_user;
    
/* criar usuário que possua a regra padrão para comandos DML e DQL (criada anteriormente) */
	DROP USER IF EXISTS 'joao'@'localhost';
    CREATE USER 'joao'@'localhost' IDENTIFIED BY '12345555';
    GRANT 'dml_and_dql' TO 'joao'@'localhost';

/* criar usuário que possua a regra padrão para comandos DDL (criada anteriormente) */
	DROP USER IF EXISTS 'ddl_user';
    CREATE USER 'ddl_user' IDENTIFIED BY '456';
    GRANT 'ddl_role'@'%' TO 'ddl_user'@'%';

/* criar uma transação única */
    START TRANSACTION;
    INSERT INTO Pessoa VALUES ('01313131313', 'Ana Maria', 'Lindissima', '2000-06-13 00:00:00', '11954898745', DEFAULT);
    INSERT INTO Funcionario(fk_Pessoa_CPF, salario, turno,id_funcao) VALUES ('01313131313', 1900, 'N', 2);
    COMMIT;

/* criar uma view a partir de mais de uma tabela */
	DROP VIEW IF EXISTS Clientes;
    CREATE VIEW Clientes AS 
    SELECT P.pNome AS Clientes
    FROM Hospede H 
    INNER JOIN Pessoa P 
    WHERE p.CPF = H.fk_Pessoa_CPF
    UNION 
    SELECT A.pNome FROM Acompanhante A 
    INNER JOIN Pessoa P 
    WHERE A.fk_Pessoa_CPF = P.CPF;
    SELECT * FROM Clientes;

/* criar uma regra para consulta apenas na visualização criada */
	DROP ROLE IF EXISTS consulta_view;
    CREATE ROLE consulta_view;
    GRANT SELECT ON Clientes TO 'consulta_view';

/* criar usuário que possua a regra padrão para consulta da view (criadas anteriormente) */
	DROP USER IF EXISTS 'usergranted';
    CREATE USER 'usergranted'@'%' IDENTIFIED BY '923242';
    GRANT 'consulta_view' TO 'usergranted'@'%';
    SET DEFAULT ROLE 'consulta_view' TO 'usergranted'@'%';