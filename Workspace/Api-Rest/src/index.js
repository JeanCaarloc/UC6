const express = require('express');
const rotas = require('./rotas');

const app = express();

app.use(express.json());

app.use(rotas);

app.listen(3001, () => {
    console.log('Servidor: http://localhost:3000');
})