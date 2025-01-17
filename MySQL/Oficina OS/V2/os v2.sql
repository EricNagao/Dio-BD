show databases;
create database ordem_serviço;
use ordem_serviço;


-- Tabela de Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Tabela de Veículos
CREATE TABLE Veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    fabricante VARCHAR(50),
    ano INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabela de Serviços
CREATE TABLE Servicos (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(200) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

-- Tabela de Ordens de Serviço
CREATE TABLE OrdensServico (
    id_os INT AUTO_INCREMENT PRIMARY KEY,
    data_abertura DATE NOT NULL,
    data_fechamento DATE,
    status ENUM('Aberta', 'Em Andamento', 'Concluída') NOT NULL,
    id_veiculo INT,
    FOREIGN KEY (id_veiculo) REFERENCES Veiculos(id_veiculo)
);

-- Tabela de Itens da Ordem de Serviço
CREATE TABLE ItensOS (
    id_item_os INT AUTO_INCREMENT PRIMARY KEY,
    id_os INT,
    id_servico INT,
    quantidade INT NOT NULL,
    preco_total DECIMAL(10, 2),
    FOREIGN KEY (id_os) REFERENCES OrdensServico(id_os),
    FOREIGN KEY (id_servico) REFERENCES Servicos(id_servico)
);

---
SELECT c.nome, COUNT(v.id_veiculo) AS total_veiculos
	FROM Clientes c
	LEFT JOIN Veiculos v ON c.id_cliente = v.id_cliente
	GROUP BY c.nome;


SELECT os.id_os, os.status, v.placa, c.nome AS cliente
	FROM OrdensServico os
	INNER JOIN Veiculos v ON os.id_veiculo = v.id_veiculo
	INNER JOIN Clientes c ON v.id_cliente = c.id_cliente
	WHERE os.status IN ('Aberta', 'Em Andamento');


SELECT os.id_os, SUM(i.preco_total) AS total_servicos
	FROM OrdensServico os
	INNER JOIN ItensOS i ON os.id_os = i.id_os
	GROUP BY os.id_os;

SELECT c.nome AS cliente, os.id_os, s.descricao, i.quantidade, i.preco_total, os.data_abertura
	FROM Clientes c
	INNER JOIN Veiculos v ON c.id_cliente = v.id_cliente
	INNER JOIN OrdensServico os ON v.id_veiculo = os.id_veiculo
	INNER JOIN ItensOS i ON os.id_os = i.id_os
	INNER JOIN Servicos s ON i.id_servico = s.id_servico
	ORDER BY os.data_abertura DESC;
