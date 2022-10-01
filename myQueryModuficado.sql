use alquilercanchas;

create table t_ciudad (
id_ciudad int not null primary key auto_increment,
nombre_ciudad varchar(30),
descripcion_ciudad text,
imagen_ciudad varchar(100)
);
insert into t_ciudad values(null,'Abancay','La ciudad de la eterna primavera ya disfruta de los campos deportivos de ultima generacion','https://th.bing.com/th/id/R.1ab5c975936db64bc95c5fe76af28f72?rik=UyhDKg%2fEQyKAiQ&pid=ImgRaw&r=0');
insert into t_ciudad values(null,'Arequipa','La ciudad de la eterna primavera ya disfruta de los campos deportivos de ultima generacion','https://th.bing.com/th/id/OIP.ley1drRWyFDLzjLoxmAfxgHaEq?pid=ImgDet&rs=1');
insert into t_ciudad values(null,'Ayacucho','La ciudad de la eterna primavera ya disfruta de los campos deportivos de ultima generacion','https://th.bing.com/th/id/R.9db815bee1f7c06ab1a40f8f3f54a7c9?rik=NJq2F7vfnF3Bhw&pid=ImgRaw&r=0');
create table t_cancha(
id_cancha int not null primary key auto_increment,
nombre_cancha varchar(50),
imagen_cancha varchar(500),
descripcion_cancha text,
telefono_cancha varchar(10),
direccion_cancha varchar(30),
estado_cancha varchar(10),
encargado_cancha varchar(30),
id_ciudad int not null,
foreign key (id_ciudad) references t_ciudad(id_ciudad)
);
insert into t_cancha values(null,'El Pepe','https://th.bing.com/th/id/R.93f502417faf2d10ab9e565905f58b39?rik=6RigKYxYc3zu%2bA&pid=ImgRaw&r=0','descripcion corta','98765321','av. centenario','1','jose',1);
insert into t_cancha values(null,'Paco','https://th.bing.com/th/id/OIP.rUB1LJAObYyuysR8evdvSgHaFj?pid=ImgDet&w=800&h=600&rs=1','descripcion corta','1134','av. qwr','1','as',2);
insert into t_cancha values(null,'El algo','https://th.bing.com/th/id/R.950d1eecb0df9151d178740ce8aa9fb7?rik=cydGnuGAaLWsTw&pid=ImgRaw&r=0','descripcion corta','333','av. qrr','1','ds',1);
insert into t_cancha values(null,'El aa','url:img','descripcion corta','444444','av. t44','1','yt',2);
insert into t_cancha values(null,'El ddd','url:img','descripcion corta','55555','av. cent323enario','0','qw',2);
create table t_usuario(
id_usuario int not null primary key auto_increment,
nombre_usuario varchar(40),
username_usuario varchar(50) unique,
password_usuario varchar(100)
);
insert into t_usuario values(null,'David','admin','admin');
create table t_cliente(
id_cliente int not null primary key auto_increment,
nombre_cliente varchar(40),
apellido_cliente varchar(50),
celular_cliente varchar(10)
);
insert into t_cliente values(null,'Cliente General','Cliente General','---');

create table t_horario(
id_horario int not null primary key auto_increment,
inicio_horario varchar(10),
fin_horario varchar(10)
);
insert into t_horario values(null,'8:00 am','9:00 am');
insert into t_horario values(null,'9:00 am','10:00 am');
insert into t_horario values(null,'10:00 am','11:00 am');
create table t_reservacion(
id_reservacion int not null primary key auto_increment,
fecha_reservacion date,
precio_reservacion double,
estado_reservacion int,
id_horario int not null,
id_cliente int not null,
id_cancha int not null,
foreign key (id_horario) references t_horario(id_horario),
foreign key (id_cliente) references t_cliente(id_cliente),
foreign key (id_cancha) references t_cancha(id_cancha)
);
insert into t_reservacion values(null,'2022-09-23',20,1,1,1,1);
insert into t_reservacion values(null,'2022-09-24',25,1,1,1,2);
insert into t_reservacion values(null,'2022-09-22',25,1,1,1,2);

/*select re.fecha_reservacion, sum(re.precio_reservacion) as 'precio' from t_reservacion as re
where now()>=re.fecha_reservacion and re.estado_reservacion=1
group by re.fecha_reservacion
desc limit 4;

select ci.nombre_ciudad,count(re.id_reservacion) as 'cantidad' from t_reservacion as re inner join
t_cancha as ca on ca.id_cancha=re.id_cancha inner join
t_ciudad as ci on ci.id_ciudad=ca.id_ciudad
where re.estado_reservacion=1
group by ci.nombre_ciudad;*/

