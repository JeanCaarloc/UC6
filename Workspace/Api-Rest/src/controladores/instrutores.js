const { instrutores } = require("../bancoDeDados");


function listarInstrutores (req, res) {
    return res.status(200).json(instrutores);
}


function listarUmInstrutor(req, res){
    const {id} = req.params;

    const resultado = instrutores.find( (instrutor) => {
        return instrutor.id === Number(id);
    })

    if(!resultado){
        return res.status(404).json({ mensagem: 'Instrutor não encontrado.' })
    }

    return res.status(200).json(resultado);
}


module.exports = {
    listarInstrutores,
    listarUmInstrutor
}