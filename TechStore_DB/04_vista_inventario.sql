USE techstore_db;

CREATE VIEW vista_inventario AS
SELECT 
    i.id_producto,
    p.nombre AS producto,
    i.cantidad_disponible,
    i.ubicacion_tienda,
    i.estado_stock
FROM 
    inventario i
JOIN 
    productos p ON i.id_producto = p.id_producto;
