/*1*/
/*COMANDOS USADOS EN SHELL DE MYSQL*/
/*1.1*/
CREATE DATABASE VALDIVIA;
USE VALDIVIA;
CREATE TABLE PERSONA(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ->nombre VARCHAR(60),
    ->edad INT NOT NULL);
CREATE TABLE DESPLAZARSE(idD INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ->latitud FLOAT,
    ->longitud FLOAT,
    ->id_rut INT NOT NULL,
    ->fecha DATETIME);
ALTER TABLE DESPLAZARSE ADD CONSTRAINT fk_id_rut FOREIGN KEY (id_rut) REFERENCES PERSONA(id);
CREATE TABLE LUGARDEINTERES(idLugar INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ->nombre VARCHAR(60),
    ->descripcion VARCHAR(200),
    ->categoria VARCHAR(60),
    ->latitud FLOAT,
    ->longitud FLOAT);
/*1.2*/
INSERT INTO PERSONA (id,nombre,edad) VALUES (17372,'ksdla',122);
INSERT INTO PERSONA (id,nombre,edad) VALUES (183923,'X',12);
INSERT INTO PERSONA (id,nombre,edad) VALUES (4343322,'IAIJD',22);
INSERT INTO PERSONA (id,nombre,edad) VALUES (183923891,'bodoque',234);
INSERT INTO PERSONA (id,nombre,edad) VALUES (2147483647,'OPSAO',24);

INSERT INTO DESPLAZARSE (idD,latitud,longitud,id_rut,fecha) VALUES (23,34.56,23.12,17372,'2006-12-12 00:01:02');
INSERT INTO DESPLAZARSE (idD,latitud,longitud,id_rut,fecha) VALUES (24,34.56,23.12,17372,'2006-12-12 00:03:02');
INSERT INTO DESPLAZARSE (idD,latitud,longitud,id_rut,fecha) VALUES (25,34.56,23.12,17372,'2006-12-12 00:04:02');
INSERT INTO DESPLAZARSE (idD,latitud,longitud,id_rut,fecha) VALUES (26,34.56,23.12,17372,'2006-12-13 00:04:02');
INSERT INTO DESPLAZARSE (idD,latitud,longitud,id_rut,fecha) VALUES (27,34.56,23.12,17372,'2006-12-13 00:05:02');

INSERT INTO LUGARDEINTERES (idLugar,nombre,descripcion,categoria,latitud,longitud) VALUES (12312,'casita','una casita','casa',34.12,56.32);
INSERT INTO LUGARDEINTERES (idLugar,nombre,descripcion,categoria,latitud,longitud) VALUES (12342,'arbolito','un arbolito','un arbol',34.21,78.32);
INSERT INTO LUGARDEINTERES (idLugar,nombre,descripcion,categoria,latitud,longitud) VALUES (767562,'casita3','otra casa','casa',3.67,7.56);
INSERT INTO LUGARDEINTERES (idLugar,nombre,descripcion,categoria,latitud,longitud) VALUES (12312321,'anti','un binario como cualquiera','arbol binario',234.67,245.56);
INSERT INTO LUGARDEINTERES (idLugar,nombre,descripcion,categoria,latitud,longitud) VALUES (17657465,'casita2','otra casa','casa',23.67,67.56);
/*1.3*/
/*

*/

/*2*/
/*2.1*/
/*
El objetivo principal de los 'backups'
o respaldos es tener una copia de la base de datos
en caso de alguna emergencia o accidente tales como
fallos de hardware, manejor erroneo de la DB,
 o colapsos de sistema, de manera que siempre
 se tendra una imagen para recuperar la DB.
 Tambien es esencial tener una antes de hacer una
 actualizacion del sistema y estas tambien
 se pueden usar para traspasar DB entre distintos ordenadores.
*/
/*2.2*/
/*COMANDO EJECUTADO EN TERMINAL DE SISTEMA*/
/*mysqldump -u root -p --databases > myValdivia.sql*/
/*El comando entrega un archivo .sql con toda la informacion de la DB
y sus elementos*/
/*2.3*/
/*El formato de datos CSV consiste en archivos de texto que usan comas como separadores de columnas
y saltos de linea para separar filas, es el formato mas sencillo y facil de traspasar en una 
base de datos relacional
Para exportar datos al formato CSV se usa un comando como este:*/
SELECT 
    id,nombre,edad
FROM
    PERSONA
WHERE
    nombre='bodoque' 
INTO OUTFILE 'C:/tmp/buscar_persona.csv' 
FIELDS ENCLOSED BY '"' 
TERMINATED BY ',' 
LINES TERMINATED BY '\n';
/*3*/
/*3.1*/
/*
Los privilegios en una base de datos son:
 -Agregar
 -Modificar
 -Actualizar
 -Eliminar
 -Ejecutar
*/
/*3.2*/
/*el script de VALDIVIA se llama myValdivia*/
CREATE USER 'notHacker'@'localhost' IDENTIFIED BY 'nohack';
GRANT ALL PRIVILEGES ON VALDIVIA.* TO 'notHacker'@'localhost'
FLUSH PRIVILEGES;
/*3.3*/
CREATE USER 'hackMan'@'localhost' IDENTIFIED BY 'noman';
GRANT SELECT ON VALDIVIA.DESPLAZARSE.* TO 'hackman'@'localhost';
GRANT SELECT ON VALDIVIA.LUGARDEINTERES.* TO 'hackman'@'localhost';
/*4*/
/*4.1*/
ALTER TABLE PERSONA ADD nivel_de_estudio INT;
/*4.2*/
ALTER TABLE LUGARDEINTERES DROP COLUMN categoria;
CREATE TABLE CATEGORIA(categoria VARCHAR(60) PRIMARY KEY);
ALTER TABLE LUGARDEINTERES ADD ctg VARCHAR(60);
ALTER TABLE LUGARDEINTERES ADD CONSTRAINT fk_ctg FOREIGN KEY (ctg) REFERENCES CATEGORIA(categoria);
/*4.3*/
ALTER TABLE LUGARDEINTERES ALTER COLUMN longitud FLOAT NOT NULL,
    ->latitud FLOAT NOT NULL;
ALTER TABLE DESPLAZARSE ALTER COLUMN longitud FLOAT NOT NULL,
    ->latitud FLOAT NOT NULL;