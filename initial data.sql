insert into roles (rolname) values ('admin');
insert into roles values (null,'manager');
insert into roles values (null,'lectura');
insert into users values (null,'admin','admin','admin','admin','admin','admin',md5('admin'),(select rol_id from roles where rolname='admin'));

