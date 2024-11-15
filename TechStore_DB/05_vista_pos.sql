USE techstore_db;

CREATE VIEW vista_pos AS
SELECT 
    p.id_producto,
    p.nombre,
    p.precio,
    v.cantidad_vendida,
    v.fecha_venta,
    v.tienda_origen
FROM 
    ventas v
JOIN 
    productos p ON v.id_producto = p.id_producto;
