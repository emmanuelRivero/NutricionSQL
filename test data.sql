insert into alumno(cuenta,nombre,apellido_paterno,apellido_materno,carrera,desc_carrera,sexo,ciclo_id) values (14184317, 'Emmanuel Alberto','Rivero', 'Frias', 'nutricion','nutricion','M',1);
insert into hospital(nombre,horario,periodo,domicilio) values ('Mi hospitalito','7:00 A 20:00','UNICO','Por ahí');
insert into grupo(nombre,ciclo_id,hospital_id,capacidad) values ('NU06SS',1,1,100);
insert into horario(horario) values ('06:00 18:00');
insert into registro(cuenta, horario_id,grupo_id,ciclo_id) values (14184317,1,1,1);

