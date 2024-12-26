document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();  // Evita la recarga de la página

    // Obtener los valores de los campos
    const usuario = document.querySelector('input[name="usuario"]').value;
    const contraseña = document.querySelector('input[name="contraseña"]').value;

    // Crear el objeto con los datos del formulario
    const formData = {
        usuario: usuario,
        contraseña: contraseña
    };

    // Enviar la solicitud de inicio de sesión con fetch (AJAX)
    fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(formData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.message === 'Autenticación exitosa') {
            window.location.href = 'index.html';  
        } else {
            alert(data.message);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Hubo un error en el servidor');
    });
});
