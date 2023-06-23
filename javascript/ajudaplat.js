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

function removerCabecalho() {
  var cabecalho = document.querySelector("#cabecalho");
  if (cabecalho == null) {
    return false;
  } else {
    cabecalho.remove();
    return true;
  }
}

function myFunction() {
  if (removerCabecalho() == false) {
    var x = document.getElementById("myLinks");
    if (x.style.display === "block") {
      x.style.display = "none";
    } else {
      x.style.display = "block";
    }
  }
}
