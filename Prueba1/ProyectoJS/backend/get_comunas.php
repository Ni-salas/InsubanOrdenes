<?php
include('db.php');
$query = "SELECT cod_comuna, nombre FROM Comuna";
$result = $pdo->query($query);

while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
    echo "<option value='{$row['cod_comuna']}'>{$row['nombre']}</option>";
}
?>
