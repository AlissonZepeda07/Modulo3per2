CREATE DATABASE BDDAliZepB2_Modulo3will

USE BDDAliZepB2_Modulo3will;

CREATE TABLE Clientes(
id_cliente INT PRIMARY KEY NOT NULL,
Nombre_cliente VARCHAR (50),
Email_cliente VARCHAR (100),
Telefono VARCHAR (10)
);

CREATE TABLE genero_Libros(
id_genero_Libros INT PRIMARY KEY NOT NULL,
Nombre_genero_libro VARCHAR (50)
);


CREATE TABLE Libros(
id_libro INT PRIMARY KEY NOT NULL,
Titulo_libroo VARCHAR (50),
anio_libro INT,
estado ENUM("Disponible", "prestado")
);


CREATE TABLE Prestamos(
id_prestamo INT PRIMARY KEY NOT NULL,
id_cliente INT,
fecha_inicio DATE,
fecha_devolucion DATE,
estado ENUM("Activo", "Inactivo")
);

CREATE TABLE Deatlles_prestamos(
id_Deatlles_prestamos INT PRIMARY KEY NOT NULL,
id_prestamo INT,
id_libro INT
);

SELECT UUID() as uid;

CREATE USER 'libro_express'@'localhost' IDENTIFIED BY 'Libro_express_2024';
GRANT ALL PRIVILEGES ON BDDAliZepB2_Modulo3will.* TO 'libro_express'@'localhost';

CREATE TRIGGER actualizar_estado_prestamo
AFTER INSERT ON Prestamos
FOR EACH ROW
BEGIN
    UPDATE Libros
    SET estado = 'prestado'
    WHERE id_libro = NEW.id_libro;
END;