show databases;

create database ecomerce2;
use ecomerce2;

-- Criando tabela de clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo ENUM('PJ', 'PF') NOT NULL,
    cpf_cnpj VARCHAR(14) UNIQUE NOT NULL
);

-- Criando tabela de vendedores
CREATE TABLE Vendedores (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Criando tabela de fornecedores
CREATE TABLE Fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Criando tabela de produtos
CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);

-- Criando tabela de pedidos
CREATE TABLE Pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_vendedor INT,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedores(id_vendedor)
);

-- Criando tabela de pagamentos
CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    forma_pagamento VARCHAR(50) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);

-- Criando tabela de entregas
CREATE TABLE Entrega (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    status ENUM('Pendente', 'Enviado', 'Entregue') NOT NULL,
    codigo_rastreamento VARCHAR(50),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);



SELECT c.nome, COUNT(p.id_pedido) AS total_pedidos
	FROM Clientes c
	LEFT JOIN Pedidos p ON c.id_cliente = p.id_cliente
	GROUP BY c.nome;
    
SELECT v.nome
	FROM Vendedores v
	INNER JOIN Fornecedores f ON v.nome = f.nome;
    
    
SELECT pr.nome AS produto, f.nome AS fornecedor, pr.estoque
	FROM Produtos pr
	INNER JOIN Fornecedores f ON pr.id_fornecedor = f.id_fornecedor;
    
SELECT f.nome AS fornecedor, pr.nome AS produto
	FROM Fornecedores f
	INNER JOIN Produtos pr ON f.id_fornecedor = pr.id_fornecedor; 
    
    
SELECT e.id_pedido, c.nome AS cliente, e.codigo_rastreamento
	FROM Entrega e
	INNER JOIN Pedidos p ON e.id_pedido = p.id_pedido
	INNER JOIN Clientes c ON p.id_cliente = c.id_cliente
	WHERE e.status = 'Enviado';