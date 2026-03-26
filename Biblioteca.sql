-- Active: 1772510960091@@127.0.0.1@3306@biblioteca
CREATE DATABASE IF NOT EXISTS Biblioteca;

USE Biblioteca;



CREATE TABLE Usuario(
    Id_user INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR (60) NOT NULL,
    Correo VARCHAR(100) NOT NULL UNIQUE,
    Fecha_Registro DATETIME
);

CREATE TABLE Libros(
    Id_libro INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(60) NOT NULL,
    Año_Publicacion YEAR NOT NULL,
    Cantidad_Total INT NOT NULL
);

CREATE TABLE Autores(
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(60) NOT NULL,
    Pais VARCHAR(50) NOT NULL
);

CREATE TABLE Prestamos(
    Id_Prestamo INT AUTO_INCREMENT PRIMARY KEY,
    Usuario INT NOT NULL,
    Libro INT NOT NULL, 
    Fecha_Prestamo DATETIME, 
    Fecha_devolucion DATETIME,
    Foreign Key (Usuario) REFERENCES Usuario(Id_user),
    Foreign Key (Libro) REFERENCES Libros(Id_Libro)
);

CREATE TABLE Autores_Libro(
    id_autor INT NOT NULL,
    id_libro INT NOT NULL,
    PRIMARY KEY(id_autor, id_libro),
    Foreign Key (id_autor) REFERENCES Autores(id_autor) ON DELETE CASCADE,
    Foreign Key (id_libro) REFERENCES Libros(id_libro) ON DELETE CASCADE
);

