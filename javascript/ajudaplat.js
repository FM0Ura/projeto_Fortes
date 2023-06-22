document.addEventListener("DOMContentLoaded", function () {
  const perguntas = document.querySelectorAll(".duvida");

  perguntas.forEach(function (pergunta) {
    const titulo = pergunta.querySelector("h2");

    titulo.addEventListener("click", function () {
      pergunta.classList.toggle("expandida");
      const conteudo = pergunta.querySelector(".conteudo");
      conteudo.style.display = pergunta.classList.contains("expandida")
        ? "block"
        : "none";
    });
  });
});

function myFunction() {
  var x = document.getElementById("myLinks");
  if (x.style.display === "block") {
    x.style.display = "none";
  } else {
    x.style.display = "block";
  }
}
