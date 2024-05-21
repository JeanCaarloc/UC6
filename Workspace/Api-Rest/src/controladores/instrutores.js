let { instrutores, id } = require("../bancoDeDados");



function listarInstrutores (req, res) {
    return res.status(200).json(instrutores);
}


function listarUmInstrutor(req, res){
    const { id } = req.params;

    const resultado = instrutores.find( (instrutor) => {
        return instrutor.id === Number(id);
    })

    if(!resultado){
        return res.status(404).json({ mensagem: 'Instrutor não encontrado.' })
    }

    return res.status(200).json(resultado);
}


function cadastrarInstrutores (req, res){
    //console.log(req.body);
    const {nome, email, status} = req.body

    if (!nome) {
        return res.status(400).json({ mensagem: "O campo Nome é obrigatório."})
    }
    if (!email) {
        return res.status(400).json({ mensagem: "O campo E-mail é obrigatório."})
    }
    if (!status) {
        return res.status(400).json({ mensagem: "O campo Status é obrigatório."})
    }



    const instrutor = {
        id: id++,
        nome: nome,
        email: email,
        status: status
    }


    instrutores.push(instrutor);

    return res.status(201).json(instrutor);
}



function atualizarInstrutor (req, res){
    const { id } = req.params;
    const {nome, email, status} = req.body

    const resultado = instrutores.find( (instrutor) => {
        return instrutor.id === Number(id);
    })

    if(!resultado){
        return res.status(404).json({ mensagem: 'Instrutor não localizado.' })
    }

    if (!nome) {
        return res.status(400).json({ mensagem: "O campo Nome é obrigatório."})
    }

    if (!email) {
        return res.status(400).json({ mensagem: "O campo E-mail é obrigatório."})
    }

    if (!status) {
        return res.status(400).json({ mensagem: "O campo Status é obrigatório."})
    }

    resultado.nome = nome;
    resultado.email = email;
    resultado.status = status;

    return res.status(204).send(resultado)
}


function deletarInstrutor(req, res){
    const { id } = req.params;

    const resultado = instrutores.find( (instrutor) => {
        return instrutor.id === Number(id);
    })

    if(!resultado){
        return res.status(404).json({ mensagem: 'Instrutor não localizado.' })
    }

    instrutores = instrutores.filter((instrutor) => {
        return instrutor.id !== Number(id);
    })

    return res.status(200).json({ mensagem: "Usuário deletado com sucesso."})
}


module.exports = {
    listarInstrutores,
    listarUmInstrutor,
    cadastrarInstrutores,
    atualizarInstrutor,
    deletarInstrutor
}