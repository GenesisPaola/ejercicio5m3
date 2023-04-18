# Parte 1: Crear entorno de trabajo
#- Crear una base de datos
#- Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada.

create database trabajo_grupal5; 

create user telovendo identified by 'Trabajo5.'; 
grant all privileges on trabajo_grupal5 to telovendo; 


#Parte 2: Crear dos tablas.
#- La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido,
# contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).

CREATE TABLE usuarios (
    ID_usuario int auto_increment PRIMARY KEY,
    Nombre VARCHAR(40),
    Apellido VARCHAR(40),
    contraseña VARCHAR(100),
    zona_horaria varchar(18) default 'UTC-3',
    Genero varchar(20),
    telefono varchar(11)
    );

#- La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los
# usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la
# fecha-hora actual)).

create table ingreso_usuarios (
id_ingreso varchar(40),
id_usuario int,  
fecha_hora_ingreso datetime default now(),
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

#Parte 3: Modificación de la tabla
#- Modifique el UTC por defecto.Desde UTC-3 a UTC-2.

ALTER TABLE `trabajo_grupal5`.`usuarios` 
CHANGE COLUMN `zona_horaria` `zona_horaria` VARCHAR(18) NULL DEFAULT 'UTC-2' ;

#Parte 4: Creación de registros.
#- Para cada tabla crea 8 registros.

INSERT INTO usuarios (Nombre, Apellido, contraseña, Genero, telefono) 
VALUES ('Juan', 'Pérez', 'contraseña1', 'Masculino', '555-1234'),
       ('Ana', 'García', 'contraseña2', 'Femenino', '555-5678'),
       ('Pedro', 'Sánchez', 'contraseña3', 'Masculino', '555-9012'),
       ('María', 'Rodríguez', 'contraseña4', 'Femenino', '555-3456'),
       ('Luis', 'Martínez', 'contraseña5', 'Masculino', '555-7890'),
       ('Sofía', 'Hernández', 'contraseña6', 'Femenino', '555-2345'),
       ('Javier', 'González', 'contraseña7', 'Masculino', '555-6789'),
       ('Carla', 'López', 'contraseña8', 'Femenino', '555-0123');
       
INSERT INTO ingreso_usuarios (id_ingreso, id_usuario)
VALUES ('ingreso_1', 1),
       ('ingreso_2', 2),
       ('ingreso_3', 3),
       ('ingreso_4', 4),
       ('ingreso_5', 5),
       ('ingreso_6', 6),
       ('ingreso_7', 7),
       ('ingreso_8', 8);
       
#Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?

# si, porque en este caso usamos el dato correspondiente para cada consulta, ejemplo en el nombre usamos
# varchar, en la feacha datetime. 


#Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono,
# correo electronico).

CREATE TABLE contactos (
    ID_usuario int auto_increment PRIMARY KEY,
    ID_contacto VARCHAR(40),
    telefono VARCHAR(11),
	email varchar(30)
    );

#Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la
#tabla Contactos.

ALTER TABLE contactos ADD CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario);






