--1. Exercício: Crie um banco de dados chamado Empresa.
--**Expectativa:** Um novo banco de dados chamado 'empresa' deve ser criado:
DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;
-----------------------------------------------------------------------------------------------

--2. Criação de Tabela com Chave-Primária:[v]
--Exercício: Dentro do banco de dados 'empresa', crie uma tabela 'Funcionários' com as seguintes colunas:
--id (chave-primária, inteiro, auto-incremento), nome (texto), email(texto único).
--**Expectativa:** Tabela 'Funcionários' deve existir com as colunas especificadas e 'id' deve autoincrementar.
CREATE TABLE funcionarios (
id SERIAL PRIMARY KEY,
name TEXT,
e_mail TEXT UNIQUE,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
---------------------------------------------------------------------------------------

--3.Inserção de Dados e Constraint 'UNIQUE':
--Exercício: Insira três (pode ser 40 registros) funcionários na tabela 'Funcionários'
--garantindo que os emails sejam únicos. OBS: Após o 'INSERT' fazer o 'SELECT * FROM ...'
--**Expectativa:** Dados inseridos sem erros de violação de unicidade (CONSTRAINTS):

INSERT INTO funcionarios (name, e_mail)
VALUES 
    ('Ana Silva', 'ana.silva@example.com'),
    ('Bruno Costa', 'bruno.costa@example.com'),
    ('Carlos Oliveira', 'carlos.oliveira@example.com'),
    ('Daniela Pereira', 'daniela.pereira@example.com'),
    ('Eduardo Souza', 'eduardo.souza@example.com'),
    ('Fernanda Almeida', 'fernanda.almeida@example.com'),
    ('Gabriel Santos', 'gabriel.santos@example.com'),
    ('Helena Rocha', 'helena.rocha@example.com'),
    ('Isabela Ramos', 'isabela.ramos@example.com'),
    ('João Moreira', 'joao.moreira@example.com'),
    ('Karina Lima', 'karina.lima@example.com'),
    ('Lucas Ferreira', 'lucas.ferreira@example.com'),
    ('Maria Barbosa', 'maria.barbosa@example.com'),
    ('Natalia Cunha', 'natalia.cunha@example.com'),
    ('Otávio Mendes', 'otavio.mendes@example.com'),
    ('Paula Castro', 'paula.castro@example.com'),
    ('Rafael Teixeira', 'rafael.teixeira@example.com'),
    ('Silvia Ribeiro', 'silvia.ribeiro@example.com'),
    ('Thiago Almeida', 'thiago.almeida@example.com'),
    ('Vanessa Martins', 'vanessa.martins@example.com'),
    ('Aline Costa', 'aline.costa@example.com'),
    ('Bruno Duarte', 'bruno.duarte@example.com'),
    ('Carla Rodrigues', 'carla.rodrigues@example.com'),
    ('David Nascimento', 'david.nascimento@example.com'),
    ('Eduarda Lopes', 'eduarda.lopes@example.com'),
    ('Felipe Gomes', 'felipe.gomes@example.com'),
    ('Giovana Azevedo', 'giovana.azevedo@example.com'),
    ('Henrique Silva', 'henrique.silva@example.com'),
    ('Igor Santos', 'igor.santos@example.com'),
    ('Juliana Alves', 'juliana.alves@example.com'),
    ('Katia Pereira', 'katia.pereira@example.com'),
    ('Leonardo Figueiredo', 'leonardo.figueiredo@example.com'),
    ('Mariana Duarte', 'mariana.duarte@example.com'),
    ('Natan Costa', 'natan.costa@example.com'),
    ('Olivia Almeida', 'olivia.almeida@example.com'),
    ('Pedro Costa', 'pedro.costa@example.com'),
    ('Quin Azevedo', 'quin.azevedo@example.com'),
    ('Renata Silva', 'renata.silva@example.com'),
    ('Sara Rocha', 'sara.rocha@example.com'),
    ('Tatiana Santos', 'tatiana.santos@example.com'),
    ('Ulisses Cardoso', 'ulisses.cardoso@example.com'),
    ('Vitor Martins', 'vitor.martins@example.com'),
    ('Wesley Rodrigues', 'wesley.rodrigues@example.com'),
    ('Xavier Oliveira', 'xavier.oliveira@example.com'),
    ('Yasmin Teixeira', 'yasmin.teixeira@example.com'),
    ('Zilda Barbosa', 'zilda.barbosa@example.com'),
    ('Adriana Freitas', 'adriana.freitas@example.com'),
    ('Bruno Rocha', 'bruno.rocha@example.com'),
    ('Catarina Lima', 'catarina.lima@example.com'),
    ('Daniel Ferreira', 'daniel.ferreira@example.com'),
    ('Estela Mendes', 'estela.mendes@example.com'),
    ('Fabio Castro', 'fabio.castro@example.com'),
    ('Gabriela Oliveira', 'gabriela.oliveira@example.com'),
    ('Hugo Almeida', 'hugo.almeida@example.com'),
    ('Iara Cunha', 'iara.cunha@example.com'),
    ('Joana Nascimento', 'joana.nascimento@example.com'),
    ('Kaleb Santos', 'kaleb.santos@example.com'),
    ('Lucas Teixeira', 'lucas.teixeira@example.com');
   
SELECT * FROM funcionarios f;
-------------------------------------------------------------------------------------

--4.Consulta Simples com CRUD - Read(leitura):
--Exercício: Selecione todos os funcionários cujo nome começa com a letra 'A':
SELECT * FROM funcionarios a WHERE "name" like 'A%';
--------------------------------------------------------------------------------------

--5. Atualização de Dados com CRUD - Update:
--Exercício: Atualize o email do funcionário cujo 'id' é 1 para um novo email.
--**Expectativa:** O email do funcionário cujo 'id' é 1 deve ser atualizado sem violar a
--constraint(restrição) de unicidade:
UPDATE funcionarios
SET name = 'Luciano Dantas'
WHERE id = 1;
----------------------------------------------------------------------------------------

  
--6. Exclusão de Dados com CRUD - Delete
--Exercício: Delete o funcionário cujo 'id' é 3.
--**Expectativa:** O funcionário com 'id' 3 deve ser removido da tabela:
DELETE FROM funcionarios WHERE id = 3;
----------------------------------------------------------------------------------------

--6.1. Antes da criação da tabela 'departamentos', será necesssário a criação de uma outra tabela chamada
--'gerentes', por conta de existir a chave-estrangeira 'gerente_id', na tabela 'departamentos'.
CREATE TABLE gerentes (
id SERIAL PRIMARY KEY,
username VARCHAR(60) NOT NULL UNIQUE,
nome VARCHAR(60),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO gerentes (username, nome)
VALUES 
    ('joao01', 'João Silva'),
    ('maria02', 'Maria Oliveira'),
    ('carlos03', 'Carlos Pereira'),
    ('lucia04', 'Lúcia Almeida'),
    ('roberto05', 'Roberto Fernandes'),
    ('ana06', 'Ana Sousa'),
    ('jose07', 'José Rodrigues'),
    ('juliana08', 'Juliana Freitas'),
    ('adriano09', 'Adriano Costa'),
    ('gabriel10', 'Gabriel Nascimento'),
    ('marcos11', 'Marcos Ribeiro'),
    ('luciano12', 'Luciano Ferreira'),
    ('sandra13', 'Sandra Lima'),
    ('luiz14', 'Luiz Barbosa'),
    ('rafaela15', 'Rafaela Silva'),
    ('vanessa16', 'Vanessa Moreira'),
    ('ricardo17', 'Ricardo Rocha'),
    ('sara18', 'Sara Cardoso'),
    ('thiago19', 'Thiago Castro'),
    ('daniela20', 'Daniela Duarte'),
    ('julia21', 'Júlia Teixeira'),
    ('victor22', 'Victor Mendes'),
    ('isabela23', 'Isabela Cunha'),
    ('felipe24', 'Felipe Gomes'),
    ('camila25', 'Camila Rocha'),
    ('arthur26', 'Arthur Almeida'),
    ('bruno27', 'Bruno Oliveira'),
    ('fernanda28', 'Fernanda Martins'),
    ('eduardo29', 'Eduardo Santana'),
    ('rafael30', 'Rafael Costa'),
    ('carla31', 'Carla Lopes'),
    ('samuel32', 'Samuel Ribeiro'),
    ('paula33', 'Paula Cardoso'),
    ('karina34', 'Karina Ramos'),
    ('andré35', 'André Carvalho'),
    ('rodrigo36', 'Rodrigo Azevedo'),
    ('catarina37', 'Catarina Mendes'),
    ('fabiana38', 'Fabiana Rocha'),
    ('patrick39', 'Patrick Ferreira'),
    ('felipe40', 'Felipe Santos'),
    ('priscila41', 'P--1. Exercício: Crie um banco de dados chamado Empresa.
--**Expectativa:** Um novo banco de dados chamado 'empresa' deve ser criado:
DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;
-----------------------------------------------------------------------------------------------

--2. Criação de Tabela com Chave-Primária:[v]
--Exercício: Dentro do banco de dados 'empresa', crie uma tabela 'Funcionários' com as seguintes colunas:
--id (chave-primária, inteiro, auto-incremento), nome (texto), email(texto único).
--**Expectativa:** Tabela 'Funcionários' deve existir com as colunas especificadas e 'id' deve autoincrementar.
CREATE TABLE funcionarios (
id SERIAL PRIMARY KEY,
name TEXT,
e_mail TEXT UNIQUE,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
---------------------------------------------------------------------------------------

--3.Inserção de Dados e Constraint 'UNIQUE':
--Exercício: Insira três (pode ser 40 registros) funcionários na tabela 'Funcionários'
--garantindo que os emails sejam únicos. OBS: Após o 'INSERT' fazer o 'SELECT * FROM ...'
--**Expectativa:** Dados inseridos sem erros de violação de unicidade (CONSTRAINTS):

INSERT INTO funcionarios (name, e_mail)
VALUES 
    ('Ana Silva', 'ana.silva@example.com'),
    ('Bruno Costa', 'bruno.costa@example.com'),
    ('Carlos Oliveira', 'carlos.oliveira@example.com'),
    ('Daniela Pereira', 'daniela.pereira@example.com'),
    ('Eduardo Souza', 'eduardo.souza@example.com'),
    ('Fernanda Almeida', 'fernanda.almeida@example.com'),
    ('Gabriel Santos', 'gabriel.santos@example.com'),
    ('Helena Rocha', 'helena.rocha@example.com'),
    ('Isabela Ramos', 'isabela.ramos@example.com'),
    ('João Moreira', 'joao.moreira@example.com'),
    ('Karina Lima', 'karina.lima@example.com'),
    ('Lucas Ferreira', 'lucas.ferreira@example.com'),
    ('Maria Barbosa', 'maria.barbosa@example.com'),
    ('Natalia Cunha', 'natalia.cunha@example.com'),
    ('Otávio Mendes', 'otavio.mendes@example.com'),
    ('Paula Castro', 'paula.castro@example.com'),
    ('Rafael Teixeira', 'rafael.teixeira@example.com'),
    ('Silvia Ribeiro', 'silvia.ribeiro@example.com'),
    ('Thiago Almeida', 'thiago.almeida@example.com'),
    ('Vanessa Martins', 'vanessa.martins@example.com'),
    ('Aline Costa', 'aline.costa@example.com'),
    ('Bruno Duarte', 'bruno.duarte@example.com'),
    ('Carla Rodrigues', 'carla.rodrigues@example.com'),
    ('David Nascimento', 'david.nascimento@example.com'),
    ('Eduarda Lopes', 'eduarda.lopes@example.com'),
    ('Felipe Gomes', 'felipe.gomes@example.com'),
    ('Giovana Azevedo', 'giovana.azevedo@example.com'),
    ('Henrique Silva', 'henrique.silva@example.com'),
    ('Igor Santos', 'igor.santos@example.com'),
    ('Juliana Alves', 'juliana.alves@example.com'),
    ('Katia Pereira', 'katia.pereira@example.com'),
    ('Leonardo Figueiredo', 'leonardo.figueiredo@example.com'),
    ('Mariana Duarte', 'mariana.duarte@example.com'),
    ('Natan Costa', 'natan.costa@example.com'),
    ('Olivia Almeida', 'olivia.almeida@example.com'),
    ('Pedro Costa', 'pedro.costa@example.com'),
    ('Quin Azevedo', 'quin.azevedo@example.com'),
    ('Renata Silva', 'renata.silva@example.com'),
    ('Sara Rocha', 'sara.rocha@example.com'),
    ('Tatiana Santos', 'tatiana.santos@example.com'),
    ('Ulisses Cardoso', 'ulisses.cardoso@example.com'),
    ('Vitor Martins', 'vitor.martins@example.com'),
    ('Wesley Rodrigues', 'wesley.rodrigues@example.com'),
    ('Xavier Oliveira', 'xavier.oliveira@example.com'),
    ('Yasmin Teixeira', 'yasmin.teixeira@example.com'),
    ('Zilda Barbosa', 'zilda.barbosa@example.com'),
    ('Adriana Freitas', 'adriana.freitas@example.com'),
    ('Bruno Rocha', 'bruno.rocha@example.com'),
    ('Catarina Lima', 'catarina.lima@example.com'),
    ('Daniel Ferreira', 'daniel.ferreira@example.com'),
    ('Estela Mendes', 'estela.mendes@example.com'),
    ('Fabio Castro', 'fabio.castro@example.com'),
    ('Gabriela Oliveira', 'gabriela.oliveira@example.com'),
    ('Hugo Almeida', 'hugo.almeida@example.com'),
    ('Iara Cunha', 'iara.cunha@example.com'),
    ('Joana Nascimento', 'joana.nascimento@example.com'),
    ('Kaleb Santos', 'kaleb.santos@example.com'),
    ('Lucas Teixeira', 'lucas.teixeira@example.com');
   
SELECT * FROM funcionarios f;
-------------------------------------------------------------------------------------

--4.Consulta Simples com CRUD - Read(leitura):
--Exercício: Selecione todos os funcionários cujo nome começa com a letra 'A':
SELECT * FROM funcionarios a WHERE "name" like 'A%';
--------------------------------------------------------------------------------------

--5. Atualização de Dados com CRUD - Update:
--Exercício: Atualize o email do funcionário cujo 'id' é 1 para um novo email.
--**Expectativa:** O email do funcionário cujo 'id' é 1 deve ser atualizado sem violar a
--constraint(restrição) de unicidade:
UPDATE funcionarios
SET name = 'Luciano Dantas'
WHERE id = 1;
----------------------------------------------------------------------------------------

  
--6. Exclusão de Dados com CRUD - Delete
--Exercício: Delete o funcionário cujo 'id' é 3.
--**Expectativa:** O funcionário com 'id' 3 deve ser removido da tabela:
DELETE FROM funcionarios WHERE id = 3;
----------------------------------------------------------------------------------------

--6.1. Antes da criação da tabela 'departamentos', será necesssário a criação de uma outra tabela chamada
--'gerentes', por conta de existir a chave-estrangeira 'gerente_id', na tabela 'departamentos'.
CREATE TABLE gerentes (
id SERIAL PRIMARY KEY,
username VARCHAR(60) NOT NULL UNIQUE,
nome VARCHAR(60),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO gerentes (username, nome)
VALUES 
    ('joao01', 'João Silva'),
    ('maria02', 'Maria Oliveira'),
    ('carlos03', 'Carlos Pereira'),
    ('lucia04', 'Lúcia Almeida'),
    ('roberto05', 'Roberto Fernandes'),
    ('ana06', 'Ana Sousa'),
    ('jose07', 'José Rodrigues'),
    ('juliana08', 'Juliana Freitas'),
    ('adriano09', 'Adriano Costa'),
    ('gabriel10', 'Gabriel Nascimento'),
    ('marcos11', 'Marcos Ribeiro'),
    ('luciano12', 'Luciano Ferreira'),
    ('sandra13', 'Sandra Lima'),
    ('luiz14', 'Luiz Barbosa'),
    ('rafaela15', 'Rafaela Silva'),
    ('vanessa16', 'Vanessa Moreira'),
    ('ricardo17', 'Ricardo Rocha'),
    ('sara18', 'Sara Cardoso'),
    ('thiago19', 'Thiago Castro'),
    ('daniela20', 'Daniela Duarte'),
    ('julia21', 'Júlia Teixeira'),
    ('victor22', 'Victor Mendes'),
    ('isabela23', 'Isabela Cunha'),
    ('felipe24', 'Felipe Gomes'),
    ('camila25', 'Camila Rocha'),
    ('arthur26', 'Arthur Almeida'),
    ('bruno27', 'Bruno Oliveira'),
    ('fernanda28', 'Fernanda Martins'),
    ('eduardo29', 'Eduardo Santana'),
    ('rafael30', 'Rafael Costa'),
    ('carla31', 'Carla Lopes'),
    ('samuel32', 'Samuel Ribeiro'),
    ('paula33', 'Paula Cardoso'),
    ('karina34', 'Karina Ramos'),
    ('andré35', 'André Carvalho'),
    ('rodrigo36', 'Rodrigo Azevedo'),
    ('catarina37', 'Catarina Mendes'),
    ('fabiana38', 'Fabiana Rocha'),
    ('patrick39', 'Patrick Ferreira'),
    ('felipe40', 'Felipe Santos'),
    ('priscila41', 'Priscila Oliveira'),
    ('mateus42', 'Mateus Martins'),
    ('aline43', 'Aline Costa'),
    ('valeria44', 'Valéria Souza'),
    ('roberto45', 'Roberto Pereira'),
    ('mariana46', 'Mariana Figueiredo'),
    ('aline47', 'Aline Rodrigues'),
    ('raquel48', 'Raquel Nunes'),
    ('david49', 'David Fernandes'),
    ('isabel50', 'Isabel Gomes'),
    ('helena51', 'Helena Moreira'),
    ('marcos52', 'Marcos Cardoso'),
    ('sabrina53', 'Sabrina Sousa'),
    ('diana54', 'Diana Barbosa'),
    ('lucas55', 'Lucas Santos'),
    ('otavio56', 'Otávio Oliveira'),
    ('vitoria57', 'Vitória Almeida');
   
   INSERT INTO gerentes (username, nome)
   VALUES
  				('gastrilho', 'Malaquias'),
  				('tocatudopordinheiro', 'Jonatas'),
  				('totozinhoalegre', 'Lucas');
   
   SELECT * FROM gerentes g;
-----------------------------------------------------------------------------------------

--7. Criação de Tabela com Chave-estrangeira
--Exercício: Crie uma tabela 'Departamentos' com as colunas:
--departamento_id (chave-primária, inteiro, auto-incremento), nome (texto), gerente_id (inteiro,
--chave-estrangeira referenciando 'id' da tabela 'Funcionários').
--OBS: A tabela 'Gerentes' tem que ser criada antes da tabela 'Departamentos',
--pois esta tem a chave-estrangeira 'gerente_id' que pertence a tabela 'Gerentes'!

--Cria a tabela 'departamentos' com uma chave-primária que corresponde ao ID de 'gerentes'
CREATE TABLE departamentos (
id SERIAL PRIMARY KEY, --Chave-primária auto-incremental ou id INT PRIMARY KEY,(Chave-primária compartilhada com 'gerentes')
nome text,
gerente_id INT UNIQUE, --Para garantir a unicidade no relacionamento 1:1
FOREIGN KEY (gerente_id) REFERENCES gerentes(id) --Chave estrangeira para 'gerentes'
);

--Inserindo 30 registros na tabela 'departamentos':
INSERT INTO departamentos (nome, gerente_id) VALUES ('Recursos Humanos', 1);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Tecnologia da Informação', 2);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Finanças', 3);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Marketing', 4);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Vendas', 5);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Operações', 6);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Logística', 7);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Serviços ao Cliente', 8);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Pesquisa e Desenvolvimento', 9);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Produção', 10);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Contabilidade', 11);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Jurídico', 12);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Relações Públicas', 13);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Suporte Técnico', 14);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Desenvolvimento de Produtos', 15);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Compras', 16);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Qualidade', 17);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Estratégia Corporativa', 18);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Treinamento', 19);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Planejamento', 20);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Gestão de Projetos', 21);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Design', 22);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Recursos Físicos', 23);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Manutenção', 24);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Administração', 25);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Segurança', 26);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Expansão', 27);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Responsabilidade Social', 28);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Compliance', 29);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Planejamento Estratégico', 30);


