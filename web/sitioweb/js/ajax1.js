/* 
 * Cargar Ciudades en Pos de un Departamento
 */
var req1;

function jornadaslist(idfecha) {
     var campo = document.getElementById("odontologo");
     var campo1 = document.getElementById("fechacita");
    if (campo.value === '')
        return false;

    if (window.XMLHttpRequest) {
        req1 = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        req1 = new ActiveXObject("Microsoft.XMLHTTP");
    } else {
        alert("El navegador no soporta Ajax!");
        return;
    }

    var url = "../ajax/cargarJornadas.jsp?idfecha=" +escape(campo1.value)+"&&idDoctor="+escape(campo.value);
    req1.onreadystatechange = resultadoJornadas;
    req1.open("GET", url, true);
    req1.send(null);

}

function resultadoJornadas() {
    if (req1.readyState === 4) {
        document.getElementById("turno").innerHTML = req1.responseText;
    }
}





