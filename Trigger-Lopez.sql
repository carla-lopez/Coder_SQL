use tp3;

create table if not exists usuario(
id_usuario int primary key,
nombre varchar (20) not null,
apellido varchar (20) not null,
direccion varchar(50) not null,
mail varchar(50) not null,
tel varchar(25) not null,
dni int not null
);

create table if not exists historial(
id_historial int primary key,
fecha date not null,
enf_padecido varchar(50),
observaciones varchar(250)
);

create table if not exists farmacia(
id_farmacia int primary key,
farmacos varchar(50),
prospecto varchar(100),
precio float not null,
stock int not null
);

create table if not exists turno(
id_turno int primary key,
fecha date not null,
hora time not null,
motivo_consulta varchar(250) not null
);

create table if not exists mascota(
id_mascota int primary key,
idusuario int not null,
idhistorial int not null,
idfarmacia int not null,
idturno int not null,
nombre varchar(20) not null,
tipo varchar(20) not null,
raza varchar(20) not null,
fecha_nac date not null,
peso float not null,
constraint fk_usuario foreign key(idusuario) references usuario(id_usuario),
constraint fk_historial foreign key(idhistorial) references historial(id_historial),
constraint fk_farmacia foreign key(idfarmacia) references farmacia(id_farmacia),
constraint fk_turno foreign key(idturno) references turno(id_turno)
);

show tables;

drop table historial;
drop table farmacia;
drop table mascota;
drop table usuario;
drop table turno;

select * from usuario;

select * from turno;

create VIEW V_Usuario as SELECT nombre,apellido,dni from usuario;

create VIEW V_Farmacia as SELECT farmacos,prospecto from farmacia; 



select * from V_Usuario;

select * from V_Farmacia;

create VIEW V_Cita as SELECT usuario.id_usuario,usuario.nombre,usuario.apellido,usuario.dni,turno.id_turno,turno.fecha,turno.hora,turno.motivo_consulta from usuario,turno WHERE usuario.id_usuario=turno.id_turno;

drop view V_Cita;

select * from V_Cita;

create VIEW V_Receta as SELECT farmacia.id_farmacia,farmacia.farmacos,historial.id_historial,historial.observaciones from farmacia,historial WHERE farmacia.id_farmacia=historial.id_historial;

select * from V_Receta;

create VIEW V_Compra as SELECT usuario.id_usuario,usuario.dni,farmacia.id_farmacia,farmacia.farmacos from usuario,farmacia where usuario.id_usuario=farmacia.id_farmacia;

select * from V_Compra;

drop procedure pa_farmacos_limite_stock;

DELIMITER //

CREATE procedure pa_farmacos_limite_stock()
begin
  select id_farmacia,precio from farmacia
  order by id_farmacia desc, precio asc;
end // 'Procedimiento almacenado donde crea y muestra desde farmacia,
la lista de id farmacia en orden descendiente y la lista precios en orden ascendente'

delimiter ;

call pa_farmacos_limite_stock(); 

drop procedure insertar;

DELIMITER //

create procedure insertar (paranom varchar(50), paraape varchar(50))  
begin
  insert into usuario(nombre,apellido) values (paranom,paraape); 
  end //
  
  delimiter ;
  
  DELIMITER //
  
  create procedure eliminar (in id int)
  begin
  delete from usuario where id_usuario=id;
  end//
  
  delimiter ;


create table logs(
id int primary key,
tabla varchar(50),
accion varchar (200),
usuario varchar(50),
fecha date
);

SELECT * FROM tp3.farmacia;

insert into farmacia values(NULL,'FAFAFAAF','ES FAFAFA', 4000, 1);

select * from farmacia where precio = '4000';

select * from logs;