SELECT * FROM departamentos d;
---------------------------------------------------------------------------------------------------

--8. Inserção com Chave-estrangeira:
--Exercício: Insira um departamento chamado "TI" com o 'gerente_id' sendo o 'id' de um dos funcionários
--existentes.
--OBS: A coluna 'gerente_id' pertence a tabela 'Funcionários', segundo esta etapa 8.
INSERT INTO departamentos(nome, gerente_id) VALUES ('TI', 31);
SELECT * FROM departamentos d;
---------------------------------------------------------------------------------------------------------

--9. Consulta com 'JOIN':
--Exercício: Faça uma consulta para listar todos os departamentos e o nome dos seus gerentes.
--**Expectativa:** Lista dos departamentos junto com o nome dos gerentes correspondentes.
SELECT departamentos.nome AS departamento, gerentes.nome AS gerente
FROM departamentos --Tabela 'departamentos'
INNER JOIN gerentes --Garante que a consulta retorne apenas registros que poossuem uma correspondência entre as duas tabelas, graças ao campo 'gerente_id' em 'departamentos', que referencia o campo 'id' da tabela 'gerentes'.
ON departamentos.gerente_id = gerentes.id; --Chave estrangeira em 'departamewntos' que referencia 'gerentes'
----------------------------------------------------------------------------------------------------------

