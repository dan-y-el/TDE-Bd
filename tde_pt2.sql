CREATE DATABASE IF NOT EXISTS db_supermercado;

USE db_supermercado;

CREATE TABLE IF NOT EXISTS Venda (
    ID_Venda INT PRIMARY KEY AUTO_INCREMENT,
    Valor_total NUMERIC(10,2) NOT NULL,
    Data DATE,
    fk_Cliente_ID_Cliente INT,
    fk_Caixa_ID_Caixa INT
);

CREATE TABLE IF NOT EXISTS Produto (
    ID_Produto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255),
    Categoria VARCHAR(255),
    Preco DECIMAL(10,2),
    Estoque NUMERIC,
    Codigo VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS ItemVenda (
    ID_ItemVenda INT PRIMARY KEY AUTO_INCREMENT,
    PrecoUnidade NUMERIC(10,2) NOT NULL,
    Quantidade NUMERIC NOT NULL,
    fk_Venda_ID_Venda INT,
    fk_Produto_ID_Produto INT
);

CREATE TABLE IF NOT EXISTS Caixa (
    ID_Caixa INT PRIMARY KEY,
    Funcionario VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Cliente (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Email VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Inclui (
    fk_Venda_ID_Venda INT,
    fk_Produto_ID_Produto INT,
    PRIMARY KEY (fk_Venda_ID_Venda, fk_Produto_ID_Produto)
);

ALTER TABLE Venda ADD CONSTRAINT FK_Venda_Cliente
    FOREIGN KEY (fk_Cliente_ID_Cliente)
    REFERENCES Cliente (ID_Cliente)
    ON DELETE CASCADE;

ALTER TABLE Venda ADD CONSTRAINT FK_Venda_Caixa
    FOREIGN KEY (fk_Caixa_ID_Caixa)
    REFERENCES Caixa (ID_Caixa)
    ON DELETE RESTRICT;

ALTER TABLE ItemVenda ADD CONSTRAINT FK_ItemVenda_Venda
    FOREIGN KEY (fk_Venda_ID_Venda)
    REFERENCES Venda (ID_Venda)
    ON DELETE RESTRICT;

ALTER TABLE ItemVenda ADD CONSTRAINT FK_ItemVenda_Produto
    FOREIGN KEY (fk_Produto_ID_Produto)
    REFERENCES Produto (ID_Produto)
    ON DELETE RESTRICT;

ALTER TABLE Inclui ADD CONSTRAINT FK_Inclui_Venda
    FOREIGN KEY (fk_Venda_ID_Venda)
    REFERENCES Venda (ID_Venda)
    ON DELETE RESTRICT;

ALTER TABLE Inclui ADD CONSTRAINT FK_Inclui_Produto
    FOREIGN KEY (fk_Produto_ID_Produto)
    REFERENCES Produto (ID_Produto)
    ON DELETE RESTRICT;


INSERT INTO Cliente (Nome, Telefone, Endereco, Email) VALUES
('Maria Silva', '123456789', 'Rua A, 123', 'maria@example.com'),
('João Pereira', '987654321', 'Rua B, 456', 'joao@example.com'),
('Ana Costa', '456123789', 'Rua C, 789', 'ana@example.com'),
('Pedro Santos', '987654321', 'Avenida X, 456', 'pedro@example.com'),
('Carla Oliveira', '123987456', 'Rua Y, 789', 'carla@example.com');

INSERT INTO Caixa (ID_Caixa, Funcionario) VALUES
(1, 'Carlos Souza'),
(2, 'Fernanda Lima'),
(3, 'Mariana Souza'),
(4, 'Gabriel Lima');

INSERT INTO Venda (Valor_total, Data, fk_Cliente_ID_Cliente, fk_Caixa_ID_Caixa) VALUES
(27.00, '2024-05-21', 1, 1),
(18.00, '2024-05-21', 2, 2),
(16.00, '2024-05-21', 3, 1),
(40.00, '2024-05-22', 2, 3),
(12.50, '2024-05-22', 4, 4);

INSERT INTO Produto (Nome, Categoria, Preco, Estoque, Codigo) VALUES
('Shampoo', 'Higiene Pessoal', 10.99, 100, 'SHM001'),
('Sabonete', 'Higiene Pessoal', 1.99, 200, 'SBN002'),
('Pasta de Dente', 'Higiene Pessoal', 3.49, 150, 'PDT003'),
('Desodorante', 'Higiene Pessoal', 8.49, 120, 'DES004'),
('Escova de Dente', 'Higiene Pessoal', 2.99, 180, 'ESC005'),
('Pizza Congelada', 'Congelados', 15.99, 80, 'PZC006'),
('Sorvete', 'Congelados', 12.49, 90, 'SRV007'),
('Peixe Congelado', 'Congelados', 18.99, 60, 'PXC008'),
('Vegetais Congelados', 'Congelados', 6.99, 100, 'VGC009'),
('Lasanha Congelada', 'Congelados', 13.49, 70, 'LSC010');

INSERT INTO Produto (Nome, Categoria, Preco, Estoque, Codigo) VALUES
('Detergente', 'Limpeza Doméstica', 4.99, 200, 'DET011'),
('Água Sanitária', 'Limpeza Doméstica', 3.49, 150, 'ASN012'),
('Esponja de Limpeza', 'Limpeza Doméstica', 1.99, 250, 'ESL013'),
('Limpador Multiuso', 'Limpeza Doméstica', 7.99, 180, 'LMP014'),
('Amaciante de Roupas', 'Limpeza Doméstica', 9.99, 170, 'AMC015'),
('Filé de Frango', 'Carnes e Peixes', 19.99, 50, 'FLF016'),
('Bife Bovino', 'Carnes e Peixes', 24.99, 40, 'BFB017'),
('Salmão', 'Carnes e Peixes', 29.99, 30, 'SAL018'),
('Camarão', 'Carnes e Peixes', 34.99, 25, 'CMR019'),
('Costela Suína', 'Carnes e Peixes', 21.49, 35, 'CST020'),
('Almofada', 'Casa e Decoração', 25.99, 60, 'ALF021'),
('Vaso de Planta', 'Casa e Decoração', 15.99, 80, 'VPL022'),
('Quadro Decorativo', 'Casa e Decoração', 45.49, 20, 'QDR023'),
('Cortina', 'Casa e Decoração', 39.99, 30, 'CTN024'),
('Tapete', 'Casa e Decoração', 59.99, 40, 'TPT025');


INSERT INTO ItemVenda (PrecoUnidade, Quantidade, fk_Venda_ID_Venda, fk_Produto_ID_Produto) VALUES
(5.50, 2, 1, 1),
(6.00, 1, 1, 2),
(8.00, 1, 2, 4),
(15.00, 1, 2, 3),
(5.50, 1, 3, 1),
(6.00, 1, 3, 2),
(3.50, 2, 4, 5),
(8.00, 1, 4, 6),
(4.50, 1, 5, 7);

SELECT ID_Produto FROM Produto;

select * from produto;

DELETE FROM Produto WHERE ID_Produto = 31;

SELECT AUTO_INCREMENT
FROM information_schema.tables
WHERE table_name = 'Produto'
  AND table_schema = DATABASE();
  
alter table Produto auto_increment = 27;

select * from caixa;

select * from cliente;

select * from  inclui;

select * from itemvenda;

select * from  produto;

select * from venda;

SELECT Nome FROM Cliente;

SELECT Nome, Categoria FROM Produto;

SELECT * FROM Produto
WHERE ID_Produto > 2 AND NOT Preco < 10.00;

SELECT * FROM Produto
ORDER BY Nome ASC;

SELECT Nome, Preco
FROM Produto
WHERE Categoria = 'Congelados';

SELECT * FROM Produto
WHERE ID_Produto > 2 AND Estoque < 100;

SELECT * FROM Produto
WHERE ID_Produto > 2 OR Estoque < 100;

SELECT * FROM Venda
WHERE ID_Venda > 2 AND NOT fk_Cliente_ID_Cliente < 3;

SELECT Cliente.Nome, Venda.Valor_total
FROM Venda
JOIN Cliente ON Venda.fk_Cliente_ID_Cliente = Cliente.ID_Cliente;

SELECT Caixa.Funcionario, Venda.Valor_total
FROM Venda
JOIN Caixa ON Venda.fk_Caixa_ID_Caixa = Caixa.ID_Caixa
WHERE Caixa.ID_Caixa = 4;  

SELECT fk_Caixa_ID_Caixa, COUNT(*) AS Total_Vendas
FROM Venda
GROUP BY fk_Caixa_ID_Caixa;

SELECT fk_Caixa_ID_Caixa, COUNT(*) AS Total_Vendas
FROM Venda
GROUP BY fk_Caixa_ID_Caixa
ORDER BY Total_Vendas DESC
LIMIT 4;

SELECT fk_Caixa_ID_Caixa, MAX(Valor_total) AS Maior_Venda
FROM Venda
GROUP BY fk_Caixa_ID_Caixa
ORDER BY Maior_Venda DESC;

SELECT SUM(Valor_total) AS Total_Vendas
FROM Venda;

SELECT fk_Caixa_ID_Caixa, SUM(Valor_total) AS Total_Vendas
FROM Venda
GROUP BY fk_Caixa_ID_Caixa;

select * from inclui;

INSERT INTO Inclui (fk_Venda_ID_Venda, fk_Produto_ID_Produto) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(4, 5),
(4, 6),
(5, 7);

Insert into Inclui (fk_Venda_ID_Venda, fk_Produto_ID_Produto) Values
(6, 8),
(6, 9),
(7, 10),
(7, 11),
(8, 12),
(8, 13),
(9, 14),
(9, 15),
(10, 16),
(10, 17);

select * from inclui;

select * from itemvenda;

SELECT Venda.ID_Venda, Produto.Nome
FROM Venda
JOIN Inclui ON Venda.ID_Venda = Inclui.fk_Venda_ID_Venda
JOIN Produto ON Inclui.fk_Produto_ID_Produto = Produto.ID_Produto;

SELECT ItemVenda.ID_ItemVenda, Produto.Nome
FROM ItemVenda
JOIN Produto ON ItemVenda.fk_Produto_ID_Produto = Produto.ID_Produto;

INSERT INTO ItemVenda (PrecoUnidade, Quantidade, fk_Venda_ID_Venda, fk_Produto_ID_Produto) VALUES
(15.99, 1, 6, 6),
(12.49, 1, 6, 7),
(18.99, 1, 7, 8),
(6.99, 1, 7, 9),
(19.99, 1, 8, 10),
(24.99, 1, 8, 11),
(29.99, 1, 9, 12),
(34.99, 1, 9, 13),
(21.49, 1, 10, 14),
(25.99, 1, 10, 15);

SELECT Venda.ID_Venda, Produto.Nome, ItemVenda.PrecoUnidade, ItemVenda.Quantidade
FROM Venda
JOIN ItemVenda ON Venda.ID_Venda = ItemVenda.fk_Venda_ID_Venda
JOIN Produto ON ItemVenda.fk_Produto_ID_Produto = Produto.ID_Produto;

select * from itemvenda;














