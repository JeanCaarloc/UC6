const meuBotao = document.getElementById('meu-botao')
const titulo = document.getElementById('titulo')

meuBotao.addEventListener("click", function() {
    alert("O botao foi clicado!")
    titulo.innerHTML = `
    <h3>Eita! Mudou...</h3>
`     
})


const meuImput = document.getElementById('meu-campo')

meuImput.addEventListener("keydown", function(letra) {
    alert(`Tecla pressionada: ${letra.key}`);
})  


const botaoMudarTexto = document.getElementById('botao-mudar-texto')
const texto = document.getElementById('texto')

botaoMudarTexto.addEventListener("click", function(){
    texto.innerHTML = `
    <h5>Eita!Mudou...</h5>
    `
})


const botaoMudarImagem = document.getElementById('botao-mudar-imagem')
const imagem = document.getElementById('imagem')

botaoMudarImagem.addEventListener("click", function(){
    imagem.setAttribute('src', './img-02.jpg')
})