--10. Uso de 'BETWEEN' e 'IN':
--Exercício: Selecione todos os funcionários cujo 'id' está entre 2 e 4 e cujo nome
--está em uma lista de nomes específicos (ex: 'Ana', 'Carlos'). 
SELECT * FROM funcionarios WHERE id BETWEEN 2 AND 4 --Intervalo para 'id'
  AND name IN ('Bruno Costa','Luciano Dantas'); --Lista de nomes

SELECT * FROM funcionarios WHERE name IN ('Karina Lima', 'Lucas Ferreira', 'Natalia Cunha');
-----------------------------------------------------------------------------------------------------------

--11. Consulta Avançada com Subquery:
--Exercício: Selecione os nomes dos departamentos cujos gerentes têm um 'id' menor(<) que 5.
SELECT
	d.nome AS Departamento --Seleciona o nome do departamento
FROM
	departamentos d -- Tabela de departamentos
JOIN
	gerentes g --Tabela de gerentes
ON
	d.gerente_id = g.id --Unir departamentos com gerentes pelo gerente_id
WHERE
	g.id < 5; --Subquery com filtro para Ids de gerentes menores que 5
-------------------------------------------------------------------------------------------------------

--12. Atualização com Subquery:
--Exercício: Atualize o 'gerente_id' do departamento de TI para o 'id' de um funcionário cujo nome é
--'Maria':
UPDATE departamentos
SET gerente_id = (
  SELECT id --Subquery para obter o ID do funcionario 'Maria'
  FROM funcionarios
  WHERE name = 'Maria' --Filtro
)
WHERE nome = 'TI'; --Atualiza apenas o departamento de TI
--**********************************************************************************************************

