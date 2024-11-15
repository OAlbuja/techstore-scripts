USE techstore_db;

DELIMITER $$

CREATE PROCEDURE registrar_venta(
    IN pid_producto INT,
    IN pcantidad INT,
    IN ptienda_origen VARCHAR(255),
    IN pfecha DATE
)
BEGIN
    INSERT INTO ventas (id_producto, cantidad_vendida, fecha_venta, tienda_origen)
    VALUES (pid_producto, pcantidad, pfecha, ptienda_origen);

    UPDATE inventario
    SET cantidad_disponible = cantidad_disponible - pcantidad
    WHERE id_producto = pid_producto;
END$$

DELIMITER ;
