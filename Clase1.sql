CREATE DATABASE Tienda; 

/*Seleccion de la base de datos a utilizar. Siempre es importante fijarnos en donde vamos a trabajar*/
USE Tienda; 


CREATE TABLE Clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Email VARCHAR(100),
    Fecha_Registro DATE
);

/*Comando para mostrar las tablas que hemos creado hasta el momento*/
SHOW TABLES;


CREATE TABLE Vendedores (
    ID_Vendedor INT AUTO_INCREMENT PRIMARY KEY, --Definicion de la clave primaria. Propiedad AUTO_INCREMENT para asegurarnos que sea unico
    Nombres VARCHAR(100)
);


CREATE TABLE Telefonos_Vendedores (
    ID_Telefono INT AUTO_INCREMENT PRIMARY KEY,
    ID_Vendedor INT,
    Numero_Telefono VARCHAR(20),
    FOREIGN KEY (ID_Vendedor) REFERENCES Vendedores(ID_Vendedor) --Referencia a la tabla Vendedor
);

CREATE TABLE FechasTrabajo_Vendedores (
    ID_FechaTrabajo INT AUTO_INCREMENT PRIMARY KEY,
    ID_Vendedor INT,
    FechaInicio DATE,
    FechaFin DATE,
    FOREIGN KEY (ID_Vendedor) REFERENCES Vendedores(ID_Vendedor) --Referencia a la tabla Vendedor
);
