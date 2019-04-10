-- db nutricion
-- funcion autentificacion 
use nutricion;
DELIMITER //
DROP function IF EXISTS autenticaUsuario //
CREATE function autenticaUsuario(authusuario VARCHAR(100),authcontraseña VARCHAR(100)) returns int
READS SQL DATA
DETERMINISTIC
BEGIN
	declare V_ID_USUARIO INT(11);
    declare V_CONTRASEÑA VARCHAR(255);
    declare RESULTADO int(1);
	set V_ID_USUARIO = (select user_id from users where username = authusuario AND active = 1);
    set V_CONTRASEÑA = (select password from users where user_id = V_ID_USUARIO);
    
	if V_CONTRASEÑA is NULL THEN
		set RESULTADO=2;
    ELSEIF V_CONTRASEÑA = md5(authcontraseña) THEN 
		set RESULTADO=1;
    ELSE 
		set RESULTADO=0;
    END IF;
    RETURN RESULTADO;
END;
//

-- crea nuevo usuario
DELIMITER //
DROP procedure IF EXISTS creaUsuario //
CREATE procedure creaUsuario(
	in newUsername varchar(200),
	in newNombres varchar(200),
	in newApellido_paterno varchar(200),
	in newApellido_materno varchar(200),
	in newTelefono varchar(50),
	in newDomicilio varchar(200),
	in newPassword varchar(200),
	in newRol varchar(200))
BEGIN
        
    INSERT INTO users(
    username,
    nombres,
    apellido_paterno,
    apellido_materno,
    telefono,
    domicilio,
    password,
    rol_id) 
    VALUES(
    newUsername,
    newNombres,
    newApellido_paterno,
    newApellido_materno,
    newTelefono,
    newDomicilio,
    md5(newPassword),
    (select rol_id from roles where rolname=newRol));
    
	COMMIT;
    
END;
//