

-- insert dados

-- Inserindo clientes
INSERT INTO Clientes (nome, tipo, cpf_cnpj) VALUES
('João Silva', 'PF', '12345678901'),
('Empresa XYZ', 'PJ', '9876543210001');

-- Inserindo vendedores
INSERT INTO Vendedores (nome) VALUES
('Maria Oliveira'),
('Carlos Santos');

-- Inserindo fornecedores
INSERT INTO Fornecedores (nome) VALUES
('Fornecedor A'),
('Fornecedor B');

-- Inserindo produtos
INSERT INTO Produtos (nome, preco, estoque, id_fornecedor) VALUES
('Produto 1', 10.00, 100, 1),
('Produto 2', 20.00, 50, 2);

-- Inserindo pedidos
INSERT INTO Pedidos (id_cliente, id_vendedor, data_pedido, valor_total) VALUES
(1, 1, '2025-01-15', 100.00),
(2, 2, '2025-01-16', 200.00);

-- Inserindo pagamentos
INSERT INTO Pagamento (id_pedido, forma_pagamento, valor) VALUES
(1, 'Cartão', 100.00),
(2, 'Boleto', 200.00);

-- Inserindo entregas
INSERT INTO Entrega (id_pedido, status, codigo_rastreamento) VALUES
(1, 'Enviado', 'R123456789BR'),
(2, 'Pendente', NULL);
