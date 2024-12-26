const bcrypt = require('bcryptjs');
const db = require('./db');
const nodemailer = require('nodemailer');

// Configuración de nodemailer para el envío de correos
const transporter = nodemailer.createTransport({
    service: 'gmail',  // Usa el servicio que prefieras, por ejemplo, Gmail
    auth: {
        user: 'tu_correo@gmail.com',  // Tu correo de Gmail
        pass: 'tu_contraseña_o_app_password',  // Tu contraseña o una contraseña de aplicación generada
    },
});

// Función para iniciar sesión (login)
const login = (req, res) => {
    const { usuario, contraseña } = req.body;

    if (!usuario || !contraseña) {
        return res.status(400).json({ message: 'Usuario y contraseña son requeridos' });
    }

    const query = 'SELECT * FROM Solicitante WHERE usuario = ?';
    db.query(query, [usuario], (err, results) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(500).json({ message: 'Error en el servidor' });
        }

        if (results.length > 0) {
            const user = results[0];
            
            // Comparar la contraseña ingresada con la cifrada
            bcrypt.compare(contraseña, user.contraseña, (err, isMatch) => {
                if (err) {
                    console.error('Error al comparar contraseñas:', err);
                    return res.status(500).json({ message: 'Error al procesar la contraseña' });
                }

                if (isMatch) {
                    res.status(200).json({ message: 'Autenticación exitosa' });
                } else {
                    res.status(401).json({ message: 'Usuario o contraseña incorrectos' });
                }
            });
        } else {
            res.status(401).json({ message: 'Usuario o contraseña incorrectos' });
        }
    });
};

// Función para restablecer la contraseña (olvidada) con envío de correo
const resetPassword = (req, res) => {
    const { email } = req.body; // Usamos el email en vez del usuario

    if (!email) {
        return res.status(400).json({ message: 'Correo electrónico es requerido' });
    }

    // Buscar al usuario en la base de datos
    const query = 'SELECT * FROM Solicitante WHERE email = ?';
    db.query(query, [email], (err, results) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(500).json({ message: 'Error en la base de datos' });
        }

        if (results.length > 0) {
            const user = results[0];

            // Generar un token único para el restablecimiento de la contraseña
            const resetToken = Math.random().toString(36).substr(2);  // Token simple, podrías usar JWT o uno más robusto
            const tokenExpiry = new Date(Date.now() + 5 * 60 * 1000);  // Expira en 5 minutos

            // Actualizar el token y la fecha de expiración en la base de datos
            const updateQuery = 'UPDATE Solicitante SET reset_token = ?, reset_token_expiry = ? WHERE email = ?';
            db.query(updateQuery, [resetToken, tokenExpiry, email], (err, result) => {
                if (err) {
                    console.error('Error al actualizar el token en la base de datos:', err);
                    return res.status(500).json({ message: 'Error al actualizar el token en la base de datos' });
                }

                // Generar el enlace de restablecimiento de contraseña
                const resetLink = `https://localhost:3000/reset-password?token=${resetToken}`;

                // Enviar el enlace al correo del usuario
                const mailOptions = {
                    from: 'tu_correo@gmail.com',
                    to: user.email,
                    subject: 'Restablecimiento de contraseña',
                    text: `Hola ${user.nombre},\n\nPara restablecer tu contraseña, por favor haz clic en el siguiente enlace:\n\n${resetLink}\n\nSi no solicitaste este cambio, por favor ignora este correo.`,
                };

                transporter.sendMail(mailOptions, (err, info) => {
                    if (err) {
                        console.error('Error al enviar el correo:', err);
                        return res.status(500).json({ message: 'Error al enviar el correo' });
                    }

                    res.status(200).json({ message: 'Enlace de restablecimiento enviado al correo' });
                });
            });
        } else {
            res.status(404).json({ message: 'Usuario no encontrado' });
        }
    });
};

// Función para actualizar la contraseña (restablecerla después de hacer clic en el enlace)
const updatePassword = (req, res) => {
    const { token, nuevaContraseña, confirmContraseña } = req.body;

    if (!token || !nuevaContraseña || !confirmContraseña) {
        return res.status(400).json({ message: 'Token, nueva contraseña y confirmación son requeridos' });
    }

    if (nuevaContraseña !== confirmContraseña) {
        return res.status(400).json({ message: 'Las contraseñas no coinciden' });
    }

    // Verificar si el token es válido y no ha expirado
    const query = 'SELECT * FROM Solicitante WHERE reset_token = ?';
    db.query(query, [token], (err, results) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(500).json({ message: 'Error en la base de datos' });
        }

        if (results.length > 0) {
            const user = results[0];

            // Verificar si el token ha expirado
            const currentTime = new Date();
            if (currentTime > new Date(user.reset_token_expiry)) {
                return res.status(400).json({ message: 'El enlace de restablecimiento ha expirado' });
            }

            // Cifrar la nueva contraseña
            bcrypt.hash(nuevaContraseña, 10, (err, hashedPassword) => {
                if (err) {
                    console.error('Error al cifrar la contraseña:', err);
                    return res.status(500).json({ message: 'Error al procesar la nueva contraseña' });
                }

                // Actualizar la contraseña en la base de datos
                const updateQuery = 'UPDATE Solicitante SET contraseña = ?, reset_token = NULL, reset_token_expiry = NULL WHERE cod_solic = ?';
                db.query(updateQuery, [hashedPassword, user.cod_solic], (err, result) => {
                    if (err) {
                        console.error('Error al actualizar la contraseña:', err);
                        return res.status(500).json({ message: 'Error al actualizar la contraseña' });
                    }

                    res.status(200).json({ message: 'Contraseña actualizada exitosamente' });
                });
            });
        } else {
            res.status(404).json({ message: 'Token no válido o no encontrado' });
        }
    });
};

module.exports = { login, resetPassword, updatePassword };