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

create table ingressos(
ingresso_id int primary key auto_increment,
partida_id int,
setor varchar(50)not null,
preço decimal (10,2) not null,
foreign key (partida_id) references partidas(partida_id)
)default charset = utf8mb4
