<?php
include('db.php');
$query = "SELECT cod_venta, descripcion FROM TpVenta";
$result = $pdo->query($query);

while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
    echo "<option value='{$row['cod_venta']}'>{$row['descripcion']}</option>";
}
?>
