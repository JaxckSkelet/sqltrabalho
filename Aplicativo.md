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

CREATE TABLE localização (
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
preço decimal (10,2) not null,
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

