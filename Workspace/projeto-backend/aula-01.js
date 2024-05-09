//console.log('Teste');

// const idade = 17;
// const genero = "Masculino"

// if (idade >= 18 || genero == "Masculino") {
//     console.log("Pode trabalhar");
// } else {
//     console.log("Não pode trabalhar");
// }



// idade > 17 ? console.log("sim") : console.log("não");

// Exercicio 01 - //## Pedra, papel ou tesoura

const jogada1 = "pedra"
const jogada2 = "tesoura"


if (jogada1 === jogada2) {
    console.log("Empate");
} else if (jogada1 === "pedra" && jogada2 === "tesoura"){
    console.log(`O jogador 1 venceu com ${jogada1}`);
} else if (jogada1 === "tesoura" && jogada2 === "papel") {
    console.log(`O jogador 1 venceu com ${jogada1}`);
} else if (jogada1 === "papel" && jogada2 === "pedra") {
    console.log(`O jogador 1 venceu com ${jogada1}`);
} else {
    console.log(`O jogador 2 venceu com ${jogada2}`);
}


// Exercicio 02 - // ## Par ou ímpar

