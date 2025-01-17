use ordem_serviço;


-- Inserindo Clientes
INSERT INTO Clientes (nome, telefone, email) VALUES
('João Silva', '11999999999', 'joao.silva@email.com'),
('Maria Oliveira', '11988888888', 'maria.oliveira@email.com');

-- Inserindo Veículos
INSERT INTO Veiculos (placa, modelo, fabricante, ano, id_cliente) VALUES
('ABC-1234', 'Civic', 'Honda', 2020, 1),
('XYZ-9876', 'Corolla', 'Toyota', 2019, 2);

-- Inserindo Serviços
INSERT INTO Servicos (descricao, preco) VALUES
('Troca de óleo', 150.00),
('Alinhamento e balanceamento', 120.00),
('Revisão completa', 600.00);

-- Inserindo Ordens de Serviço
INSERT INTO OrdensServico (data_abertura, status, id_veiculo) VALUES
('2025-01-15', 'Aberta', 1),
('2025-01-16', 'Em Andamento', 2);

-- Inserindo Itens da OS
INSERT INTO ItensOS (id_os, id_servico, quantidade) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1);
