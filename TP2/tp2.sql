create database tp2;


use tp2;

create table if not exists vet_mascota(
id_mascota int auto_increment primary key,
idcliente int not null,
idhistorial int not null,
idturno int not null,
idfarmacia int not null,
nombre varchar(50),
tipo varchar(50),
raza varchar(50),
fecha_nac date,
peso float,
foreign key(idcliente) references vet_usuario(id_cliente),
foreign key(idhistorial) references vet_historial(id_historial),
foreign key(idturno) references vet_turno(id_turno),
foreign key(idfarmacia) references vet_farmacia(id_farmacia)
);

create table if not exists vet_usuario(
id_cliente int auto_increment primary key,
idcliente int,
nombre varchar(50),
apellido varchar(50),
mail varchar(100),
tel varchar(50),
direccion varchar(100),
dni int
);

create table if not exists vet_farmacia(
id_farmacia int auto_increment primary key,
farmacos varchar(50),
prospecto varchar(200),
precio decimal (5),
stock int
);

create table if not exists vet_historial(
id_historial int auto_increment primary key,
fecha date,
enf_padecido varchar(50),
observaciones varchar(360)
);

create table if not exists vet_turno(
id_turno int auto_increment primary key,
fecha date,
hora time,
motivo_consulta varchar(100)
);

show tables;
describe vet_mascota;
describe vet_turno;
describe vet_farmacia;
describe vet_usuario;
describe vet_historial;

drop table vet_historial;
drop table vet_mascota;
drop table vet_usuario;

show columns from vet_farmacia;
show columns from vet_historial;
show columns from vet_usuario;
show columns from vet_mascota;

select * from vet_farmacia;
select * from vet_historial;
select * from vet_turno;
select * from vet_usuario;

show table status;
