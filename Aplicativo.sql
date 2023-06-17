create database easyfut
default character set utf8mb4
default collate utf8mb4_general_ci;

create table users(
user_id int not null auto_increment ,
usuario varchar (30) not null,
nome varchar(30) not null,
senha varchar(50) not null,
email varchar(100) not null,
cpf VARCHAR(11) NOT NULL,
rg VARCHAR(9),
PRIMARY KEY(user_id) 
)default charset = utf8mb4;

create table vip (
card_id int not null auto_increment,
user_id int,
numero_cartao VARCHAR(13) NOT null,
desconto_porcentagem int not null,
validade date not null,
PRIMARY KEY(card_id)
)default charset = utf8mb4;

create table partidas (
partida_id int not null auto_increment,
time_casa varchar(100) not null,
time_fora varchar (100) not null,
data_jogo date not null,
estadio varchar(100) not null,
valor_ingresso decimal (10,2) not null,
PRIMARY KEY(partida_id)
)default charset = utf8mb4;

CREATE TABLE local (
  local_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_local VARCHAR(100) NOT NULL,
  endereco VARCHAR(200),
  cidade VARCHAR(100),
  estado VARCHAR(50),
  estadio varchar (100) not null,
  capacidade INT
) DEFAULT CHARSET=utf8mb4;

create table ingressos(
ingresso_id int primary key auto_increment,
partida_id int,
setor varchar(50)not null,
preco decimal (10,2) not null,
foreign key (partida_id) references partidas(partida_id)
)default charset = utf8mb4;

create table compra(
compra_id int primary key auto_increment,
user_id int,
ingresso_id int,
valor decimal (10,2) not null,
data_compra DATETIME NOT NULL,
valor_com_desconto decimal (10,2),
  foreign key (user_id) references users(user_id),
  foreign key (ingresso_id) references ingressos(ingresso_id)
) DEFAULT CHARSET=utf8mb4;

create table detalhes_compra(
detalhes_id int primary key auto_increment,
compra_id int,
forma_pagamento varchar(60) not null,
status_pagamento varchar(20) not null,
data_pagamento date,
status_pedido varchar (20), 
obs text,
FOREIGN KEY (compra_id) REFERENCES compra(compra_id)
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE detalhes_ingresso (
  detalhe_id int primary key auto_increment,
  compra_id INT,
  ingresso_id INT,
  codigo_barras varchar (50) not null,
  data_entrada datetime,
  foreign key (compra_id) references compra(compra_id),
  foreign key (ingresso_id) references ingressos(ingresso_id)
) DEFAULT CHARSET=utf8mb4;

CREATE TABLE historico_compras (
  compra_id INT PRIMARY KEY,
  user_id INT,
  partida_id INT,
  quantidade_ingressos INT,
  valor_total DECIMAL(10,2),
  data_compra DATETIME,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (partida_id) REFERENCES partidas(partida_id)
) DEFAULT CHARSET=utf8mb4;


insert into users
(usuario,nome,Senha, email, cpf, rg)
values
('Jorge','Jorjão', '1234567e8',	'jorgin@email.com',	'12222222222','222222221'),
('Arthur Gaspar', 'Arthur', '5489480', 'gaspar@email.com', '61610163036', '142627197'),
('rafael', 'rafael', '5489880', 'rafa@email.com', '61645663036', '132624597');



insert into vip 
(user_id,numero_cartao,desconto_porcentagem,validade)
values
('4545', '1234567881234', '50', '2023-02-02'),
('4546', '1237567881234', '50', '2023-02-05'),
('4547', '1234567881434', '50', '2023-02-02'),
('4557', '1234567881234', '50', '2023-03-02'),
('4576', '1537567881234', '50', '2023-02-05'),
('4548', '1234567881434', '50', '2023-02-02');

insert into partidas
(time_casa,time_fora,data_jogo,estadio,valor_ingresso)
values
('Atletico', 'Cruzeiro', '2023-05-06', 'Mineirão', '50,00'),
('Cruzeiro', 'Atletico', '2023-10-06', 'Mineirão', '50,00'),
('America', 'Cruzeiro', '2023-12-06', 'Mineirão', '50,00');


insert into local
(nome_local,endereco,cidade,estado,estadio,capacidade)
values
('Estadio de futebol', 'Av. Antônio Abrahão Caram, 1001', 'Belo Horizonte','Minas Gerais', 'Mineirão', '61927'),
('Estadio de futebol', 'Av. Antônio Abrahão Caram, 1001', 'Belo Horizonte','Minas Gerais', 'Mineirão', '61927'),
('Estadio de futebol', 'R. Pitangui, 3230  Horto', 'Belo Horizonte','Minas Gerais', 'independência','23000');

insert into ingressos
(partida_id,setor,preço)
values

(1, 'Setor A', 50.00),
(2, 'Setor B', 40.00),
(3, 'Setor C', 60.00);


INSERT INTO compra (user_id, valor, data_compra, valor_com_desconto)
VALUES 
(1, 50.00, '2023-06-15', 25.00),
(1, 40.00, '2023-06-15', 20.00),
(1, 60.00, '2023-06-15', 25.00);


INSERT INTO detalhes_compra 

(compra_id,forma_pagamento,status_pagamento,data_pagamento,status_pedido,obs)
values(1,'cartão', 'aprovado', '2023-05-06', 'disponivel', null),
(1,'cartão', 'aprovado', '2023-09-06', 'disponivel para uso', null),
(1,'boleto', 'pendente', '2023-06-16', 'aguardando pagamento', null);

INSERT INTO detalhes_ingresso

(compra_id,ingresso_id,codigo_barras,data_entrada)

values(1,1,'894946189498448978947','2023-05-06'),
      (1,2,'894946189498448978947','2023-10-06'),
      (1,3,'894946189498448978947','2023-10-06');
