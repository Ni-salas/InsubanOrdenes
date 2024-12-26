document.addEventListener('DOMContentLoaded', function () {
    const tbody = document.getElementById('proveedores-tbody');

    fetch('../backend/get_proveedores.php')
        .then(response => response.json())
        .then(data => {
            data.forEach(proveedor => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${proveedor.rut}-${proveedor.dv_rut}</td>
                    <td>${proveedor.nombre}</td>
                    <td>${proveedor.direccion}</td>
                    <td>${proveedor.pais}</td>
                    <td>${proveedor.region}</td>
                    <td>${proveedor.comuna}</td>
                    <td>${proveedor.email}</td>
                    <td>${proveedor.telefono}</td>
                    <td>${proveedor.vendedor}</td>
                    <td>${proveedor.tipo_venta}</td>
                `;
                tbody.appendChild(row);
            });
        })
        .catch(error => console.error('Error al cargar los proveedores:', error));
});
