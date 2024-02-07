create database assinante;

use assinante;

create table assinante (
cd_assinante int not null unique,
nm_assiante varchar(100) not null,
primary key (cd_assinante)
);

create table ramo_atividade (
cd_ramo int not null unique,
ds_ramo varchar(100) not null,
primary key (cd_ramo)
);

create table tipo_assinante (
cd_tipo int not null unique,
ds_tipo varchar(100) not null,
primary key (cd_tipo)
);

create table endereco (
cd_endereco int not null unique,
ds_endereco varchar(15) not null,
complemento varchar(100),
bairro varchar(50)not null,
CEP int(8) not null,
primary key (cd_endereco)
);

create table telefone (
cd_fone int not null unique,
ddd int(2) not null,
n_fone int(9)not null,
primary key (cd_fone)
);

create table municipio (
cd_municipio int not null unique,
ds_municipio varchar(100) not null,
primary key (cd_municipio)
);
