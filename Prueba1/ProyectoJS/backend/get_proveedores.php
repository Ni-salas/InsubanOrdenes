<?php
include('db.php');

$query = "
    SELECT 
        Proveedor.rut, 
        Proveedor.dv_rut, 
        Proveedor.nombre, 
        Proveedor.direccion, 
        Proveedor.email, 
        Proveedor.telefono, 
        Proveedor.vendedor, 
        TpVenta.descripcion AS tipo_venta, 
        Comuna.nombre AS comuna, 
        Region.nombre AS region, 
        Pais.nombre AS pais
    FROM Proveedor
    INNER JOIN TpVenta ON Proveedor.TpVenta_cod_venta = TpVenta.cod_venta
    INNER JOIN Comuna ON Proveedor.Comuna_cod_comuna = Comuna.cod_comuna
    INNER JOIN Region ON Comuna.Region_cod_region = Region.cod_region
    INNER JOIN Pais ON Region.Pais_cod_pais = Pais.cod_pais
";

$result = $pdo->query($query);
$proveedores = $result->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($proveedores);
?>
