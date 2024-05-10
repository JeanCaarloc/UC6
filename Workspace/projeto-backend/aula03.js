//console.log(nomes[1]);

// for (const nome of nomes) {
//     console.log(nome);
// }

// add novo elemento
//nomes.push('Rafaela')

//  remove o primeiro elemento da lista
//nomes.shift();
//nomes.shift();

//remove o ultimo elemento da lista
//nomes.pop();

//nomes.unshift('jose')

const nomes = ['joao', 'maria', 'jose']

const resultado = nomes.find((nome) => {
    return nome === 'jose'
})

console.log(resultado);

