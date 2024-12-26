document.getElementById('loginForm').addEventListener('submit', async (event) => {
    event.preventDefault();

    const usuario = event.target.usuario.value;
    const contraseña = event.target.contraseña.value;

    try {
        const response = await fetch('http://localhost:3000/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ usuario, contraseña }),
        });

        const result = await response.json();

        if (response.ok) {
            alert('Inicio de sesión exitoso');
            window.location.href = '../views/index.html';
        } else {
            alert(result.message || 'Usuario o contraseña incorrectos');
        }
    } catch (error) {
        console.error('Error:', error);
        alert('Ocurrió un error. Intente nuevamente.');
    }
});
