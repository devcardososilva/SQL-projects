create database Escola_SESI
default character set utf8mb4
default collate utf8mb4_general_ci;

/*_________Colaborador__________*/

create table colaborador (
matricula_cola varchar(8) not null unique,
CPF varchar(14) not null unique,
nome varchar(100) not null,
RG varchar(12) not null unique,
data_nasc date not null,
primary key (matricula_cola)
)default charset = utf8mb4;

insert into colaborador
(matricula_cola, CPF, nome, RG, data_nasc)

values

('78451236', '721.895-36', 'Italo Pitagoras', '8.352-76', '1995-08-12'),
('25983746', '482.706-41', 'Gleideson', '9.764-28', '1985-11-28'),
('61349872', '936.124-57', 'Ani', '6.879-52', '1992-07-15');

select * from colaborador;

create table telefone_colaborador (
matricula_cola varchar(8) not null unique,
tipo varchar(15) default 'celular' not null,
numero varchar(15)not null unique,
foreign key (matricula_cola) references colaborador (matricula_cola)
)default charset = utf8mb4;

insert into telefone_colaborador
(matricula_cola, tipo, numero)

values

('78451236', default, '(11) 98765-4321'),
('25983746', default, '(21) 91234-5678'),
('61349872', default, '(47) 99876-5432');

select * from telefone_colaborador;

create table endereco_cola (
matricula_cola varchar(8) not null unique,
rua text not null,
CEP varchar(15) not null,
cidade varchar(50) not null,
estado varchar(10) not null,
complemento text default '',
ponto_ref text not null,
foreign key (matricula_cola) references colaborador (matricula_cola)
)default charset = utf8mb4;

insert into endereco_cola
(matricula_cola, rua, CEP, cidade, estado, complemento, ponto_ref)

values

