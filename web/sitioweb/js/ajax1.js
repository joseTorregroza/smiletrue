/* 
 * Cargar Ciudades en Pos de un Departamento
 */

var xmlHttp;
function jornadaslist(idfecha,idDoctor) {

    if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else {
        alert("El navegador no soporta Ajax!");
        return;
    }

    var url = "../ajax/cargarJornadas.jsp?idfecha=" + idfecha+"&&idDoctor="+idDoctor;
    xmlHttp.onreadystatechange = resultadoJornadas;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);

}

function resultadoJornadas() {
    if (xmlHttp.readyState === 4) {
        document.getElementById("turno").innerHTML = xmlHttp.responseText;
    }
}





