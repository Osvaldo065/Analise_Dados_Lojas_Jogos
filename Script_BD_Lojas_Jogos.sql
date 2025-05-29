-- CREATE DATABASE Lojas_ODJ;
-- USE Lojas_ODJ;
-- SET SQLSAFE_UPDATES = 0;

CREATE TABLE IF NOT EXISTS Cliente(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
 	nome VARCHAR(250) NOT NULL,
  	sobrenome VARCHAR(250) NOT NULL,
  	CPF_CNPJ VARCHAR(15) NOT NULL,
  	rua VARCHAR(250) NOT NULL,
  	numero_rua INT NULL,
  	complemento VARCHAR(250) NULL,
  	bairro VARCHAR(250) NOT NULL,
  	cidade VARCHAR(250) NOT NULL,
  	estado VARCHAR(250) NOT NULL
);

CREATE TABLE IF NOT EXISTS Contato(
	id_contato INT AUTO_INCREMENT PRIMARY KEY,
  	DDD INT NOT NULL,
  	telefone INT(9) not NULL,
  	email VARCHAR(250) NOT NULL,
  	id_cliente INT NOT NULL,
 	CONSTRAINT fk_id_cliente
  	FOREIGN KEY(id_cliente)
  	REFERENCES Cliente(id_cliente)
  	ON UPDATE NO ACTION
  	ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS Produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
  	nomeProduto VARCHAR(250) NOT NULL,
  	descricao VARCHAR(250) NOT NULL,
  	preco DECIMAL(10,5) NOT NULL, 
  	data_lancamento DATETIME NOT NULL,
  	lote INT NOT NULL,
  	id_categoria INT NOT NULL,
  	CONSTRAINT fk_id_categoria
  	FOREIGN KEY(id_categoria)
  	REFERENCES Categoria(id_categoria)
  	ON UPDATE NO ACTION
  	ON DELETE NO ACTION,
  	id_desenvolvedora INT NOT NULL,
  	CONSTRAINT fk_id_desenvolvedora
  	FOREIGN KEY(id_desenvolvedora)
  	REFERENCES Desenvolvedora(id_desenvolvedora)
  	ON UPDATE NO ACTION
  	ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS Desenvolvedora(
  id_desenvolvedora INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(250) NOT NULL,
  pais_origem VARCHAR(250) NOT NULL
);

CREATE TABLE IF NOT EXISTS Categoria(
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  	nome VARCHAR(250) NOT NULL,
  	faixa_etaria VARCHAR(250) NOT NULL
);

CREATE TABLE IF NOT EXISTS Plataformas_jogos(
	id_plataformas INT AUTO_INCREMENT PRIMARY KEY,
  	nome VARCHAR(250) NOT NULL,
  	idProduto INT NOT NULL,
  	CONSTRAINT fk_Idproduto
  	FOREIGN KEY(idProduto)
  	REFERENCES Produtos(id_produto)
  	ON DELETE NO ACTION
  	ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS estoque_produtos(
 	id_estoqueProdutos INT AUTO_INCREMENT PRIMARY KEY,
  	PedidosId INT NOT NULL,
  	CONSTRAINT fk_PedidosId
  	FOREIGN KEY(PedidosId)
  	REFERENCES Pedidos(id_pedidos)
  	ON UPDATE NO ACTION
  	ON DELETE NO ACTION,
  	ProdutosId INT NOT NULL,
  	CONSTRAINT fk_ProdutosId
  	FOREIGN KEY(ProdutosId)
  	REFERENCES Produtos(id_produto)
  	ON DELETE NO ACTION 
  	ON UPDATE NO ACTION, 
  	quantidade INT NOT NULL
 );


CREATE TABLE IF NOT EXISTS Pedidos(
  id_pedidos INT AUTO_INCREMENT PRIMARY KEY,
  ClienteId INT NOT NULL,
  CONSTRAINT fk_idcliente
  FOREIGN KEY(ClienteId)
  REFERENCES Cliente(id_cliente)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION,
  IDproduto INT NOT NULL,
  CONSTRAINT fk_IDProdutos
  FOREIGN KEY(IDproduto)
  REFERENCES Produtos(id_produto)
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION,
  nomeProduto VARCHAR(250) NOT NULL,
  nomeDesenvolvedora VARCHAR(250) NOT NULL,
  dataPagamento DATETIME NOT NULL,
  valorPago DECIMAL(10,5) NOT NULL
);

CREATE TABLE IF NOT EXISTS Pagamentos(
  id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
  IDPedido INT NOT NULL,
  CONSTRAINT fk_IDPedido
  FOREIGN KEY(IDPedido)
  REFERENCES Pedidos(id_pedidos)
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION,
  ClienteID INT NOT NULL,
   CONSTRAINT fk_ClienteID
  FOREIGN KEY(ClienteID)
  REFERENCES Cliente(id_cliente)
  ON DELETE NO ACTION 
  ON UPDATE NO ACTION,
  dataPagamento DATETIME NOT NULL,
  valorUnitario DECIMAL(10,5) NOT NULL,
  valorDesconto DECIMAL(10,5) NULL,
  valorTotalPago DECIMAL(10,5) NOT NULL,
  tipoPagamento VARCHAR(50) NOT NULL,
  chavePix VARCHAR(400) NULL,
  codBoleto VARCHAR(400) NULL,
  tipocartao VARCHAR(250) NULL,
  parcelas INT NULL,
  statusPagamento INT NOT NULL 
);


