
-- SEGUNDA PRE ENTREGA DEL PROYECTO SQL SUPERMERCADO - TRABAJO REALIZADO POR RODRIGO MONZON

-- ------------------------------------------------------------------------------------------------------------------------
-- Creamos la base de datos
CREATE DATABASE Supermercado;

-- ------------------------------------------------------------------------------------------------------------------------
-- Nos paramos sobre la base de datos
USE Supermercado;

-- ------------------------------------------------------------------------------------------------------------------------
-- Creamos las tablas

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

-- ------------------------------------------------------------------------------------------------------------------------
-- Creamos datos para las tablas (Estos datos los sacamos de chatgpt, le pedi 25 registros para cada tabla)

INSERT INTO Categoria (Nombre, Descripción) VALUES
('Bebidas', 'Bebidas alcohólicas y no alcohólicas'),
('Snacks', 'Aperitivos y bocadillos'),
('Lácteos', 'Productos derivados de la leche'),
('Carnes', 'Carnes frescas y procesadas'),
('Frutas y Verduras', 'Frutas y verduras frescas'),
('Panadería', 'Productos de panadería y pastelería'),
('Dulces', 'Caramelos y chocolates'),
('Congelados', 'Productos congelados'),
('Higiene', 'Productos de higiene personal'),
('Limpieza', 'Productos de limpieza'),
('Cuidado Personal', 'Cosméticos y cuidado personal'),
('Mascotas', 'Productos para mascotas'),
('Bebés', 'Productos para bebés'),
('Electrónica', 'Electrodomésticos y dispositivos electrónicos'),
('Vinos y Licores', 'Variedades de vinos y licores'),
('Cereales', 'Cereales y granos'),
('Aceites', 'Aceites y grasas comestibles'),
('Pastas', 'Pastas y fideos'),
('Arroz y Legumbres', 'Arroz, frijoles y otras legumbres'),
('Conservas', 'Alimentos enlatados y conservas'),
('Salud', 'Suplementos y medicamentos'),
('Pan Integral', 'Variedades de pan integral'),
('Condimentos', 'Salsas y condimentos'),
('Alimentos Preparados', 'Comidas listas para consumir'),
('Bebidas Energéticas', 'Bebidas energéticas y deportivas');

INSERT INTO Proveedor (Nombre, Dirección, Teléfono, Email) VALUES
('Coca-Cola', 'Av. Siempre Viva 742, Springfield', '123456789', 'contacto@cocacola.com'),
('PepsiCo', 'Calle Falsa 123, Springfield', '987654321', 'ventas@pepsico.com'),
('Nestlé', 'Av. Principal 456, Springfield', '555666777', 'info@nestle.com'),
('Unilever', 'Calle Secundaria 789, Springfield', '444333222', 'unilever@correo.com'),
('Procter & Gamble', 'Av. Industrial 101, Springfield', '111222333', 'pg@correo.com'),
('Bimbo', 'Calle Panadería 11, Springfield', '222333444', 'bimbo@correo.com'),
('Mondelez', 'Av. Golosinas 22, Springfield', '333444555', 'ventas@mondelez.com'),
('Lala', 'Calle Lácteos 33, Springfield', '444555666', 'info@lala.com'),
('Kimberly-Clark', 'Av. Higiene 44, Springfield', '555666777', 'kc@correo.com'),
('Colgate', 'Calle Dientes 55, Springfield', '666777888', 'colgate@correo.com'),
('Mars', 'Av. Mascotas 66, Springfield', '777888999', 'ventas@mars.com'),
('Johnson & Johnson', 'Calle Cuidado 77, Springfield', '888999000', 'jj@correo.com'),
('Samsung', 'Av. Electrónica 88, Springfield', '999000111', 'info@samsung.com'),
('Sony', 'Calle Entretenimiento 99, Springfield', '000111222', 'ventas@sony.com'),
('Heineken', 'Av. Bebidas 111, Springfield', '111222333', 'heineken@correo.com'),
('Bacardi', 'Calle Licores 222, Springfield', '222333444', 'ventas@bacardi.com'),
('General Mills', 'Av. Cereales 333, Springfield', '333444555', 'info@generalmills.com'),
('Barilla', 'Calle Pastas 444, Springfield', '444555666', 'barilla@correo.com'),
('Riceland', 'Av. Arroz 555, Springfield', '555666777', 'ventas@riceland.com'),
('Del Monte', 'Calle Conservas 666, Springfield', '666777888', 'delmonte@correo.com'),
('Pfizer', 'Av. Salud 777, Springfield', '777888999', 'pfizer@correo.com'),
('La Moderna', 'Calle Integral 888, Springfield', '888999000', 'ventas@lamoderna.com'),
('McCormick', 'Av. Condimentos 999, Springfield', '999000111', 'mccormick@correo.com'),
('Nestlé', 'Calle Preparados 1010, Springfield', '000111222', 'preparados@nestle.com'),
('Red Bull', 'Av. Energía 1111, Springfield', '111222333', 'info@redbull.com');

