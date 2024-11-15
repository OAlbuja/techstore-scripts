-- Usar la base de datos correcta
USE techstore_db;

-- INSERTAR PRODUCTOS
INSERT INTO productos (id_producto, nombre, descripcion, precio)
VALUES 
(1, 'Auriculares Bluetooth', 'Auriculares inalámbricos de alta calidad', 50.00),
(2, 'Laptop Gamer', 'Laptop de alto rendimiento para videojuegos', 1500.00),
(3, 'Smartphone', 'Teléfono inteligente de última generación', 800.00),
(4, 'Teclado Mecánico', 'Teclado con retroiluminación RGB', 100.00);

-- INSERTAR INVENTARIO
INSERT INTO inventario (id_producto, cantidad_disponible, ubicacion_tienda, estado_stock)
VALUES 
(1, 20, 'Tienda Principal', 'Disponible'),
(2, 5, 'Tienda Secundaria', 'Disponible'),
(3, 10, 'Tienda Principal', 'Disponible'),
(4, 0, 'Tienda Principal', 'Agotado'); -- Producto sin inventario

-- REGISTRAR VENTAS EXITOSAS
CALL registrar_venta(1, 5, 'Tienda Principal', '2024-11-15'); -- Venta válida
CALL registrar_venta(2, 2, 'Tienda Secundaria', '2024-11-16'); -- Venta válida
CALL registrar_venta(3, 3, 'Tienda Principal', '2024-11-16'); -- Venta válida

-- PRUEBA: VENTA CON INVENTARIO INSUFICIENTE (Esta puede fallar)
CALL registrar_venta(2, 10, 'Tienda Secundaria', '2024-11-17');

-- PRUEBA: VENTA DE PRODUCTO SIN STOCK (Esta puede fallar)
CALL registrar_venta(4, 1, 'Tienda Principal', '2024-11-17');

-- ACTUALIZAR PRECIOS
CALL actualizar_precio(1, 120.00); -- Cambiar el precio del producto 1
CALL actualizar_precio(3, 750.00); -- Cambiar el precio del producto 3

-- CONSULTAR VISTAS
-- Vista de inventario
SELECT * FROM vista_inventario;

-- Vista de sistema POS
SELECT * FROM vista_pos;

-- CONSULTAR LAS TABLAS DIRECTAMENTE
-- Tabla de productos
SELECT * FROM productos;

-- Tabla de inventario
SELECT * FROM inventario;

-- Tabla de ventas
SELECT * FROM ventas;

-- ESCENARIO COMPLEJO
-- Registrar múltiples ventas y actualizar precios simultáneamente
CALL registrar_venta(1, 10, 'Tienda Principal', '2024-11-18'); -- Reducir inventario de producto 1
CALL actualizar_precio(2, 1400.00); -- Cambiar precio del producto 2
CALL registrar_venta(3, 7, 'Tienda Principal', '2024-11-19'); -- Reducir inventario de producto 3

-- Verificar vistas después de operaciones
SELECT * FROM vista_inventario; -- Verificar inventario actualizado
SELECT * FROM vista_pos; -- Verificar datos POS actualizados