('78451236', 'Travessa da Esperança', '56789-012', 'Eldorville', 'PE', 'bloco 1', 'Torre
do Horizonte'),

('25983746', 'Avenida do Sol', '98765-432', 'Mariston', 'PE', default, 'Praça das
Fontes'),
('61349872', 'Rua das Flores', '12345-678', 'Silvermont', 'PE', default, 'Parque das
Estrelas');

select * from endereco_cola;

/*___________________________________________________________________*/

create table registra (
id_reg int auto_increment not null unique,
matricula_cola varchar(8) not null unique,
matricula_alu varchar(8) not null unique,
data_hora datetime not null,
primary key (id_reg)
)default charset = utf8mb4;

insert into registra
(matricula_alu, matricula_cola, data_hora)

values

('93782641', '78451236', '2023-11-27 18:20:00'),
('50821963', '25983746', '2023-07-10 14:45:00'),
('12487590', '61349872', '2023-02-15 09:30:00');

select * from registra;

/*_________Aluno__________*/

create table aluno (
matricula_alu varchar(8) not null unique,
CPF varchar(14) not null unique,
nome text not null,
RG varchar(12) not null unique,
data_nasc date not null,
primary key (matricula_alu)
)default charset = utf8mb4;

insert into aluno
(matricula_alu, CPF, nome, RG, data_nasc)

values

('61349872', '521.743-89', 'Pedro Peres', '7.846-04', '2006-08-12'),
('50821963', '935.126-45', 'João Lucas', '2.319-78', '2007-11-28'),
('12487590', '217.384-76', 'Daniel Cândido', '9.754-98', '2007-07-15');

select * from aluno;

create table telefone_aluno (
matricula_alu varchar(8) not null unique,
tipo varchar(15) default 'celular' not null,
numero varchar(15)not null unique,
foreign key (matricula_alu) references aluno (matricula_alu)
)default charset = utf8mb4;

insert into telefone_aluno
(matricula_alu, tipo, numero)

values

('61349872', 'Telefone', '(12) 98455-1121'),
('50821963', 'Telefone', '(61) 91234-9878'),
('12487590', 'Telefone', '(78) 99986-5400');

select * from telefone_aluno;

create table endereco_aluno (
matricula_alu varchar(8) not null unique,
rua text not null,
CEP varchar(15) not null,
cidade varchar(50) not null,
estado varchar(10) not null,
complemento text not null default '',
ponto_ref text not null,
foreign key (matricula_alu) references aluno (matricula_alu)
)default charset = utf8mb4;

insert into endereco_aluno 
(matricula_alu, rua, CEP, cidade, estado, complemento, ponto_ref)

values

('61349872', 'Rua dos Girassóis', '88058-300', 'Nova Gales do Sul', 'PE', default, 'Praça do Horizonte'),
('50821963', 'Avenida das Acácias', '05435-060', 'Renânia do Norte-Vestfália', 'PE', default, 'Praça das igreja'),
('12487590', 'Travessa das Magnólias', '68907-480', 'Texas', 'PE', default, 'Torre das Estrelas');

select * from endereco_aluno;

/*_________________________________________________________
__________*/

create table `responsabiliza-se` (
id_respons int auto_increment not null unique,
CPF_resp varchar(14) not null unique,
matricula_alu varchar(8) not null unique,
primary key (id_respons),
foreign key (CPF_resp) references responsavel(CPF_resp)
)default charset = utf8mb4;

insert into `responsabiliza-se`
(CPF_resp, matricula_alu)

values

('543.928-81', '61349872'),
('122.453-37', '50821963'),
('227.619-94', '12487590');

select * from `responsabiliza-se`;
/*_________Responsavel__________*/

create table responsavel (
CPF_resp varchar(14) not null unique,
nome text not null,
RG varchar(12) not null unique,
data_nasc date not null,
primary key (CPF_resp)
)default charset = utf8mb4;

insert into responsavel
(CPF_resp, nome, RG, data_nasc)

values

('227.619-94', 'Isabella Silva', '9.138-83', '1990-11-03'),
('122.453-37', 'Sofia Rodrigues', '2.463-71', '1985-05-28'),
('543.928-81', 'Gabriel Santos', '5.827-49', '1987-09-12');

select * from responsavel;

create table telefone_responsavel (
CPF_resp varchar(14) not null unique,
tipo varchar(15) default 'celular' not null,
numero varchar(15)not null unique,
foreign key (CPF_resp) references responsavel (CPF_resp)
)default charset = utf8mb4;

insert into telefone_responsavel
(CPF_resp, tipo, numero)

values

('543.928-81', default, '(12) 98455-1121'),
('122.453-37', default, '(61) 91234-9878'),
('227.619-94', default, '(78) 99986-5400');

select * from telefone_responsavel;

create table endereco_responsavel (
CPF_resp varchar(14) not null unique,
rua text not null,
CEP varchar(15) not null,
cidade varchar(50) not null,
estado varchar(10) not null,
complemento text not null default '',
ponto_ref text not null,
foreign key (CPF_resp) references responsavel (CPF_resp)
)default charset = utf8mb4;

insert into endereco_responsavel
(CPF_resp, rua, CEP, cidade, estado, complemento, ponto_ref)

values

('543.928-81', 'Rua dos Girassóis', '88058-300', 'Nova Gales do Sul', 'PE', default,
'Praça do Horizonte'),
('122.453-37', 'Avenida das Acácias', '05435-060', 'Renânia do Norte-Vestfália', 'PE',
default, 'Praça das igreja'),
('227.619-94', 'Travessa das Magnólias', '68907-480', 'Texas', 'PE', default, 'Torre das
Estrelas');

select * from endereco_responsavel;

/*_________________________________________________________
__________*/

create table compoe (
id_compoe int auto_increment not null unique,
matricula_cola varchar(8) not null,
matricula_alu varchar(8) not null unique,
data_hora datetime not null,
primary key (id_compoe)
)default charset = utf8mb4;

insert into compoe
(matricula_alu, matricula_cola, data_hora)

values

('12487590', '61349872', '2023-01-15 09:30:00'),
('50821963', '25983746', '2023-01-15 09:30:00'),
('93782641', '78451236', '2023-01-15 09:30:00');

select * from compoe;

create table sala (
id_sala varchar(3),
andar varchar(7) default 'terrio',
primary key (id_sala)
)default charset = utf8mb4;

insert into sala
(id_sala, andar)

values

('02', default),
('04', 'andar 1'),
('05', 'andar 1');

select * from sala;

create table hospeda (
id_hosp int auto_increment not null unique,
id_turma varchar(4),
id_sala varchar(3),
primary key (id_hosp)
)default charset = utf8mb4;

insert into hospeda
(id_turma, id_sala)

values

('0013', '02'),

('0014', '04'),
('0015', '05');

select * from hospeda;

create table turma (
id_turma varchar(4) not null ,
nome varchar(6) not null,
primary key (id_turma)
)default charset = utf8mb4;
drop table turma;

insert into turma
(id_turma, nome)

values

('0013', '1 anoA'),
('0014', '1 anoB'),
('0015', '2 anoB');

select * from turma;

create table recebe (
id_recebe int auto_increment not null unique,
id_turma varchar(4) not null,
id_aula varchar(3) not null,
data_hora datetime not null,
primary key (id_aula)
)default charset = utf8mb4;

insert into recebe
(id_turma, id_aula, data_hora)

values

('0013', '101', '2023-05-12 11:30:00'),
('0014', '102', '2023-05-12 11:30:00'),
('0015', '103', '2023-05-12 11:30:00');

select * from recebe;

create table aula (
id_aula varchar(3) not null,
id_sala varchar(3) not null,
data_hora datetime not null,
primary key (id_aula)
)default charset = utf8mb4;

insert into aula
(id_aula, id_sala, data_hora)

values

('101', '02', '2023-05-12 11:30:00'),
('102', '02', '2023-05-12 11:30:00'),
('103', '04', '2023-05-12 11:30:00');

select * from aula;

create table professor (
matricula_prof varchar(8) not null unique,
CPF varchar(14) not null unique,
nome text not null,
RG varchar(12) not null unique,
data_nasc date not null,
primary key (matricula_prof)
)default charset = utf8mb4;

insert into professor
(matricula_prof, CPF, nome, RG, data_nasc)

values

('12345678', '568.792-15', 'Iago', '7.823-56', '1990-09-15'),
('98765432', '437.829-77', 'Maura', '4.512-32', '1987-05-03'),
('56789012', '921.654-38', 'Tulio', '9.678-41', '1999-11-28');

select * from professor;

create table telefone_professor (
matricula_prof varchar(14) not null unique,
tipo varchar(15) default 'celular' not null,
numero varchar(15)not null unique,
foreign key (matricula_prof) references professor (matricula_prof)
)default charset = utf8mb4;

insert into telefone_professor
(matricula_prof, tipo, numero)

values

('56789012', default, '(31) 98765-4321'),
('98765432', default, '(41) 91234-5678'),
('12345678', default, '(51) 99876-5432');

select * from telefone_professor;

create table endereco_professor (
matricula_prof varchar(14) not null unique,
rua text not null,
CEP varchar(15) not null,
cidade varchar(50) not null unique,
estado varchar(10) not null,
complemento text not null default '',
ponto_ref text not null,
foreign key (matricula_prof) references professor (matricula_prof)
)default charset = utf8mb4;

insert into endereco_professor
(matricula_prof, rua, CEP, cidade, estado, complemento, ponto_ref)

values

('12345678', 'Travessa da Esperança', '56789-012', 'Venturia', 'PE', default, 'Praça da
Sé'),
('98765432', 'Avenida do Sol', '98765-432', 'Auroria', 'PE', default, 'Torre Eiffel'),
('56789012', 'Rua das Flores', '12345-678', 'Sylvaria', 'PE', default, 'Torre Eiffel');

select * from endereco_professor;

create table ministra (
id_ministra int auto_increment not null,
matricula_prof varchar(8) not null,
id_aula varchar (3) not null,
data_hora datetime not null,
primary key (id_ministra)
)default charset = utf8mb4;

insert into ministra
(matricula_prof, id_aula, data_hora)

values

('12345678', '100', '2023-05-12 11:30:00'),

('98765432', '100', '2023-05-12 11:30:00'),
('56789012', '100', '2023-05-12 11:30:00');

select * from ministra