INSERT INTO Producto (Nombre, Descripción, Precio, Stock, ID_Categoria, ID_Proveedor) VALUES
('Coca-Cola 1L', 'Refresco de cola', 1.50, 100, 1, 1),
('Pepsi 1L', 'Refresco de cola', 1.40, 120, 1, 2),
('Galletas Oreo', 'Galletas con crema', 2.00, 200, 2, 7),
('Leche Entera Lala', 'Leche entera de vaca', 1.00, 150, 3, 8),
('Carne de Res', 'Carne de res fresca', 10.00, 50, 4, 4),
('Manzana Roja', 'Manzana fresca roja', 0.50, 200, 5, 4),
('Pan Bimbo', 'Pan blanco', 1.20, 180, 6, 6),
('Chocolate Snickers', 'Barra de chocolate', 1.00, 220, 7, 11),
('Pizza Congelada', 'Pizza lista para hornear', 5.00, 80, 8, 3),
('Pasta de Dientes Colgate', 'Pasta de dientes con flúor', 3.00, 150, 10, 10),
('Shampoo Pantene', 'Shampoo para cabello liso', 4.50, 100, 11, 4),
('Croquetas para Perro', 'Alimento para perro', 10.00, 50, 12, 12),
('Pañales Huggies', 'Pañales desechables', 8.00, 100, 13, 4),
('TV Samsung 42"', 'Televisor LED 42 pulgadas', 300.00, 30, 14, 13),
('Vino Tinto', 'Vino tinto reserva', 15.00, 60, 15, 14),
('Cereal Corn Flakes', 'Cereal de maíz', 3.00, 120, 16, 17),
('Aceite de Oliva', 'Aceite de oliva extra virgen', 7.00, 70, 17, 5),
('Pasta Spaghetti', 'Pasta larga', 2.00, 150, 18, 18),
('Arroz Blanco', 'Arroz blanco de grano largo', 1.00, 200, 19, 19),
('Atún en Lata', 'Atún enlatado en aceite', 2.50, 100, 20, 20),
('Multivitamínico', 'Suplemento multivitamínico', 15.00, 40, 21, 21),
('Pan Integral Bimbo', 'Pan integral', 1.50, 150, 22, 22),
('Salsa de Tomate', 'Salsa de tomate para pastas', 2.00, 90, 23, 23),
('Comida Preparada Nestlé', 'Plato preparado de pasta', 5.00, 60, 24, 24),
('Red Bull', 'Bebida energética', 2.50, 100, 25, 25);