DELETE FROM funcionarios WHERE name = 'Maria';
DELETE FROM departamentos WHERE id = 31;

INSERT INTO funcionarios (name, e_mail) VALUES ('Maria', 'TI');
INSERT INTO departamentos (nome, gerente_id) VALUES ('TI',31);

INSERT INTO funcionarios (name, e_mail)
VALUES ('Maria', 'marialgumacoisa@exemple.com');

SELECT * FROM funcionarios f;
SELECT * FROM gerentes g;
SELECT * FROM departamentos d;
------------------------------------------------------------------------------------------------------------

--13. Consulta com UNION:
--Exercício: Faça uma consulta que combine os nomes dos funcionários e os nomes dos departamentos em uma
--única lista.
--**Expectativa:** Lista combinada contendo tanto nomes de funcionários quanto de departamentos:
SELECT name AS "Nome do funcionário e departamentos"
FROM funcionarios
UNION
SELECT nome
FROM departamentos;
------------------------------------------------------------------------------------------------------------
--14. Deleção e Manutenção de 'IDs' Sequenciais:
--Exercício: Delete o departamento 'RH' e insira um novo departamento chamado 'Marketing', garantindo que os
--'IDs' sequenciais não sejam reutilizados.
--**Expectativa:** 'RH' removido e 'Marketing' adicionado com um novo 'Id' sequencial:
INSERT INTO departamentos (nome, gerente_id)
VALUES ('RH', 34);

