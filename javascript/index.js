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
