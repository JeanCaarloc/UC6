const express = require('express');
const { listarInstrutores, listarUmInstrutor } = require('./controladores/instrutores');

const rotas = express();

rotas.get('/', listarInstrutores)
rotas.get('/instrutor/:id', listarUmInstrutor)


module.exports = rotas;