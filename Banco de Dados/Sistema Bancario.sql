CREATE DATABASE System_Bancario;
USE System_Bancario;

create table banco (
codigo int NOT NULL,
nome varchar(50) DEFAULT NULL,
PRIMARY KEY (codigo)
);

create table agencia(
cod_banco int DEFAULT NULL,
numero_agencia int NOT NULL,
endereco varchar(50) DEFAULT NULL,
PRIMARY KEY (numero_agencia),
foreign key (cod_banco) REFERENCES banco (codigo)
);

create table cliente (
cpf char(11) NOT NULL,
nome varchar(50) NOT NULL,
sexo char(1) NOT NULL,
endereco varchar(50) DEFAULT NULL,
primary key (cpf),
check (sexo in ('M', 'F'))
);

create table conta (
numero_conta char(7) NOT NULL,
saldo varchar(100) NOT NULL,
tipo_conta varchar(15) DEFAULT NULL,
num_agencia char(4) NOT NULL,
PRIMARY KEY (numero_conta),
foreign key (num_agencia) REFERENCES agencia (numero_agencia)
);

create table historico(
cpf_cliente char(14) NOT NULL,
num_conta char(9) NOT NULL,
data_inicio date DEFAULT NULL,
PRIMARY KEY (cpf_cliente,num_conta),
foreign key (cpf_cliente) REFERENCES cliente (cpf),
foreign key (num_conta) REFERENCES conta (numero_conta)
);

create table telefone_cliente(
cpf_cli char(14) NOT NULL,
telefone char(14) NOT NULL,
PRIMARY KEY (cpf_cli, telefone),
foreign key (cpf_cli) REFERENCES cliente (cpf)
);

insert into banco(codigo, nome) values ('1', 'banco do brasil');
insert into banco(codigo, nome) values ('4', 'CEF');

insert into agencia(numero_agencia, endereco, cod_banco) values ('322', 'Av. Walfredo Macedo Brandao, 1139', '4');
insert into agencia(numero_agencia, endereco, cod_banco) values ('1253', 'R. Bancario Sergio Guerra, 17', '1');

insert into cliente(cpf, nome, sexo, endereco) values ('111.222.333-44', 'Matheus Farias', 'M', 'Rua Jose Firmino Ferreira, 1050');
insert into cliente(cpf, nome, sexo, endereco) values ('666.777.888-99', 'Alvaro George', 'M', 'Av. Epitacio Pessoa, 1008');
insert into cliente(cpf, nome, sexo, endereco) values ('555.444.777.33', 'Bruna Andrade', 'F', 'Rua Bancario Sergio Guerra, 640');

-- alter table cliente modify cpf char(15); Utilizado pra modificar o tamanho de caracteres do cpf.

insert into conta(numero_conta, saldo, tipo_conta, num_agencia) values ('11765-2', '22.745.05', '2', '322');
insert into conta(numero_conta, saldo, tipo_conta, num_agencia) values ('21010-7', '3.100.96', '1', '1253');

insert into historico(cpf_cliente, num_conta, data_inicio) values ('111.222.333-44', '11765-2', '22.12.2015');
insert into historico(cpf_cliente, num_conta, data_inicio) values ('666.777.888-99', '11765-2', '05.10.2016');
insert into historico(cpf_cliente, num_conta, data_inicio) values ('555.444.777-3', '21010-7', '29.08.2012');

insert into telefone_cliente(cpf_cli, telefone) values ('111.222.333-44', '(83) 3222-1234');
insert into telefone_cliente(cpf_cli, telefone) values ('666.777.888-99', '(83) 9944-999');
insert into telefone_cliente(cpf_cli, telefone) values ('666.777.888-99', '(83) 3233-2267');

alter table cliente add column pais char(3) default('BRA');
-- alter table cliente add column email varchar(50);  Linha não executada.
