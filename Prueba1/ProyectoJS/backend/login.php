<?php
session_start();
include('db.php');

// Verifica si el usuario y la contraseña fueron enviados
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $usuario = $_POST['usuario'];
    $contraseña = $_POST['contraseña'];

    // Consulta para verificar si el usuario existe
    $stmt = $pdo->prepare("SELECT * FROM Solicitante WHERE usuario = :usuario AND contraseña = :contraseña");
    $stmt->execute(['usuario' => $usuario, 'contraseña' => $contraseña]);

    if ($stmt->rowCount() > 0) {
        $_SESSION['usuario'] = $usuario;
        header('Location: ../views/index.html'); // Redirige al index si es correcto
    } else {
        echo "Usuario o contraseña incorrectos";
    }
}
?>
