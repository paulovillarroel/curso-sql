-- ============================================
-- Base de datos de practica: Tienda
-- Curso de SQL y PostgreSQL para principiantes
-- ============================================
-- Este script crea las tablas y datos de ejemplo
-- que se usan a lo largo de todo el curso.
--
-- Como ejecutar:
--   1. Crea una base de datos llamada "tienda" en DBeaver o psql
--   2. Conectate a la base de datos "tienda"
--   3. Ejecuta este archivo completo
-- ============================================

-- Eliminar tablas si ya existen (para poder re-ejecutar el script)
DROP TABLE IF EXISTS detalle_pedidos;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS empleados;

-- ============================================
-- CREAR TABLAS
-- ============================================

CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(50),
    stock INTEGER DEFAULT 0,
    fecha_creacion DATE DEFAULT CURRENT_DATE
);

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ciudad VARCHAR(50),
    fecha_registro DATE DEFAULT CURRENT_DATE
);

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(id),
    fecha DATE DEFAULT CURRENT_DATE,
    total DECIMAL(10,2),
    estado VARCHAR(20) DEFAULT 'pendiente'
);

CREATE TABLE detalle_pedidos (
    id SERIAL PRIMARY KEY,
    pedido_id INTEGER REFERENCES pedidos(id),
    producto_id INTEGER REFERENCES productos(id),
    cantidad INTEGER NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL
);

CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    departamento VARCHAR(50),
    salario DECIMAL(10,2),
    fecha_contratacion DATE DEFAULT CURRENT_DATE,
    jefe_id INTEGER REFERENCES empleados(id)
);

-- ============================================
-- INSERTAR DATOS DE EJEMPLO
-- ============================================

INSERT INTO productos (nombre, precio, categoria, stock) VALUES
('Laptop Pro 15', 1299.99, 'Electronica', 45),
('Mouse Inalambrico', 29.99, 'Electronica', 150),
('Teclado Mecanico', 89.99, 'Electronica', 80),
('Monitor 27 pulgadas', 449.99, 'Electronica', 30),
('Auriculares Bluetooth', 59.99, 'Electronica', 200),
('Escritorio Ajustable', 399.99, 'Muebles', 25),
('Silla Ergonomica', 299.99, 'Muebles', 40),
('Lampara LED', 34.99, 'Muebles', 100),
('Mochila para Laptop', 49.99, 'Accesorios', 120),
('Hub USB-C', 39.99, 'Accesorios', 90),
('Webcam HD', 79.99, 'Electronica', 60),
('Cable HDMI 2m', 12.99, 'Accesorios', 300),
('Soporte Monitor', 44.99, 'Muebles', 55),
('Mousepad XL', 19.99, 'Accesorios', 180),
('Cargador Rapido', 24.99, 'Accesorios', 250);

INSERT INTO clientes (nombre, email, ciudad) VALUES
('Maria Garcia', 'maria@email.com', 'Santiago'),
('Carlos Lopez', 'carlos@email.com', 'Valparaiso'),
('Ana Martinez', 'ana@email.com', 'Santiago'),
('Pedro Sanchez', 'pedro@email.com', 'Concepcion'),
('Laura Torres', 'laura@email.com', 'Santiago'),
('Diego Rivera', 'diego@email.com', 'Valparaiso'),
('Carmen Ruiz', 'carmen@email.com', 'Temuco'),
('Roberto Diaz', 'roberto@email.com', 'Santiago'),
('Isabel Moreno', 'isabel@email.com', 'Antofagasta'),
('Andres Vargas', 'andres@email.com', 'Concepcion');

INSERT INTO pedidos (cliente_id, fecha, total, estado) VALUES
(1, '2024-01-15', 1389.98, 'completado'),
(2, '2024-01-20', 89.99, 'completado'),
(3, '2024-02-01', 499.98, 'completado'),
(1, '2024-02-14', 59.99, 'completado'),
(4, '2024-02-28', 1749.98, 'enviado'),
(5, '2024-03-05', 149.97, 'completado'),
(6, '2024-03-10', 299.99, 'pendiente'),
(3, '2024-03-15', 839.98, 'enviado'),
(7, '2024-03-20', 34.99, 'completado'),
(8, '2024-03-25', 479.98, 'pendiente'),
(2, '2024-04-01', 129.98, 'completado'),
(9, '2024-04-05', 1299.99, 'enviado'),
(10, '2024-04-10', 69.98, 'pendiente'),
(1, '2024-04-15', 449.99, 'completado'),
(5, '2024-04-20', 89.99, 'completado');

INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 1, 1299.99),
(1, 2, 3, 29.99),
(2, 3, 1, 89.99),
(3, 7, 1, 299.99),
(3, 8, 2, 34.99),
(3, 14, 1, 19.99),
(4, 5, 1, 59.99),
(5, 1, 1, 1299.99),
(5, 4, 1, 449.99),
(6, 9, 3, 49.99),
(7, 7, 1, 299.99),
(8, 4, 1, 449.99),
(8, 10, 2, 39.99),
(8, 3, 1, 89.99),
(9, 8, 1, 34.99),
(10, 11, 1, 79.99),
(10, 6, 1, 399.99),
(11, 2, 1, 29.99),
(11, 14, 5, 19.99),
(12, 1, 1, 1299.99),
(13, 12, 2, 12.99),
(13, 15, 1, 24.99),
(14, 4, 1, 449.99),
(15, 3, 1, 89.99);

INSERT INTO empleados (nombre, departamento, salario, fecha_contratacion, jefe_id) VALUES
('Sofia Mendez', 'Gerencia', 85000, '2020-01-15', NULL),
('Juan Perez', 'Ventas', 45000, '2021-03-01', 1),
('Valentina Castro', 'Ventas', 42000, '2021-06-15', 1),
('Miguel Angel Torres', 'Tecnologia', 62000, '2020-08-01', 1),
('Camila Rojas', 'Tecnologia', 55000, '2022-01-10', 4),
('Alejandro Vega', 'Tecnologia', 58000, '2021-11-20', 4),
('Fernanda Luna', 'Ventas', 40000, '2023-02-01', 2),
('Ricardo Soto', 'Soporte', 38000, '2022-07-15', 4),
('Patricia Herrera', 'Soporte', 36000, '2023-05-01', 8),
('Daniela Flores', 'Ventas', 41000, '2023-08-10', 2);

-- ============================================
-- VERIFICACION
-- ============================================

SELECT 'productos' AS tabla, COUNT(*) AS registros FROM productos
UNION ALL
SELECT 'clientes', COUNT(*) FROM clientes
UNION ALL
SELECT 'pedidos', COUNT(*) FROM pedidos
UNION ALL
SELECT 'detalle_pedidos', COUNT(*) FROM detalle_pedidos
UNION ALL
SELECT 'empleados', COUNT(*) FROM empleados;
