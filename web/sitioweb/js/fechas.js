function validarFecha() {
    var temp = document.getElementById("fechacita").value;
    var y = temp.split("-")
    var fechaSolicitud=new Date(y[0],y[1]-1,y[2]); // se forma la fecha que viene del formulario
    var fechaActual = new Date();   //Fecha actual
    var ftemp = new Date(); // Variable con la fecha actual
     var ftemp2 = new Date();
    var fechaMinima = new Date(ftemp.getTime() + (5 * 24 * 3600 * 1000));   //Sumo 5 dias a la fecha actual para obtener la fecha mínima
    var fechaMaxima = new Date (ftemp2.getTime() + (30 * 24 * 3600 * 1000));  // sumo 30 días a la fecha actual para

   //alert("Actual  : "+fechaActual + "  fecha calendario : "+fechaSolicitud+ "la fecha mínima es : "+fechaMinima);
    
    if (fechaSolicitud < fechaActual){
        document.getElementById("respuesta").innerHTML=" <div><p><strong>Fecha No Valida</Strong> No es posible asignar citas con fechas anteriores <i class='glyphicon glyphicon-ok'></i></p><div>";
        document.getElementById("fechacita").focus();
        
    }else if(fechaSolicitud >=fechaMaxima){
       document.getElementById("respuesta").innerHTML="<div> <p><strong>Fecha No Valida</Strong> No es posible asignar con tanta anticipacion <i class='glyphicon glyphicon-ok'></i></p></div>";
       document.getElementById("fechacita").focus();
    }else if(fechaSolicitud.getDay()==0 ){
          document.getElementById("respuesta").innerHTML="<div><p><strong>Fecha No Valida</Strong> No se presta el servivio odontologico los dias domingo <i class='glyphicon glyphicon-ok'></i></p></div>";
       document.getElementById("fechacita").focus();
        
    }
  else{
        document.getElementById("respuesta2").innerHTML="ok";
  

}
}