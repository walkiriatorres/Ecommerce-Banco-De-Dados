CREATE DATABASE Ecommerce;

CREATE TABLE Admin (
	id_admin integer PRIMARY KEY,
	nome_sobrenome VARCHAR(255) NOT NULL
);

CREATE TABLE Produto (
	id_produto INTEGER PRIMARY KEY,
	nome_sobrenome VARCHAR(255) NOT NULL,
	grupo VARCHAR(255),
	subgrupo VARCHAR(255),
	preco DECIMAL NOT NULL,
    id_admin_fk INTEGER,
    FOREIGN KEY (id_admin_fk) REFERENCES Admin(id_admin)
);

CREATE TABLE Convidado (
    id_convidado INTEGER PRIMARY KEY,
    nome_sobrenome VARCHAR(255) NOT NULL
);

CREATE TABLE Produto_Convidado (
    id_convidado_fk INTEGER,
    id_produto_fk INTEGER,
    PRIMARY KEY (id_convidado_fk, id_produto_fk),
    FOREIGN KEY (id_convidado_fk) REFERENCES Convidado(id_convidado),
    FOREIGN KEY (id_produto_fk) REFERENCES Produto(id_produto)
);

CREATE TABLE Cliente (
    id_cliente INTEGER PRIMARY KEY,
    nome_sobrenome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20)    
);

CREATE TABLE Carrinho (
    id_carrinho INTEGER PRIMARY KEY,
    numero_produto INTEGER,
    preço_total DECIMAL,
    data DATE,    
    id_cliente_fk INTEGER,
    FOREIGN KEY (id_cliente_fk) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Produto_Carrinho (
	id_produto_comprado INTEGER PRIMARY KEY,
	quantidade INTEGER,
    id_produto_fk INTEGER,
    id_carrinho_fk INTEGER,
    FOREIGN KEY (id_produto_fk) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_carrinho_fk) REFERENCES Carrinho(id_carrinho)
);

CREATE TABLE Pagamento (
    id_pagamento INTEGER PRIMARY KEY,    
    tipo_cartao VARCHAR(100),
    numero_cartao VARCHAR(16),
    id_cliente_fk INTEGER,
    FOREIGN KEY (id_cliente_fk) REFERENCES Cliente(id_cliente)
);