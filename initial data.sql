-- db nutricion
insert into roles (rolname) values ('admin');
insert into roles (rolname)values ('manager');
insert into roles (rolname)values ('lectura');
call creaUsuario('admin','admin','admin','admin','admin','admin','admin','admin');
call creaUsuario('manager','manager','manager','manager','manager','manager','manager','manager');
call creaUsuario('lectura','lectura','lectura','lectura','lectura','lectura','lectura','lectura');
insert into ciclo(nombre) values ('19-2');