INSERT INTO Cliente (Nombre, Apellido, Dirección, Teléfono, Email) VALUES
('Juan', 'Pérez', 'Calle Uno 123, Springfield', '123456789', 'juanperez@mail.com'),
('Ana', 'García', 'Av. Dos 456, Springfield', '987654321', 'anagarcia@mail.com'),
('Luis', 'Martínez', 'Calle Tres 789, Springfield', '555666777', 'luismartinez@mail.com'),
('María', 'Rodríguez', 'Av. Cuatro 101, Springfield', '444333222', 'mariarodriguez@mail.com'),
('Carlos', 'Gómez', 'Calle Cinco 202, Springfield', '111222333', 'carlosgomez@mail.com'),
('Laura', 'Fernández', 'Av. Seis 303, Springfield', '222333444', 'laurafernandez@mail.com'),
('Pedro', 'López', 'Calle Siete 404, Springfield', '333444555', 'pedrolopez@mail.com'),
('Sofía', 'Díaz', 'Av. Ocho 505, Springfield', '444555666', 'sofiadiaz@mail.com'),
('Andrés', 'Torres', 'Calle Nueve 606, Springfield', '555666777', 'andrestorres@mail.com'),
('Elena', 'Ramos', 'Av. Diez 707, Springfield', '666777888', 'elenaramos@mail.com'),
('David', 'Sánchez', 'Calle Once 808, Springfield', '777888999', 'davidsanchez@mail.com'),
('Julia', 'Mendoza', 'Av. Doce 909, Springfield', '888999000', 'juliamendoza@mail.com'),
('Miguel', 'Ortiz', 'Calle Trece 1010, Springfield', '999000111', 'miguelortiz@mail.com'),
('Valeria', 'Ruiz', 'Av. Catorce 1111, Springfield', '000111222', 'valeriaruiz@mail.com'),
('Francisco', 'Morales', 'Calle Quince 1212, Springfield', '111222333', 'franciscomorales@mail.com'),
('Carolina', 'Jiménez', 'Av. Dieciséis 1313, Springfield', '222333444', 'carolinajimenez@mail.com'),
('Raúl', 'Vargas', 'Calle Diecisiete 1414, Springfield', '333444555', 'raulvargas@mail.com'),
('Gabriela', 'Reyes', 'Av. Dieciocho 1515, Springfield', '444555666', 'gabrielareyes@mail.com'),
('Jorge', 'Flores', 'Calle Diecinueve 1616, Springfield', '555666777', 'jorgeflores@mail.com'),
('Teresa', 'Silva', 'Av. Veinte 1717, Springfield', '666777888', 'teressilva@mail.com'),
('Daniel', 'Castillo', 'Calle Veintiuno 1818, Springfield', '777888999', 'danielcastillo@mail.com'),
('Paola', 'Espinoza', 'Av. Veintidós 1919, Springfield', '888999000', 'paolaespinoza@mail.com'),
('Roberto', 'Molina', 'Calle Veintitrés 2020, Springfield', '999000111', 'robertomolina@mail.com'),
('Martina', 'Guerrero', 'Av. Veinticuatro 2121, Springfield', '000111222', 'martinaguerrero@mail.com'),
('Gonzalo', 'Ramos', 'Calle Veinticinco 2222, Springfield', '111222333', 'gonzaloramos@mail.com');

INSERT INTO Empleado (Nombre, Apellido, Puesto, Salario) VALUES
('Luis', 'Pérez', 'Cajero', 1500.00),
('María', 'López', 'Vendedor', 1400.00),
('Ana', 'Martínez', 'Gerente de Tienda', 3000.00),
('Juan', 'González', 'Supervisor', 2000.00),
('Elena', 'Rodríguez', 'Cajero', 1500.00),
('Carlos', 'García', 'Vendedor', 1400.00),
('Sofía', 'Fernández', 'Supervisor', 2000.00),
('Pedro', 'Torres', 'Cajero', 1500.00),
('Laura', 'Sánchez', 'Gerente de Tienda', 3000.00),
('David', 'Ramírez', 'Vendedor', 1400.00),
('Isabel', 'Ruiz', 'Cajero', 1500.00),
('Andrés', 'Jiménez', 'Supervisor', 2000.00),
('Daniela', 'Díaz', 'Vendedor', 1400.00),
('Jorge', 'Morales', 'Cajero', 1500.00),
('Gabriel', 'Vargas', 'Vendedor', 1400.00),
('Lucía', 'Reyes', 'Supervisor', 2000.00),
('Pablo', 'Ortega', 'Cajero', 1500.00),
('Raúl', 'Ramos', 'Gerente de Tienda', 3000.00),
('Patricia', 'Espinoza', 'Vendedor', 1400.00),
('Alberto', 'Mendoza', 'Cajero', 1500.00),
('Teresa', 'Silva', 'Supervisor', 2000.00),
('Francisco', 'Flores', 'Vendedor', 1400.00),
('Gabriela', 'Castillo', 'Cajero', 1500.00),
('Manuel', 'Guerrero', 'Vendedor', 1400.00),
('Verónica', 'Molina', 'Supervisor', 2000.00);

