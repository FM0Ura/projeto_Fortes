document.addEventListener("DOMContentLoaded", function() {
  const perguntas = document.querySelectorAll(".duvida");

  perguntas.forEach(function(pergunta) {
    const titulo = pergunta.querySelector("h2");

    titulo.addEventListener("click", function() {
      pergunta.classList.toggle("expandida");
      const conteudo = pergunta.querySelector(".conteudo");
      conteudo.style.display = pergunta.classList.contains("expandida") ? "block" : "none";
    });
  });
});
