<?php
include('db.php');

try {
    $query = "SELECT id_orden FROM OrdenCompra ORDER BY id_orden DESC LIMIT 1";
    $stmt = $pdo->query($query);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($result) {
        echo json_encode(['id_orden' => $result['id_orden'] + 1]); // Siguiente número de orden
    } else {
        echo json_encode(['id_orden' => 1]); // Primera orden
    }
} catch (Exception $e) {
    echo json_encode(['error' => 'Error al obtener el número de orden: ' . $e->getMessage()]);
}
?>
