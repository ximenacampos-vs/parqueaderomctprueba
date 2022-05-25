registrosCREATE SCHEMA parqueaderoMCTprueba;
USE parqueaderoMCTprueba;

CREATE TABLE IF NOT EXISTS empleado(
id_empleado VARCHAR(20) NOT NULL PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
email VARCHAR(100) NOT NULL,
tiene_vehiculo enum('Si', 'No') NOt NULL
);


CREATE TABLE IF NOT EXISTS registroV(
placa VARCHAR(10) NOT NULL PRIMARY KEY,
marca VARCHAR(30) NOT NULL,
color VARCHAR(20) NOT NULL,
tipo_V enum('Vehiculo particular', 'Moto', 'Bicicleta')not null,
id_empleado_registro VARCHAR(20) NOT NULL,
modelo varchar(20) not null,
FOREIGN KEY (id_empleado_registro) REFERENCES empleado(id_empleado) 
);

CREATE TABLE IF not exists registroS(
tiene_cupo enum('Si', 'No')not null,
id_empleado_registroS VARCHAR(20) NOT NULL,
FOREIGN KEY (id_empleado_registroS) REFERENCES empleado(id_empleado)
);
select nombre, apellido, email from empleado, registroS where id_empleado = id_empleado_registroS;


CREATE TABLE IF NOT EXISTS registroVC(
placa_cabezote VARCHAR(20) NOT NULL PRIMARY KEY,
placa_trailer VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS empleado_carga(
id_empleado_registro VARCHAR(20) NOT NULL,
UNIQUE KEY unique_id_empleado_registro(id_empleado_registro),
FOREIGN KEY (id_empleado_registro) REFERENCES empleado(id_empleado),
registroVC_registro VARCHAR(20) NOT NULL,
UNIQUE KEY unique_registroVC_registro(registroVC_registro),
FOREIGN KEY (registroVC_registro) REFERENCES registroVC(placa_cabezote)
);

CREATE TABLE IF NOT EXISTS ingreso_carga(
id_ingreso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha_entrada DATETIME,
fecha_salida DATETIME,
id_empleado_carga_ingreso VARCHAR(20) NOT NULL,
FOREIGN KEY (id_empleado_carga_ingreso) REFERENCES empleado_carga(id_empleado_registro),
id_registroVC VARCHAR(20) NOT NULL,
FOREIGN KEY (id_registroVC) REFERENCES empleado_carga(registroVC_registro)
);