INSERT INTO Venta (Fecha, Total, ID_Cliente, ID_Empleado) VALUES
('2024-07-20 10:15:00', 50.00, 1, 1),
('2024-07-20 11:00:00', 35.50, 2, 2),
('2024-07-21 09:30:00', 78.25, 3, 3),
('2024-07-21 14:45:00', 22.75, 4, 4),
('2024-07-22 16:20:00', 105.00, 5, 5),
('2024-07-22 17:50:00', 63.40, 6, 6),
('2024-07-23 12:35:00', 28.90, 7, 7),
('2024-07-23 14:10:00', 47.80, 8, 8),
('2024-07-23 15:55:00', 92.30, 9, 9),
('2024-07-24 10:45:00', 55.00, 10, 10),
('2024-07-24 12:30:00', 42.75, 11, 11),
('2024-07-24 13:50:00', 88.60, 12, 12),
('2024-07-25 09:15:00', 66.20, 13, 13),
('2024-07-25 11:40:00', 31.50, 14, 14),
('2024-07-25 15:00:00', 79.95, 15, 15),
('2024-07-26 14:20:00', 85.70, 16, 16),
('2024-07-26 16:10:00', 48.30, 17, 17),
('2024-07-26 17:55:00', 73.25, 18, 18),
('2024-07-27 10:30:00', 95.80, 19, 19),
('2024-07-27 12:15:00', 52.60, 20, 20),
('2024-07-27 13:45:00', 67.40, 21, 21),
('2024-07-28 09:20:00', 59.50, 22, 22),
('2024-07-28 11:10:00', 36.25, 23, 23),
('2024-07-28 13:30:00', 41.90, 24, 24),
('2024-07-28 15:55:00', 70.45, 25, 25);

INSERT INTO DetalleVenta (ID_Venta, ID_Producto, Cantidad, PrecioUnitario) VALUES
(1, 1, 2, 1.50),
(1, 2, 3, 1.40),
(2, 3, 1, 2.00),
(2, 4, 2, 1.00),
(3, 5, 4, 10.00),
(3, 6, 2, 0.50),
(4, 7, 5, 1.20),
(4, 8, 3, 1.00),
(5, 9, 1, 5.00),
(5, 10, 2, 3.00),
(6, 11, 3, 4.50),
(6, 12, 1, 10.00),
(7, 13, 2, 8.00),
(7, 14, 1, 300.00),
(8, 15, 4, 15.00),
(8, 16, 1, 3.00),
(9, 17, 3, 7.00),
(9, 18, 5, 2.00),
(10, 19, 2, 1.00),
(10, 20, 3, 2.50),
(11, 21, 1, 15.00),
(11, 22, 4, 1.50),
(12, 23, 2, 2.00),
(12, 24, 1, 5.00),
(13, 25, 2, 2.50);

