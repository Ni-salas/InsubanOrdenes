//1.
// Página Principal:
document.addEventListener('DOMContentLoaded', function () {
    const menuItems = document.querySelectorAll('.menu-item');

    // Ocultamos todos los submenús al cargar la página
    document.querySelectorAll('.sub-menu').forEach(subMenu => {
        subMenu.style.display = 'none';
    });

    menuItems.forEach(item => {
        item.addEventListener('click', function (e) {
            e.preventDefault();

            // Cerramos otros submenús si están abiertos
            const siblingMenus = this.parentElement.parentElement.querySelectorAll('.sub-menu');
            siblingMenus.forEach(menu => {
                if (menu !== this.nextElementSibling) {
                    menu.style.display = 'none';
                }
            });

            const subMenu = this.nextElementSibling;
            if (subMenu && subMenu.classList.contains('sub-menu')) {
                // Alternamos la visibilidad del submenú
                subMenu.style.display = subMenu.style.display === 'block' ? 'none' : 'block';
            }
        });
    });

    // Cerrar los submenús si se hace clic fuera de la barra de navegación
    document.addEventListener('click', function (e) {
        if (!e.target.closest('.navbar')) {
            document.querySelectorAll('.sub-menu').forEach(menu => {
                menu.style.display = 'none';
            });
        }
    });
});

//2.
// Crear Orden de Compra:
let insumoCount = 1;

function calcularNeto(insumoId) {
    const cantidad = document.getElementById('cantidad' + insumoId).value || 0;
    const precioUnitario = document.getElementById('precio_unitario' + insumoId).value || 0;
    const neto = cantidad * precioUnitario;
    document.getElementById('neto' + insumoId).value = neto.toFixed(2);
}

// Agregar más insumos
document.getElementById('agregarInsumoBtn').addEventListener('click', () => {
    insumoCount++;

    const insumosContainer = document.getElementById('insumos-container');
    const newInsumo = document.createElement('div');
    newInsumo.classList.add('insumo');
    newInsumo.id = 'insumo' + insumoCount;

    newInsumo.innerHTML = `
        <input type="text" id="insumos${insumoCount}" name="insumos[]" placeholder="Insumo ${insumoCount}" required>
        <input type="number" id="cantidad${insumoCount}" name="cantidad[]" placeholder="Cantidad" required oninput="calcularNeto(${insumoCount})">
        <input type="number" id="precio_unitario${insumoCount}" name="precio_unitario[]" placeholder="Precio Unitario" required oninput="calcularNeto(${insumoCount})">
        <input type="text" id="neto${insumoCount}" name="neto[]" placeholder="Valor Neto" readonly>
        <button type="button" class="eliminar-btn" onclick="eliminarInsumo(${insumoCount})">Eliminar</button>
    `;

    insumosContainer.appendChild(newInsumo);
});

// Eliminar insumo
function eliminarInsumo(insumoId) {
    const insumo = document.getElementById('insumo' + insumoId);
    if (insumo && insumoId !== 1) { 
        insumo.remove();
        reindexarInsumos();
    }
}

// Reindexar los insumos al eliminar uno
function reindexarInsumos() {
    const allInsumos = document.querySelectorAll('#insumos-container .insumo');
    insumoCount = allInsumos.length;
    allInsumos.forEach((element, index) => {
        const newId = index + 1;
        element.id = 'insumo' + newId;
        element.querySelector('[id^="insumos"]').id = 'insumos' + newId;
        element.querySelector('[id^="cantidad"]').id = 'cantidad' + newId;
        element.querySelector('[id^="precio_unitario"]').id = 'precio_unitario' + newId;
        element.querySelector('[id^="neto"]').id = 'neto' + newId;
        const eliminarBtn = element.querySelector('.eliminar-btn');
        if (eliminarBtn) {
            eliminarBtn.setAttribute('onclick', `eliminarInsumo(${newId})`);
        }
    });
}

// Enviar la orden de compra
document.getElementById('crearOrden').addEventListener('submit', function(event) {
    event.preventDefault();
    const formData = new FormData(this);

    fetch('../backend/crear_orden.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        alert(data);
    })
    .catch(error => console.error('Error al crear la orden:', error));
});

// Cargar proveedores en el select
document.addEventListener('DOMContentLoaded', function () {
    fetch('../backend/get_proveedores.php')
        .then(response => {
            if (!response.ok) { 
                throw new Error('Error al cargar los proveedores');
            }
            return response.json();
        })
        .then(data => {
            const proveedorSelect = document.getElementById('proveedor');
            // Asegúrate de que los datos sean válidos y los puedas mostrar correctamente
            if (data && data.length > 0) {
                data.forEach(proveedor => {
                    const option = document.createElement('option');
                    option.value = proveedor.id_proveedor;
                    option.textContent = proveedor.nombre;
                    proveedorSelect.appendChild(option);
                });
            } else {
                console.error('No se encontraron proveedores');
            }
        })
        .catch(error => {
            console.error('Error al cargar los proveedores:', error);
        });
});

