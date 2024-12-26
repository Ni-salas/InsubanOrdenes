<?php
include('db.php');
$query = "SELECT cod_pais, nombre FROM Pais";
$result = $pdo->query($query);

while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
    echo "<option value='{$row['cod_pais']}'>{$row['nombre']}</option>";
}
?>
