<?php
// Asegúrate de incluir FPDF
require('fpdf/fpdf.php');

// Verifica si los datos han sido enviados desde el formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos del formulario
    $proveedorId = $_POST['proveedor'];
    $insumos = $_POST['insumos'];
    $cantidad = $_POST['cantidad'];
    $precioUnitario = $_POST['precio_unitario'];
    $neto = $_POST['neto'];

    // Conectar a la base de datos
    include('db.php');
    // Recuperar los datos del proveedor desde la base de datos
    $queryProveedor = "SELECT * FROM Proveedor WHERE id_proveedor = ?";
    $stmt = $pdo->prepare($queryProveedor);
    $stmt->execute([$proveedorId]);
    $proveedor = $stmt->fetch();

    // Crear una nueva instancia de FPDF
    $pdf = new FPDF();
    $pdf->AddPage();

    // Agregar un título
    $pdf->SetFont('Arial', 'B', 16);
    $pdf->Cell(200, 10, 'Orden de Compra', 0, 1, 'C');

    // Agregar los detalles del proveedor
    $pdf->SetFont('Arial', '', 12);
    $pdf->Ln(10);
    $pdf->Cell(100, 10, 'Proveedor: ' . $proveedor['nombre'], 0, 1);
    $pdf->Cell(100, 10, 'RUT: ' . $proveedor['rut'], 0, 1);
    $pdf->Cell(100, 10, 'Dirección: ' . $proveedor['direccion'], 0, 1);
    $pdf->Cell(100, 10, 'Email: ' . $proveedor['email'], 0, 1);
    $pdf->Cell(100, 10, 'Teléfono: ' . $proveedor['telefono'], 0, 1);

    // Agregar la tabla de insumos
    $pdf->Ln(10);
    $pdf->Cell(50, 10, 'Insumo', 1, 0, 'C');
    $pdf->Cell(30, 10, 'Cantidad', 1, 0, 'C');
    $pdf->Cell(40, 10, 'Precio Unitario', 1, 0, 'C');
    $pdf->Cell(40, 10, 'Valor Neto', 1, 1, 'C');

    // Recorrer los insumos y agregarlos a la tabla
    $total = 0;
    foreach ($insumos as $index => $insumo) {
        $pdf->Cell(50, 10, $insumo, 1, 0, 'C');
        $pdf->Cell(30, 10, $cantidad[$index], 1, 0, 'C');
        $pdf->Cell(40, 10, '$' . number_format($precioUnitario[$index], 2), 1, 0, 'C');
        $pdf->Cell(40, 10, '$' . number_format($neto[$index], 2), 1, 1, 'C');
        $total += $neto[$index]; // Sumar el valor total
    }

    // Agregar el total
    $pdf->Ln(10);
    $pdf->SetFont('Arial', 'B', 12);
    $pdf->Cell(120, 10, 'Total: $' . number_format($total, 2), 0, 1, 'R');

    // Salvar el PDF y enviarlo al navegador
    $pdf->Output('D', 'orden_compra.pdf');
} else {
    echo 'No se recibieron datos.';
}
?>