DELETE FROM departamentos WHERE nome = 'RH';

INSERT INTO departamentos (nome, gerente_id)
VALUES
			('Marketing',35);
-----------------------------------------------------------------------------------------------------------

--Consulta Complexa com 'JOINS' Múltiplos:
--Exercício: Liste todos os funcionários, os departamentos a que pertencem e o nome de seus gerentes.
--Expectativa: Informações detalhadas sobre funcionários, seu departamentos e gerentes:
SELECT
	f.name AS "Nome dos funcionários",
	d.nome AS "Departamento",
	g.nome AS "Nome dos gerentes"
FROM
	funcionarios f
JOIN
	gerentes g ON f.id = g.id
JOIN
	departamentos d ON g.id = d.gerente_id;
	

riscila Oliveira'),
    ('mateus42', 'Mateus Martins'),
    ('aline43', 'Aline Costa'),
    ('valeria44', 'Valéria Souza'),
    ('roberto45', 'Roberto Pereira'),
    ('mariana46', 'Mariana Figueiredo'),
    ('aline47', 'Aline Rodrigues'),
    ('raquel48', 'Raquel Nunes'),
    ('david49', 'David Fernandes'),
    ('isabel50', 'Isabel Gomes'),
    ('helena51', 'Helena Moreira'),
    ('marcos52', 'Marcos Cardoso'),
    ('sabrina53', 'Sabrina Sousa'),
    ('diana54', 'Diana Barbosa'),
    ('lucas55', 'Lucas Santos'),
    ('otavio56', 'Otávio Oliveira'),
    ('vitoria57', 'Vitória Almeida');
   
   INSERT INTO gerentes (username, nome)
   VALUES
  				('gastrilho', 'Malaquias'),
  				('tocatudopordinheiro', 'Jonatas'),
  				('totozinhoalegre', 'Lucas');
   
   SELECT * FROM gerentes g;
