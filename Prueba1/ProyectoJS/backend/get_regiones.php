<?php
include('db.php');
$pais = $_GET['pais'];
$query = "SELECT cod_region, nombre FROM Region WHERE Pais_cod_pais = ?";
$stmt = $pdo->prepare($query);
$stmt->execute([$pais]);

while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    echo "<option value='{$row['cod_region']}'>{$row['nombre']}</option>";
}
?>
