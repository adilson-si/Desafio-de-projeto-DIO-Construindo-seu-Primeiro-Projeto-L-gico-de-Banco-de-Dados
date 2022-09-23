use ecommerce;

desc cliente;
select * from cliente;
insert into cliente (tipopessoa,cpf,nome,datanascimento,endereco,cidade,estado,cep) 
	values (0,'09999999990','Nome A','1970-12-05','Rua A','Cidade A','Estado A','09999990'),
		   (0,'08888888880','Nome B','1980-10-04','Rua B','Cidade B','Estado B','08888880'),
		   (0,'07777777770','Nome C','1990-07-19','Rua C','Cidade C','Estado C','07777770'),           
           (1,'06666666660','Nome D','2000-03-15','Rua D','Cidade D','Estado D','06666660'),           
           (1,'05555555550','Nome E','1998-08-14','Rua E','Cidade E','Estado E','05555550'),           
           (1,'04444444440','Nome F','1977-02-27','Rua F','Cidade F','Estado F','04444440');

show tables;
desc pessoa_fisica;
           
insert into pessoa_fisica values
    (1,'011111110'),
	(2,'022222220'),
    (3,'033333330');

select * from pessoa_fisica;    

delete from pessoa_fisica where idcliente > 3;

select c.nome,c.cpf,c.tipopessoa,pf.rg from cliente c, pessoa_fisica pf where c.idcliente = pf.idcliente;


desc pessoa_juridica;

insert into pessoa_juridica values
    (4,'0444444444440','Fantasia 4'),
	(5,'0555555555550','Fantasia 5'),
    (6,'0666666666660','Fantasia 6');

select * from pessoa_juridica;   
select c.nome,c.cpf,c.tipopessoa,pj.cnpj,pj.nomefantasia from cliente c, pessoa_juridica pj 
	where c.idcliente = pj.idcliente;
           
desc produto;

select * from produto;

delete from produto where idproduto > 5;

insert into produto (descricao, categoria, valor_unitario, estoque) 
	values
	('Produto A','Categoria A',11.11,111),
	('Produto B','Categoria B',22.11,22),
	('Produto C','Categoria C',33.00,3),
	('Produto D','Categoria D',44.01,444),
	('Produto E','Categoria E',555.50,5);

desc pedido;
    
select * from pedido;

insert into pedido (idcliente,descricao,valor_frete,valor_desconto,data_compra,ativo,pagamento) values
	(2,'Descricao do pedido 2',22.22,0,'2021-02-15',true,'Forma pagamento 22'),
    (5,'Descricao do pedido 5',5.00,.50,'2022-04-25',true,'Forma pagamento 5'),
    (3,'Descricao do pedido 3',13.33,2.00,'2022-05-19',true,'Forma pagamento 3'),
    (4,'Descricao do pedido 4',4.02,4.00,'2021-07-1',true,'Forma pagamento 4');

select p.descricao,p.valor_frete,p.valor_desconto,p.data_compra,p.pagamento, p.ativo, 
	c.idcliente,c.nome from pedido p, cliente c where p.idcliente = c.idcliente;

desc produto_pedido;
select * from produto_pedido;
insert into produto_pedido values 
	(1,4,1),
    (3,4,3),
    (5,1,2),
    (4,5,9),
    (1,3,3),
    (3,2,22);

desc estoque;
select * from estoque;

insert into estoque values
	(5,3,'Local 5',55),
    (4,2,'Local 1',4),
    (2,4,'Local 1',22),
    (3,5,'Local 1',3333);
    
show tables;

desc produto_estoque;

select * from produto_estoque;

insert into produto_estoque values
	(1,4,33),
    (4,2,60),
    (5,3,12),
    (3,5,94);
    
desc fornecedor;
select * from fornecedor;

insert into fornecedor (razao_social,cnpj,contato,tipo_fornecedor) values
	('Razao Social 2','0222222222220','Contato 2',1),
    ('Razao Social 3','0333333333330','Contato 3',1),
    ('Razao Social 4','0444444444440','Contato 4',0),
    ('Razao Social 5','0555555555550','Contato 5',0);
    
desc produto_fornecedor;

select * from produto_fornecedor;

insert into produto_fornecedor values
	(3,3,24),
    (5,1,4),
    (4,2,84);
    
					   