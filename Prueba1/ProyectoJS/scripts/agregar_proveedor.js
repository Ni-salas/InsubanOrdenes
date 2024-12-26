document.addEventListener('DOMContentLoaded', () => {
    // Cargar Países
    fetch('../backend/get_paises.php')
        .then(response => response.text())
        .then(data => {
            document.getElementById('pais').innerHTML += data;
        })
        .catch(err => console.error('Error cargando países:', err));

    // Actualizar Regiones al seleccionar País
    document.getElementById('pais').addEventListener('change', function () {
        const paisId = this.value;
        fetch(`../backend/get_regiones.php?pais=${paisId}`)
            .then(response => response.text())
            .then(data => {
                document.getElementById('region').innerHTML = '<option value="" disabled selected>Seleccione una región</option>' + data;
                document.getElementById('comuna').innerHTML = '<option value="" disabled selected>Seleccione una comuna</option>';
            })
            .catch(err => console.error('Error cargando regiones:', err));
    });

    // Actualizar Comunas al seleccionar Región
    document.getElementById('region').addEventListener('change', function () {
        const regionId = this.value;
        fetch(`../backend/get_comunas.php?region=${regionId}`)
            .then(response => response.text())
            .then(data => {
                document.getElementById('comuna').innerHTML = '<option value="" disabled selected>Seleccione una comuna</option>' + data;
            })
            .catch(err => console.error('Error cargando comunas:', err));
    });

    // Cargar Tipos de Venta
    fetch('../backend/get_tipo_venta.php')
        .then(response => response.text())
        .then(data => {
            document.getElementById('tipo_venta').innerHTML += data;
        })
        .catch(err => console.error('Error cargando tipos de venta:', err));
});
