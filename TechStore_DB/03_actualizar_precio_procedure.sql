USE techstore_db;

DELIMITER $$

CREATE PROCEDURE actualizar_precio(
    IN pid_producto INT,
    IN nuevo_precio DECIMAL(10, 2)
)
BEGIN
    UPDATE productos
    SET precio = nuevo_precio
    WHERE id_producto = pid_producto;
END$$

DELIMITER ;
