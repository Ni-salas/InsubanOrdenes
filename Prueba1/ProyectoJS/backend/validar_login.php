<?php
session_start();
include('db.php'); // Archivo de conexión a la base de datos

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $usuario = $_POST['usuario'];
    $contraseña = $_POST['contraseña'];

    // Consultar en la base de datos
    try {
        $stmt = $pdo->prepare("SELECT * FROM Solicitante WHERE usuario = :usuario AND contraseña = :contraseña");
        $stmt->bindParam(':usuario', $usuario);
        $stmt->bindParam(':contraseña', $contraseña);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $solicitante = $stmt->fetch(PDO::FETCH_ASSOC);
            $_SESSION['usuario'] = $solicitante['usuario'];
            $_SESSION['cod_solic'] = $solicitante['cod_solic'];
            $_SESSION['nombre'] = $solicitante['nombre'];

            header("Location: index.php");
            exit();
        } else {
            echo "<script>alert('Usuario o contraseña incorrectos'); window.location.href='login.html';</script>";
        }
    } catch (PDOException $e) {
        echo "Error al conectar con la base de datos: " . $e->getMessage();
    }
}
?>
