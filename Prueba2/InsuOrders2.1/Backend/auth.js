const db = require('./db');

const login = (req, res) => {
    const { usuario, contraseña } = req.body;

    if (!usuario || !contraseña) {
        return res.status(400).json({ message: 'Usuario y contraseña son requeridos' });
    }

    const query = 'SELECT * FROM Solicitante WHERE usuario = ? AND contraseña = ?';
    db.query(query, [usuario, contraseña], (err, results) => {
        if (err) {
            console.error('Error en la consulta:', err);
            return res.status(500).json({ message: 'Error en el servidor' });
        }

        if (results.length > 0) {
            res.status(200).json({ message: 'Autenticación exitosa' });
        } else {
            res.status(401).json({ message: 'Usuario o contraseña incorrectos' });
        }
    });
};

module.exports = { login };
