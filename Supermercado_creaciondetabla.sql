CREATE DATABASE Supermercado;
USE Supermercado;

CREATE TABLE Categoria (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripción TEXT
);

CREATE TABLE Proveedor (
    ID_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Dirección TEXT,
    Teléfono VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Producto (
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripción TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    ID_Categoria INT,
    ID_Proveedor INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor)
);

CREATE TABLE Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Dirección TEXT,
    Teléfono VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Empleado (
    ID_Empleado INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Puesto VARCHAR(100) NOT NULL,
    Salario DECIMAL(10, 2)
);

CREATE TABLE Venta (
    ID_Venta INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATETIME NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    ID_Cliente INT,
    ID_Empleado INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Empleado)
);

CREATE TABLE DetalleVenta (
    ID_Detalle INT AUTO_INCREMENT PRIMARY KEY,
    ID_Venta INT,
    ID_Producto INT,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Venta) REFERENCES Venta(ID_Venta),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

CREATE TABLE Inventario (
    ID_Inventario INT AUTO_INCREMENT PRIMARY KEY,
    ID_Producto INT,
    Cantidad INT NOT NULL,
    Fecha_Ultima_Actualizacion DATETIME NOT NULL,
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

CREATE TABLE OrdenCompra (
    ID_Orden INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATETIME NOT NULL,
    ID_Proveedor INT,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor)
);

CREATE TABLE DetalleOrdenCompra (
    ID_Detalle INT AUTO_INCREMENT PRIMARY KEY,
    ID_Orden INT,
    ID_Producto INT,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Orden) REFERENCES OrdenCompra(ID_Orden),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);
