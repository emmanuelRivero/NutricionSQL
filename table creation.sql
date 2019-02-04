-- users related tables
drop table IF EXISTS users;
create table users(
	user_id int not null,
	username varchar(200),
	nombres varchar(200),
	apellido_paterno varchar(200),
	apellido_materno varchar(200),
	telefono varchar(50),
	domicilio varchar(200),
	password CHAR(32) not null,
	rol_id int
);

drop table IF EXISTS roles;
create table roles(
	rol_id int not null,
	rolname varchar(200)
);

drop table IF EXISTS alumno;
create table alumno(
	cuenta int not null,
    nombre varchar(200),
    apellido_paterno varchar(200),
    apellido_materno varchar(200),
    domicilo varchar(200),
    telefono varchar(200)
);

drop table IF EXISTS hospital;
create table hospital(
	hospital_id int not null,
	nombre varchar(200),
	telefono varchar(200),
	responsbale varchar(200),
	domicilio varchar(200)
);

drop table IF EXISTS ciclo;
create table ciclo(
	ciclo_id int not null,
    nombre varchar(50)
);

drop table IF EXISTS grupo;
create table grupo(
	grupo_id int not null,
	nombre varchar(50),
	ciclo_id int
); 

drop table IF EXISTS horario;
create table horario(
	horario_id int not null,
    dias_semana varchar(50),
    pedrio varchar(50),
    horario varchar(50),
    hospital_id int,
    grupo_id int
); 

drop table IF EXISTS registro;
create table registro(
	registro_id int not null,
	cuenta int not null,
	horario_id int
);

-- primary keys & auto increment
alter table users add constraint PK_users_user_id primary key (user_id);
alter table users MODIFY user_id int not null auto_increment;


alter table roles add constraint PK_roles_rol_id primary key (rol_id);
alter table roles MODIFY rol_id int not null auto_increment;

alter table alumno add constraint PK_alumno_cuenta primary key (cuenta);

alter table hospital add constraint PK_hospital_hospital_id primary key (hospital_id);
alter table hospital MODIFY hospital_id int not null auto_increment;

alter table ciclo add constraint PK_ciclo_ciclo_id primary key (ciclo_id);
alter table ciclo MODIFY ciclo_id int not null auto_increment;

alter table grupo add constraint PK_grupo_grupo_id primary key (grupo_id);
alter table grupo MODIFY grupo_id int not null auto_increment;

alter table horario add constraint PK_horario_horario_id primary key (horario_id);
alter table horario MODIFY horario_id int not null auto_increment;

alter table registro add constraint PK_registro_registro_id primary key (registro_id);
alter table registro MODIFY registro_id int not null auto_increment;

-- foreing keys

alter table users add constraint FK_users_rol_id FOREIGN KEY (rol_id) REFERENCES roles(rol_id);
alter table grupo add constraint FK_grupo_ciclo_id FOREIGN KEy (ciclo_id) REFERENCES ciclo(ciclo_id);
alter table horario add constraint FK_horario_hospital_id FOREIGN KEy (hospital_id) REFERENCES hospital(hospital_id);
alter table horario add constraint FK_horario_grupo_id FOREIGN KEy (grupo_id) REFERENCES grupo(grupo_id);
alter table registro add constraint FK_registro_cuenta FOREIGN KEy (cuenta) REFERENCES alumno(cuenta);
alter table registro add constraint FK_registro_horario_id FOREIGN KEy (horario_id) REFERENCES horario(horario_id);

