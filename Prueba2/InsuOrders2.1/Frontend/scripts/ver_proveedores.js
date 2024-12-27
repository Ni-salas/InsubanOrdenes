document.addEventListener("DOMContentLoaded", () => {
    const tbody = document.getElementById("proveedores-tbody");
    const buscarInput = document.getElementById("buscar-input");
    const buscarBtn = document.getElementById("buscar-btn");
    const regresarBtn = document.getElementById("regresar-btn");
    const anteriorBtn = document.getElementById("anterior-btn");
    const siguienteBtn = document.getElementById("siguiente-btn");

    let proveedores = []; // Aquí se almacenarán los datos obtenidos del servidor
    let paginaActual = 1;
    const proveedoresPorPagina = 20;

    // Simulación de datos o fetch a la base de datos
    const cargarProveedores = async () => {
        try {
            const response = await fetch("/api/proveedores"); // Cambia esta URL por tu endpoint real
            proveedores = await response.json();
            proveedores.sort((a, b) => a.razonSocial.localeCompare(b.razonSocial));
            mostrarPagina();
        } catch (error) {
            console.error("Error al cargar proveedores:", error);
        }
    };

    // Muestra una página específica
    const mostrarPagina = () => {
        tbody.innerHTML = "";
        const inicio = (paginaActual - 1) * proveedoresPorPagina;
        const fin = inicio + proveedoresPorPagina;
        const pagina = proveedores.slice(inicio, fin);

        pagina.forEach((proveedor) => {
            const fila = document.createElement("tr");
            fila.innerHTML = `
                <td>${proveedor.rut}</td>
                <td>${proveedor.razonSocial}</td>
                <td>${proveedor.direccion}</td>
                <td>${proveedor.pais}</td>
                <td>${proveedor.region}</td>
                <td>${proveedor.comuna}</td>
                <td>${proveedor.email}</td>
                <td>${proveedor.telefono}</td>
                <td>${proveedor.vendedor}</td>
                <td>${proveedor.tipoVenta}</td>
            `;
            tbody.appendChild(fila);
        });
    };

    // Búsqueda de proveedores
    const buscarProveedores = () => {
        const termino = buscarInput.value.toLowerCase();
        const resultados = proveedores.filter((proveedor) =>
            proveedor.razonSocial.toLowerCase().includes(termino)
        );
        tbody.innerHTML = "";
        resultados.forEach((proveedor) => {
            const fila = document.createElement("tr");
            fila.innerHTML = `
                <td>${proveedor.rut}</td>
                <td>${proveedor.razonSocial}</td>
                <td>${proveedor.direccion}</td>
                <td>${proveedor.pais}</td>
                <td>${proveedor.region}</td>
                <td>${proveedor.comuna}</td>
                <td>${proveedor.email}</td>
                <td>${proveedor.telefono}</td>
                <td>${proveedor.vendedor}</td>
                <td>${proveedor.tipoVenta}</td>
            `;
            tbody.appendChild(fila);
        });
    };

    // Manejo de la paginación
    anteriorBtn.addEventListener("click", () => {
        if (paginaActual > 1) {
            paginaActual--;
            mostrarPagina();
        }
    });

    siguienteBtn.addEventListener("click", () => {
        if (paginaActual * proveedoresPorPagina < proveedores.length) {
            paginaActual++;
            mostrarPagina();
        }
    });

    // Botón de búsqueda
    buscarBtn.addEventListener("click", buscarProveedores);

    // Botón de regresar
    regresarBtn.addEventListener("click", () => {
        window.history.back();
    });

    // Cargar proveedores al iniciar
    cargarProveedores();
});
