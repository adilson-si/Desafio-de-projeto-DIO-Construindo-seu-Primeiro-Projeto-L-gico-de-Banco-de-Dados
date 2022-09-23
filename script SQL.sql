-- criação do banco de dados para o cenário de e-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criação tabela cliente
create table cliente (
	idcliente int auto_increment primary key,
    tipopessoa tinyint,
    cpf char(11) not null,
    nome varchar(40) not null,
    datanascimento date not null,
    endereco varchar(70),
    cidade varchar(50),
    estado varchar(30),
    cep char(8),
    complemento varchar(45),    
    constraint unique_cpf_cliente unique (cpf)
 );

alter table cliente auto_increment=1;

desc cliente;

-- criação tabela pessoa_fisica
create table pessoa_fisica (
    idcliente int primary key,
    rg varchar(15),
    constraint pf_cliente foreign key (idcliente) references cliente(idcliente)
);

-- criação tabela pessoa_juridica
create table pessoa_juridica (
    idcliente int primary key,
    cnpj char(13),
    nomefantasia varchar(50),
	constraint pj_cliente foreign key (idcliente) references cliente(idcliente)
);

-- criação tabela produto
create table Produto (
	idproduto int auto_increment primary key,
    descricao varchar(45) not null,
    categoria varchar(45),
    valor_unitario float not null,
    estoque int        
 );
 
 alter table produto auto_increment=1;

-- criação tabela pedido
create table Pedido (
	idpedido int auto_increment primary key,
    idcliente int,
    descricao varchar(50) not null,    
    valor_frete float,
    valor_desconto float,
    data_compra date,
    ativo boolean,
    pagamento varchar(50),
	status_entrega enum('Em andamento', 'Processando', 'Enviado', 'Entregue') default 'Processando',
	constraint fk_pedido_cliente foreign key (idcliente) references cliente(idcliente)
);    
    
alter table pedido auto_increment=1;

desc pedido;

-- drop table estoque;

-- criação tabela estoque
create table estoque (
	idproduto int,
	idestoque int primary key,
    local varchar(50),
    quantidade int
);

-- criação tabela fornecedor
create table fornecedor (
	idfornecedor int auto_increment primary key,
    razao_social varchar(50) not null,
    cnpj char(13) not null,
    contato char(11) not null,
    tipo_fornecedor tinyint,
    constraint unique_cnpj_fornecedor unique (cnpj)
);

alter table fornecedor auto_increment=1;

desc fornecedor;

-- criação tabela produto_fornecedor - fornecedor/vendedor disponibiliza produto
create table produto_fornecedor (
	idfornecedor int,
    idproduto int,
    quantidade int not null default 1,
    constraint chave primary key (idproduto, idfornecedor),
    constraint fk_produto_fornecedor foreign key (idfornecedor) references fornecedor(idfornecedor),
	constraint fk_produto_produto foreign key (idproduto) references produto(idproduto)
);    

-- criação tabela produto_pedido
create table produto_pedido (
    idproduto int,
	idpedido int,    
    quantidade int not null default 1,
    constraint chave primary key (idproduto, idpedido),
    constraint fk_produto_pedido foreign key (idpedido) references pedido(idpedido),
	constraint fk2_produto_produto foreign key (idproduto) references produto(idproduto)
);    

-- criação tabela produto_estoque
create table produto_estoque (
    idproduto int,
	idestoque int,    
    quantidade int,
    constraint chave primary key (idproduto, idestoque),
    constraint fk_produto_estoque foreign key (idestoque) references estoque(idestoque),
	constraint fk3_produto_produto foreign key (idproduto) references produto(idproduto)
);    

-- show tables;

-- show databases;

-- tem uma tabela no banco de dados information_schema que 
-- mostra as constraints do nosso banco de dados chamada
-- referential_constraints.
-- use information_schema;
-- show tables;

-- desc referential_constraints;

-- select constraint_schema, constraint_name, unique_constraint_name, table_name, referenced_table_name  from referential_constraints where constraint_schema='ecommerce';
