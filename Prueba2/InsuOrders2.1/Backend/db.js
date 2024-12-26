const mysql = require('mysql');

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'insubanbd',
    port: 3306  // Aquí especificas el puerto de MySQL
});

db.connect((err) => {
    if (err) {
        console.error('Error conectando a la base de datos:', err);
        process.exit(1);
    }
    console.log('Conexión exitosa a la base de datos.');
});

module.exports = db;