-----------------------------------------------------------------------------------------

--7. Criação de Tabela com Chave-estrangeira
--Exercício: Crie uma tabela 'Departamentos' com as colunas:
--departamento_id (chave-primária, inteiro, auto-incremento), nome (texto), gerente_id (inteiro,
--chave-estrangeira referenciando 'id' da tabela 'Funcionários').
--OBS: A tabela 'Gerentes' tem que ser criada antes da tabela 'Departamentos',
--pois esta tem a chave-estrangeira 'gerente_id' que pertence a tabela 'Gerentes'!

--Cria a tabela 'departamentos' com uma chave-primária que corresponde ao ID de 'gerentes'
CREATE TABLE departamentos (
id SERIAL PRIMARY KEY, --Chave-primária auto-incremental ou id INT PRIMARY KEY,(Chave-primária compartilhada com 'gerentes')
nome text,
gerente_id INT UNIQUE, --Para garantir a unicidade no relacionamento 1:1
FOREIGN KEY (gerente_id) REFERENCES gerentes(id) --Chave estrangeira para 'gerentes'
);

--Inserindo 30 registros na tabela 'departamentos':
INSERT INTO departamentos (nome, gerente_id) VALUES ('Recursos Humanos', 1);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Tecnologia da Informação', 2);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Finanças', 3);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Marketing', 4);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Vendas', 5);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Operações', 6);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Logística', 7);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Serviços ao Cliente', 8);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Pesquisa e Desenvolvimento', 9);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Produção', 10);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Contabilidade', 11);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Jurídico', 12);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Relações Públicas', 13);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Suporte Técnico', 14);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Desenvolvimento de Produtos', 15);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Compras', 16);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Qualidade', 17);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Estratégia Corporativa', 18);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Treinamento', 19);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Planejamento', 20);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Gestão de Projetos', 21);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Design', 22);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Recursos Físicos', 23);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Manutenção', 24);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Administração', 25);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Segurança', 26);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Expansão', 27);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Responsabilidade Social', 28);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Compliance', 29);
INSERT INTO departamentos (nome, gerente_id) VALUES ('Planejamento Estratégico', 30);


