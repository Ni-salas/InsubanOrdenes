<?php
$host = 'localhost';
$db = 'insubanbd';
$user = 'root';
$password = ''; // Si la contraseña está vacía, déjala así

try {
    // Intentamos establecer la conexión con la base de datos
    $pdo = new PDO("mysql:host=$host;dbname=$db;port=3306;charset=utf8mb4", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo 'Conexión establecida correctamente';
} catch (PDOException $e) {
    // Capturamos cualquier error de conexión y lo mostramos
    echo 'Error al conectar a la base de datos: ' . $e->getMessage();
}
?>
