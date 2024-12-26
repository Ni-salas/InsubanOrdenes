document.getElementById('resetPasswordForm').addEventListener('submit', function(event) {
    event.preventDefault();
    const email = event.target.email.value;

    // Enviar solicitud al backend para verificar el correo
    fetch('https://localhost:3000/verify-email', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email })
    })
    .then(response => response.json())
    .then(data => {
        if (data.message === 'Correo verificado') {
            alert('Correo verificado. Ahora puedes cambiar tu contraseña.');
            document.getElementById('reset-box-email').style.display = 'none'; // Ocultar el primer formulario
            document.getElementById('reset-box-password').style.display = 'block'; // Mostrar el formulario de nueva contraseña
        } else {
            alert('El correo no está registrado.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Hubo un error. Por favor, intenta nuevamente.');
    });
});

document.getElementById('changePasswordForm').addEventListener('submit', function(event) {
    event.preventDefault();
    const newPassword = event.target.newPassword.value;
    const confirmPassword = event.target.confirmPassword.value;

    // Verificar si las contraseñas coinciden
    if (newPassword !== confirmPassword) {
        alert('Las contraseñas no coinciden.');
        return;
    }

    // Enviar solicitud al backend para cambiar la contraseña
    fetch('https://localhost:3000/reset-password', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email: event.target.email.value, newPassword })
    })
    .then(response => response.json())
    .then(data => {
        if (data.message === 'Contraseña cambiada') {
            alert('Contraseña cambiada exitosamente.');
            window.location.href = 'login.html'; // Redirigir al login
        } else {
            alert('Hubo un error al cambiar la contraseña.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Hubo un error. Por favor, intenta nuevamente.');
    });
});
