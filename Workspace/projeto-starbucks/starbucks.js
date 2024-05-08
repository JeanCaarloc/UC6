
const corSite = document.getElementById('cor-botao')

let dark = false;

corSite.addEventListener("click", function(){
    dark =! dark

    if(dark){

      document.body.style.background = "#000000";

    } else{

      document.body.style.background = "#ffffff";
    }

})


const corAreasSite = document.getElementById('nav-esquerda','nav-direita','destaque','cafe','planta','pessoas','rodape-link','rodape-redes')

let grey = false;

corAreasSite.addEventListener("click", function(){
    grey =! grey

    if(grey){
      document.body.style.background = "#bdbdbdeb";
    } else{
      document.body.style.background = "#ffffff";
    }
})


//function mudarBackground() {

    // Obtendo o elemento do corpo da página
  
    //var body = document.body;
  
    // Definindo o novo background
  
   // body.style.background = "#000000"; // Você pode usar qualquer cor válida aqui, como "blue", "#FF0000", "rgba(0, 255, 0, 0.5)", etc.
    
  
  //} body.style.background = "#000000";