<?php
session_start();
if (!isset($_SESSION['usuario'])) {
    header('Location: login.html'); // Redirige al login si no está logueado
    exit();
}

include('db.php'); // Archivo de conexión a la base de datos

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Recibir datos del formulario
    $solicitante_id = $_SESSION['cod_solic'];  // El solicitante es el usuario logueado
    $proveedores = $_POST['proveedor'];
    $insumos = $_POST['insumos'];
    $cantidades = $_POST['cantidad'];
    $precios_unitarios = $_POST['precio_unitario'];

    try {
        $pdo->beginTransaction();

        // Calcular monto total
        $monto_total = 0;
        foreach ($cantidades as $key => $cantidad) {
            $precio_total = $cantidad * $precios_unitarios[$key];
            $monto_total += $precio_total;
        }

        // Insertar en OrdenCompra
        $queryOrden = "INSERT INTO OrdenCompra (monto_total, fecha_orden, Solicitante_cod_solic) 
                       VALUES (:monto_total, CURDATE(), :solicitante_id)";
        $stmtOrden = $pdo->prepare($queryOrden);
        $stmtOrden->execute([ 
            ':monto_total' => $monto_total,
            ':solicitante_id' => $solicitante_id,
        ]);

        // Obtener el ID de la orden creada
        $orden_id = $pdo->lastInsertId();

        // Insertar detalles en Pedido
        $queryPedido = "INSERT INTO Pedido (insumos, cantidad, precio_unitario, precio_iva, precio_total, OrdenCompra_id, Proveedor_id) 
                        VALUES (:insumos, :cantidad, :precio_unitario, :precio_iva, :precio_total, :orden_id, :proveedor_id)";
        $stmtPedido = $pdo->prepare($queryPedido);

        foreach ($insumos as $key => $insumo) {
            $cantidad = $cantidades[$key];
            $precio_unitario = $precios_unitarios[$key];
            $precio_total = $cantidad * $precio_unitario;
            $precio_iva = $precio_total * 0.19; // Asumiendo un IVA del 19%
            $proveedor_id = $proveedores[$key];

            $stmtPedido->execute([
                ':insumos' => $insumo,
                ':cantidad' => $cantidad,
                ':precio_unitario' => $precio_unitario,
                ':precio_iva' => $precio_iva,
                ':precio_total' => $precio_total,
                ':orden_id' => $orden_id,
                ':proveedor_id' => $proveedor_id,
            ]);
        }

        $pdo->commit();

        echo "Orden creada exitosamente con ID: $orden_id";
    } catch (Exception $e) {
        $pdo->rollBack();
        echo "Error al procesar el pedido: " . $e->getMessage();
    }
}
?>