SELECT * FROM departamentos d;
---------------------------------------------------------------------------------------------------

--8. Inserção com Chave-estrangeira:
--Exercício: Insira um departamento chamado "TI" com o 'gerente_id' sendo o 'id' de um dos funcionários
--existentes.
--OBS: A coluna 'gerente_id' pertence a tabela 'Funcionários', segundo esta etapa 8.
INSERT INTO departamentos(nome, gerente_id) VALUES ('TI', 31);
SELECT * FROM departamentos d;
---------------------------------------------------------------------------------------------------------

--9. Consulta com 'JOIN':
--Exercício: Faça uma consulta para listar todos os departamentos e o nome dos seus gerentes.
--**Expectativa:** Lista dos departamentos junto com o nome dos gerentes correspondentes.
SELECT departamentos.nome AS departamento, gerentes.nome AS gerente
FROM departamentos --Tabela 'departamentos'
INNER JOIN gerentes --Garante que a consulta retorne apenas registros que poossuem uma correspondência entre as duas tabelas, graças ao campo 'gerente_id' em 'departamentos', que referencia o campo 'id' da tabela 'gerentes'.
ON departamentos.gerente_id = gerentes.id; --Chave estrangeira em 'departamewntos' que referencia 'gerentes'
----------------------------------------------------------------------------------------------------------

