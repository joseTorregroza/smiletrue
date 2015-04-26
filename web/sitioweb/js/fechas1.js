//function validarFecha() {
//    var temp = document.getElementById("fechacita").value;
//    var y = temp.split("-")
//    var fechaSolicitud=new Date(y[0],y[1]-1,y[2]); // se forma la fecha que viene del formulario
//    var fechaActual = new Date();   //Fecha actual
//    var ftemp = new Date(); // Variable con la fecha actual
//     var ftemp2 = new Date();
//    var fechaMinima = new Date(ftemp.getTime() + (5 * 24 * 3600 * 1000));   //Sumo 5 dias a la fecha actual para obtener la fecha mínima
//    var fechaMaxima = new Date (ftemp2.getTime() + (30 * 24 * 3600 * 1000));  // sumo 30 días a la fecha actual para
//
//   //alert("Actual  : "+fechaActual + "  fecha calendario : "+fechaSolicitud+ "la fecha mínima es : "+fechaMinima);
//    
//    if (fechaSolicitud <=fechaActual){
//        document.getElementById("respuesta").innerHTML=" <div><p><strong>Fecha No Valida</Strong> No es posible asignar citas con fechas anteriores <i class='glyphicon glyphicon-ok'></i></p><div>";
//        document.getElementById("fechacita").focus();
//        
//    }else if(fechaSolicitud >=fechaMaxima){
//       document.getElementById("respuesta").innerHTML="<div> <p><strong>Fecha No Valida</Strong> No es posible asignar con tanta anticipacion <i class='glyphicon glyphicon-ok'></i></p></div>";
//       document.getElementById("fechacita").focus();
//    }else if(fechaSolicitud.getDay()==0 ){
//          document.getElementById("respuesta").innerHTML="<div><p><strong>Fecha No Valida</Strong> No se presta el servivio odontologico los dias domingo <i class='glyphicon glyphicon-ok'></i></p></div>";
//       document.getElementById("fechacita").focus();
//        
//    }
//  else{
//        document.getElementById("respuesta").innerHTML="<div><p><strong>ok</Strong>  <i class='glyphicon glyphicon-ok'></i></p></div>";
//
//}
function validarFecha(fecha) {
    var temp = document.getElementById("fechacita").value;
    var y = temp.split("-")
    var fechaSolicitud = new Date(y[0], y[1] - 1, y[2]); // se forma la fecha que viene del formulario
    var fechaActual = new Date();   //Fecha actual
    var ftemp = new Date(); // Variable con la fecha actual
    var ftemp2 = new Date();
    var fechaMinima = new Date(ftemp.getTime() + (5 * 24 * 3600 * 1000));   //Sumo 5 dias a la fecha actual para obtener la fecha mínima
    var fechaMaxima = new Date(ftemp2.getTime() + (30 * 24 * 3600 * 1000));  // sumo 30 días a la fecha actual para

    if (fechaSolicitud <= fechaActual) {
        document.getElementById('fechacita').setAttribute('data-toggle', 'tooltip');
        document.getElementById('fechacita').setAttribute('data-original-title', 'No es posible selecionar una fecha anterior');
        $(document).ready(function () {
            // Initialize tooltip
            $('[data-toggle="tooltip"]').tooltip({
                placement: 'right'
            });
        });
        document.getElementById('inpFecha').setAttribute('class', 'form-group has-feedback has-error');
        document.getElementById('botonRegistro').setAttribute('disabled', 'true');
        return false;
    }
    if (fechaSolicitud >= fechaMaxima) {
        document.getElementById('fechacita').setAttribute('data-toggle', 'tooltip');
        document.getElementById('fechacita').setAttribute('data-original-title', 'No es posible asignar con tanta anticipacion');
        $(document).ready(function () {
            // Initialize tooltip
            $('[data-toggle="tooltip"]').tooltip({
                placement: 'right'
            });
        });
        document.getElementById('inpFecha').setAttribute('class', 'form-group has-feedback has-error');
        document.getElementById('botonRegistro').setAttribute('disabled', 'true');
        return false;

    }
    if (fechaSolicitud.getDay() == 0 || fechaSolicitud.getDay() == 6) {
        document.getElementById('fechacita').setAttribute('data-toggle', 'tooltip');
        document.getElementById('fechacita').setAttribute('data-original-title', 'Este dia no se presta servicio');

        $(document).ready(function () {
            // Initialize tooltip
            $('[data-toggle="tooltip"]').tooltip({
                placement: 'right'
            });
        });
        document.getElementById('inpFecha').setAttribute('class', 'form-group has-feedback has-error');
        document.getElementById('botonRegistro').setAttribute('disabled', 'true');
        return false;

    }


    if (fecha.value === null || fecha.value === "") {
        document.getElementById('fechacita').setAttribute('data-toggle', 'tooltip');
        document.getElementById('fechacita').setAttribute('data-original-title', 'Debe Selecionar una fecha');
        $(document).ready(function () {
            // Initialize tooltip
            $('[data-toggle="tooltip"]').tooltip({
                placement: 'right'
            });
        });
        document.getElementById('inpFecha').setAttribute('class', 'form-group has-feedback has-error');
        document.getElementById('botonRegistro').setAttribute('disabled', 'true');
        return false;
    } else {
        document.getElementById('fechacita').removeAttribute('data-toggle', 'tooltip');
        document.getElementById('fechacita').removeAttribute('data-original-title');
        document.getElementById('inpFecha').setAttribute('class', 'form-group has-feedback has-success');

        document.getElementById('botonRegistro').removeAttribute('disabled');
    }
}
