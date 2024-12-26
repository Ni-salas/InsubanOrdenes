const express = require('express');
const bodyParser = require('body-parser');
const { login } = require('./auth');

const app = express();
const port = 3000;

// Middleware
app.use(bodyParser.json());

// Rutas
app.post('/login', login);

// Servidor
app.listen(port, () => {
    console.log(`Servidor corriendo en http://localhost:${port}`);
});
