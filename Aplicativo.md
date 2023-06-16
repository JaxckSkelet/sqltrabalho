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
