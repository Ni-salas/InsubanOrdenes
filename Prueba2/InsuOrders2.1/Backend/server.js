const express = require('express');
const https = require('https');
const fs = require('fs');
const bodyParser = require('body-parser');
const helmet = require('helmet');
const nodemailer = require('nodemailer');
const bcrypt = require('bcryptjs');
const db = require('./db'); // Asumiendo que tienes esta conexión a la base de datos

const app = express();
const port = 3000;

// Cargar certificados SSL
const privateKey = fs.readFileSync('./certificates/private_key.pem', 'utf8');
const certificate = fs.readFileSync('./certificates/certificate.pem', 'utf8');
const credentials = { key: privateKey, cert: certificate };

// Middleware
app.use(bodyParser.json());
app.use(helmet());

// Ruta para solicitar el restablecimiento de la contraseña
app.post('/forgot-password', (req, res) => {
    const { email } = req.body;

    // Buscar al usuario en la base de datos por correo electrónico
    const query = 'SELECT * FROM Solicitante WHERE email = ?';
    db.query(query, [email], (err, results) => {
        if (err) {
            console.error('Error al consultar la base de datos:', err);
            return res.status(500).json({ message: 'Error en la base de datos' });
        }

        if (results.length > 0) {
            const user = results[0];
            const token = Math.random().toString(36).substr(2);  // Generamos un token simple

            // Guardar el token en la base de datos o en un sistema de almacenamiento (aquí es solo un ejemplo)
            const updateQuery = 'UPDATE Solicitante SET reset_token = ? WHERE email = ?';
            db.query(updateQuery, [token, email], (err, results) => {
                if (err) {
                    console.error('Error al guardar el token:', err);
                    return res.status(500).json({ message: 'Error al guardar el token' });
                }

                // Enviar el correo con el enlace de restablecimiento
                sendResetPasswordEmail(user.email, token);

                res.status(200).json({ message: 'Enlace de restablecimiento enviado' });
            });
        } else {
            res.status(404).json({ message: 'Usuario no encontrado' });
        }
    });
});

// Ruta para mostrar el formulario para restablecer la contraseña (mostrar el formulario con el token)
app.get('/restablecer-password', (req, res) => {
    const { token } = req.query;

    // Verificar el token en la base de datos
    const query = 'SELECT * FROM Solicitante WHERE reset_token = ?';
    db.query(query, [token], (err, results) => {
        if (err) {
            console.error('Error al consultar la base de datos:', err);
            return res.status(500).json({ message: 'Error en la base de datos' });
        }

        if (results.length > 0) {
            // Si el token es válido, mostrar el formulario para actualizar la contraseña
            res.status(200).json({ message: 'Token válido. Puedes actualizar tu contraseña.' });
        } else {
            res.status(400).json({ message: 'Token inválido o expirado.' });
        }
    });
});

// Ruta para actualizar la contraseña
app.post('/update-password', (req, res) => {
    const { token, nuevaContraseña, confirmContraseña } = req.body;

    // Verificar que las contraseñas coincidan
    if (nuevaContraseña !== confirmContraseña) {
        return res.status(400).json({ message: 'Las contraseñas no coinciden' });
    }

    // Verificar el token en la base de datos
    const query = 'SELECT * FROM Solicitante WHERE reset_token = ?';
    db.query(query, [token], (err, results) => {
        if (err) {
            console.error('Error al consultar la base de datos:', err);
            return res.status(500).json({ message: 'Error en la base de datos' });
        }

        if (results.length > 0) {
            const user = results[0];

            // Cifrar la nueva contraseña
            bcrypt.hash(nuevaContraseña, 10, (err, hashedPassword) => {
                if (err) {
                    console.error('Error al cifrar la contraseña:', err);
                    return res.status(500).json({ message: 'Error al procesar la contraseña' });
                }

                // Actualizar la contraseña en la base de datos
                const updateQuery = 'UPDATE Solicitante SET contraseña = ?, reset_token = NULL WHERE reset_token = ?';
                db.query(updateQuery, [hashedPassword, token], (err, results) => {
                    if (err) {
                        console.error('Error al actualizar la contraseña:', err);
                        return res.status(500).json({ message: 'Error al actualizar la contraseña' });
                    }

                    res.status(200).json({ message: 'Contraseña actualizada exitosamente' });
                });
            });
        } else {
            res.status(400).json({ message: 'Token inválido o expirado.' });
        }
    });
});

// Función para enviar el correo de restablecimiento
function sendResetPasswordEmail(email, token) {
    const transporter = nodemailer.createTransport({
        service: 'gmail', // Utiliza el servicio que prefieras
        auth: {
            user: 'tu-email@gmail.com',
            pass: 'tu-contraseña-de-correo'
        }
    });

    const mailOptions = {
        from: 'tu-email@gmail.com',
        to: email,
        subject: 'Restablecer Contraseña',
        text: `Haz clic en el siguiente enlace para restablecer tu contraseña: 
        http://localhost:3000/restablecer-password?token=${token}`
    };

    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            console.log('Error al enviar el correo:', error);
        } else {
            console.log('Correo enviado: ' + info.response);
        }
    });
}

// Servidor HTTPS
https.createServer(credentials, app).listen(port, () => {
    console.log(`Servidor HTTPS corriendo en https://localhost:${port}`);
});
