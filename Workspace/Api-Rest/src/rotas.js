const express = require('express');
const { listarInstrutores, listarUmInstrutor, cadastrarInstrutores, atualizarInstrutor, deletarInstrutor } = require('./controladores/instrutores');

const rotas = express();

rotas.get('/', listarInstrutores); //rota para listar todos instrutores
rotas.get('/instrutor/:id', listarUmInstrutor); // rota para listar um instrutor atraves de um id
rotas.post('/instrutores', cadastrarInstrutores); // rota para cadastrar/adicionar instrutores
rotas.put('/instrutores/:id', atualizarInstrutor); // rota que vai chamar um instrutor cadastrado
rotas.delete('/instrutores/:id', deletarInstrutor); // rota para deletar instrutor


module.exports = rotas;