INSERT INTO Inventario (ID_Producto, Cantidad, Fecha_Ultima_Actualizacion) VALUES
(1, 100, '2024-07-20 10:00:00'),
(2, 120, '2024-07-20 10:05:00'),
(3, 200, '2024-07-21 09:00:00'),
(4, 150, '2024-07-21 09:15:00'),
(5, 50, '2024-07-21 09:30:00'),
(6, 200, '2024-07-21 09:45:00'),
(7, 180, '2024-07-21 10:00:00'),
(8, 220, '2024-07-22 16:00:00'),
(9, 80, '2024-07-22 16:10:00'),
(10, 150, '2024-07-22 16:20:00'),
(11, 100, '2024-07-23 12:00:00'),
(12, 50, '2024-07-23 12:15:00'),
(13, 100, '2024-07-23 12:30:00'),
(14, 30, '2024-07-24 10:00:00'),
(15, 60, '2024-07-24 10:10:00'),
(16, 120, '2024-07-24 10:20:00'),
(17, 70, '2024-07-24 10:30:00'),
(18, 150, '2024-07-24 10:40:00'),
(19, 200, '2024-07-25 09:00:00'),
(20, 100, '2024-07-25 09:10:00'),
(21, 40, '2024-07-25 09:20:00'),
(22, 150, '2024-07-26 14:00:00'),
(23, 90, '2024-07-26 14:10:00'),
(24, 60, '2024-07-26 14:20:00'),
(25, 100, '2024-07-27 10:00:00');

INSERT INTO OrdenCompra (Fecha, ID_Proveedor, Total) VALUES
('2024-07-20 09:00:00', 1, 500.00),
('2024-07-21 10:00:00', 2, 350.00),
('2024-07-22 11:00:00', 3, 450.00),
('2024-07-23 12:00:00', 4, 600.00),
('2024-07-24 13:00:00', 5, 700.00),
('2024-07-25 14:00:00', 6, 550.00),
('2024-07-26 15:00:00', 7, 650.00),
('2024-07-27 16:00:00', 8, 300.00),
('2024-07-28 17:00:00', 9, 400.00),
('2024-07-29 18:00:00', 10, 500.00),
('2024-07-30 09:00:00', 11, 600.00),
('2024-07-31 10:00:00', 12, 700.00),
('2024-08-01 11:00:00', 13, 800.00),
('2024-08-02 12:00:00', 14, 900.00),
('2024-08-03 13:00:00', 15, 1000.00),
('2024-08-04 14:00:00', 16, 1100.00),
('2024-08-05 15:00:00', 17, 1200.00),
('2024-08-06 16:00:00', 18, 1300.00),
('2024-08-07 17:00:00', 19, 1400.00),
('2024-08-08 18:00:00', 20, 1500.00),
('2024-08-09 09:00:00', 21, 1600.00),
('2024-08-10 10:00:00', 22, 1700.00),
('2024-08-11 11:00:00', 23, 1800.00),
('2024-08-12 12:00:00', 24, 1900.00),
('2024-08-13 13:00:00', 25, 2000.00);

INSERT INTO DetalleOrdenCompra (ID_Orden, ID_Producto, Cantidad, PrecioUnitario) VALUES
(1, 1, 100, 1.50),
(1, 2, 100, 1.40),
(2, 3, 200, 2.00),
(2, 4, 150, 1.00),
(3, 5, 50, 10.00),
(3, 6, 200, 0.50),
(4, 7, 180, 1.20),
(4, 8, 220, 1.00),
(5, 9, 80, 5.00),
(5, 10, 150, 3.00),
(6, 11, 100, 4.50),
(6, 12, 50, 10.00),
(7, 13, 100, 8.00),
(7, 14, 30, 300.00),
(8, 15, 60, 15.00),
(8, 16, 120, 3.00),
(9, 17, 70, 7.00),
(9, 18, 150, 2.00),
(10, 19, 200, 1.00),
(10, 20, 100, 2.50),
(11, 21, 40, 15.00),
(11, 22, 150, 1.50),
(12, 23, 90, 2.00),
(12, 24, 60, 5.00),
(13, 25, 100, 2.50);

-- ------------------------------------------------------------------------------------------------------------------------

-- Creamos dos vistas (Las explico en el documento adjuntado)

