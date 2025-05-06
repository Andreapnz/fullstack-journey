-- Passo 1: Criação do Banco de Dados 
CREATE DATABASE atividade03_db;

-- Passo 2: Seleção do Banco "atividade03_db"
USE atividade03_db;

-- Passo 3: Criação da tabela "users"
CREATE TABLE users (
	id INT auto_increment primary key,
    nome VARCHAR(45) NOT NULL,
    username VARCHAR(45) NOT NULL UNIQUE,
    password VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL
    );
    
-- Passo 4: Criação da tabela "projects"
CREATE TABLE projects (
	id INT auto_increment primary key,
    name VARCHAR(45) NOT NULL,
    description VARCHAR(45),
    date VARCHAR(45)
    );
    
-- Passo 5: Criação da tabela de associação "users_has_projects"
CREATE TABLE users_has_projects (
	users_id INT NOT NULL,
    projects_id INT NOT NULL,
    PRIMARY KEY (users_id, projects_id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (projects_id) REFERENCES projects(id)
    );
    
-- Passo 6: Alterar o tipo de dado da tabela "projetcs" na coluna date para DATE
ALTER TABLE projects 
MODIFY COLUMN date DATE;

-- Passo 7: Alterar o valor padrão da coluna "password" da tabela "users" para "123mudar"
ALTER TABLE users
ALTER COLUMN password SET DEFAULT '123mudar';

-- Passo 8: Outra opção considerando a mudança de tipo de dado
ALTER TABLE users
MODIFY COLUMN password VARCHAR(20) NOT NULL DEFAULT '123mudar';

-- Passo 9: Inserir dados na tabela "users"
INSERT INTO users (id, nome, username, password, email) VALUES
(1, 'Maria', 'Rh_maria', '123mudar', 'maria@empresa.com'),
(2, 'Paulo', 'Ti_paulo', '123@456', 'paulo@empresa.com'),
(3, 'Ana', 'Rh_ana', '123mudar', 'ana@empresa.com'),
(4, 'Clara', 'Ti_clara', '123mudar', 'clara@empresa.com'),
(5, 'Aparecido', 'Rh_apareci', '55@lcido', 'aparecido@empresa.com');

-- Passo 10: Inserindo dados na tabela "projects"
INSERT INTO projects (id, name, description, date) VALUES
(1, 'Re-folha', 'Refatoração das Folhas', '2014-05-19'),
(2, 'Manutenção PC´s', 'Manutenção PC´s', '2014-06-09'),
(3, 'Auditoria', NULL, '2014-07-09');

-- Passo 11: Visualizando as Tabelas
SELECT * FROM users;

SELECT * FROM projects; 

-- Passo 12: Atualizamndo a data do projeto "Manutenção PC´s" para 2014-09-12 na tabela "projects
UPDATE projects
SET date = '2014-09-12'
WHERE id=2;

-- Passo 13: Atualizando 
UPDATE users
SET username = 'rh_ciclo'
WHERE id = 5 AND nome = 'Aparecido';