--10. Uso de 'BETWEEN' e 'IN':
--Exercício: Selecione todos os funcionários cujo 'id' está entre 2 e 4 e cujo nome
--está em uma lista de nomes específicos (ex: 'Ana', 'Carlos'). 
SELECT * FROM funcionarios WHERE id BETWEEN 2 AND 4 --Intervalo para 'id'
  AND name IN ('Bruno Costa','Luciano Dantas'); --Lista de nomes

SELECT * FROM funcionarios WHERE name IN ('Karina Lima', 'Lucas Ferreira', 'Natalia Cunha');
-----------------------------------------------------------------------------------------------------------

--11. Consulta Avançada com Subquery:
--Exercício: Selecione os nomes dos departamentos cujos gerentes têm um 'id' menor(<) que 5.
SELECT
	d.nome AS Departamento --Seleciona o nome do departamento
FROM
	departamentos d -- Tabela de departamentos
JOIN
	gerentes g --Tabela de gerentes
ON
	d.gerente_id = g.id --Unir departamentos com gerentes pelo gerente_id
WHERE
	g.id < 5; --Subquery com filtro para Ids de gerentes menores que 5
-------------------------------------------------------------------------------------------------------

--12. Atualização com Subquery:
--Exercício: Atualize o 'gerente_id' do departamento de TI para o 'id' de um funcionário cujo nome é
--'Maria':
UPDATE departamentos
SET gerente_id = (
  SELECT id --Subquery para obter o ID do funcionario 'Maria'
  FROM funcionarios
  WHERE name = 'Maria' --Filtro
)
WHERE nome = 'TI'; --Atualiza apenas o departamento de TI
--**********************************************************************************************************

DELETE FROM funcionarios WHERE name = 'Maria';
DELETE FROM departamentos WHERE id = 31;

INSERT INTO funcionarios (name, e_mail) VALUES ('Maria', 'TI');
INSERT INTO departamentos (nome, gerente_id) VALUES ('TI',31);

INSERT INTO funcionarios (name, e_mail)
VALUES ('Maria', 'marialgumacoisa@exemple.com');

SELECT * FROM funcionarios f;
SELECT * FROM gerentes g;
SELECT * FROM departamentos d;
------------------------------------------------------------------------------------------------------------

--13. Consulta com UNION:
--Exercício: Faça uma consulta que combine os nomes dos funcionários e os nomes dos departamentos em uma
--única lista.
--**Expectativa:** Lista combinada contendo tanto nomes de funcionários quanto de departamentos:
SELECT name AS "Nome do funcionário e departamentos"
FROM funcionarios
UNION
SELECT nome
FROM departamentos;
------------------------------------------------------------------------------------------------------------
--14. Deleção e Manutenção de 'IDs' Sequenciais:
--Exercício: Delete o departamento 'RH' e insira um novo departamento chamado 'Marketing', garantindo que os
--'IDs' sequenciais não sejam reutilizados.
--**Expectativa:** 'RH' removido e 'Marketing' adicionado com um novo 'Id' sequencial:
INSERT INTO departamentos (nome, gerente_id)
VALUES ('RH', 34);

DELETE FROM departamentos WHERE nome = 'RH';

INSERT INTO departamentos (nome, gerente_id)
VALUES
			('Marketing',35);
-----------------------------------------------------------------------------------------------------------

--Consulta Complexa com 'JOINS' Múltiplos:
--Exercício: Liste todos os funcionários, os departamentos a que pertencem e o nome de seus gerentes.
--Expectativa: Informações detalhadas sobre funcionários, seu departamentos e gerentes:
SELECT
	f.name AS "Nome dos funcionários",
	d.nome AS "Departamento",
	g.nome AS "Nome dos gerentes"
FROM
	funcionarios f
JOIN
	gerentes g ON f.id = g.id
JOIN
	departamentos d ON g.id = d.gerente_id;
	