CREATE VIEW Vista_Productos_Proveedores AS
SELECT 
    P.ID_Producto,
    P.Nombre AS Nombre_Producto,
    P.Descripción AS Descripción_Producto,
    P.Precio,
    P.Stock,
    Prov.Nombre AS Nombre_Proveedor,
    Prov.Dirección AS Dirección_Proveedor,
    Prov.Teléfono AS Teléfono_Proveedor,
    Prov.Email AS Email_Proveedor
FROM 
    Producto P
JOIN 
    Proveedor Prov ON P.ID_Proveedor = Prov.ID_Proveedor;

-- Prueba
-- SELECT * FROM Vista_Productos_Proveedores;


CREATE VIEW Vista_Detalle_Ordenes_Compra AS
SELECT 
    O.ID_Orden,
    P.Nombre AS Nombre_Producto,
    D.Cantidad,
    D.PrecioUnitario,
    (D.Cantidad * D.PrecioUnitario) AS Total
FROM 
    DetalleOrdenCompra D
JOIN 
    Producto P ON D.ID_Producto = P.ID_Producto
JOIN 
    OrdenCompra O ON D.ID_Orden = O.ID_Orden;

-- Prueba
-- SELECT * FROM Vista_Detalle_Ordenes_Compra;

-- ------------------------------------------------------------------------------------------------------------------------

-- Creamos funciones 
-- Funcion para sumar el valor total del inventario de un producto por id

DELIMITER $$

CREATE FUNCTION calcular_valor_inventario(producto_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE valor_total DECIMAL(10,2);

    SELECT SUM(stock * precio)
    INTO valor_total
    FROM producto
    WHERE id_producto = producto_id;

    RETURN valor_total;
END$$

DELIMITER ;

-- Funcion para sumar el total de ventas de un empleado por id

DELIMITER $$

CREATE FUNCTION contar_ventas_empleado(empleado_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_ventas INT;

    SELECT COUNT(*)
    INTO total_ventas
    FROM venta
    WHERE ID_Empleado = empleado_id;

    RETURN total_ventas;
END$$

DELIMITER ;

-- ------------------------------------------------------------------------------------------------------------------------
-- Creamos un stored procedures para actualizar el precio de un producto

DELIMITER $$

CREATE PROCEDURE actualizar_precio_producto(
    IN p_id_producto INT,
    IN p_nuevo_precio DECIMAL(10, 2)
)
BEGIN
    UPDATE Producto
    SET Precio = p_nuevo_precio
    WHERE ID_Producto = p_id_producto;
END$$

DELIMITER ;

-- Otro para agregar cliente

DELIMITER $$

CREATE PROCEDURE agregar_cliente(
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_direccion TEXT,
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO Cliente (Nombre, Apellido, Dirección, Teléfono, Email)
    VALUES (p_nombre, p_apellido, p_direccion, p_telefono, p_email);
END$$

DELIMITER ;

-- ------------------------------------------------------------------------------------------------------------------------
-- Creamos triggers

DELIMITER $$

CREATE TRIGGER actualizar_inventario_despues_venta
AFTER INSERT ON DetalleVenta
FOR EACH ROW
BEGIN
    UPDATE Inventario
    SET Cantidad = Cantidad - NEW.Cantidad, 
        Fecha_Ultima_Actualizacion = NOW()
    WHERE ID_Producto = NEW.ID_Producto;
END$$

DELIMITER ;

-- Otro triggers 

DELIMITER $$

CREATE TRIGGER calcular_total_venta_despues
AFTER INSERT ON DetalleVenta
FOR EACH ROW
BEGIN
    DECLARE v_total DECIMAL(10, 2);

    -- Calcular el total de la venta
    SELECT SUM(Cantidad * PrecioUnitario) INTO v_total
    FROM DetalleVenta
    WHERE ID_Venta = NEW.ID_Venta;

    -- Actualizar el total de la venta
    UPDATE Venta
    SET Total = v_total
    WHERE ID_Venta = NEW.ID_Venta;
END$$

DELIMITER ;

