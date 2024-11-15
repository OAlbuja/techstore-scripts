CREATE DATABASE techstore_db;
USE techstore_db;

-- Tabla de productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL
);

-- Tabla de inventario
CREATE TABLE inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    cantidad_disponible INT NOT NULL,
    ubicacion_tienda VARCHAR(255),
    estado_stock ENUM('Disponible', 'Agotado') NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Tabla de ventas
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    cantidad_vendida INT NOT NULL,
    fecha_venta DATE NOT NULL,
    tienda_origen VARCHAR(255),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
