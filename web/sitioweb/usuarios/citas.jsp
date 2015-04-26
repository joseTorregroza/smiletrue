
<%@page import="Dtos.CitaDTO"%>
<%@page import="Dtos.JornadaDTO"%>
<%@page import="java.util.ArrayList"%>

<html>
    <head>
        <%@page import="Dtos.UsuariosDTO"%>
        <%@page import="Daos.UsuarioDAO"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <title>Smile System</title>
        <meta charset="utf-8" />
        <%@page errorPage="../error404.jsp" %> 
        <link rel="shortcut icon" href="../imagenes/favicon.ico" />
        <link href="../css/footer.css" rel="stylesheet" type="text/css">
        <link href="../css/css.css" rel="stylesheet" type="text/css">
        <script src="../js/jquery.js"></script>
        <script src="../js/jquery.validate.js"></script>
        <script src="../js/fechas.js" type="text/javascript"></script>
        <script type="text/javascript" src="../js/Validacion.js"></script>
        <script type="text/javascript" src="../js/ajax.js"></script>
        <script type="text/javascript" src="../js/validacionesAjax.js"></script>
        <script src="../js/bootstrap.js"></script>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css">   
        
        <link href="../css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Slab' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Bree+Serif' rel='stylesheet' type='text/css'>

        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
    </head>
    <body>
        <%
            HttpSession miSesion = request.getSession(false);
            HttpSession sesion = request.getSession(false);
            if (miSesion.getAttribute("usr") != null) {
                UsuariosDTO uregistrado = (UsuariosDTO) miSesion.getAttribute("usr");
                String menu = (String) miSesion.getAttribute("mp");
                ArrayList<JornadaDTO> jornada = new ArrayList();
                jornada = (ArrayList<JornadaDTO>) sesion.getAttribute("jornada");
                ArrayList<UsuariosDTO> odonto = new ArrayList();
                odonto = (ArrayList<UsuariosDTO>) sesion.getAttribute("medicos");


        %>

        <div class="logo">        
            <img src="../imagenes/banner-enviar.jpg" height="160" width="1200">
        </div>
        <div class="menu">
            <div class="tags">
                <a href="iniciarsesion.jsp"><strong>Iniciar Sesión</strong></a>
                <a href="#"><strong>Citas Paciente</strong></a>
            </div>
            <div class ="menu-session">     
                <button type="button" onClick="javascript:window.location = '../indexout.jsp'"   class="btn btn-info" >Cerrar Sesión </button>
            </div>
            <div class ="menu-session">
                <span style="color:white; font-size: 16px;  font-weight: bold">  <%  out.print(uregistrado.getRol());%>:  </span>
                <span style="color:white; font-size: 16px;  font-weight: bold"> <%  out.print(uregistrado.getNombres());%> <%  out.print(uregistrado.getApellidos());%></span>                  
            </div>
        </div>
            <div class="contenido" style="height: 580px;" >

            <div class="menu2"> 
                <div class="menucoreer"> <img class="vector" src="../imagenes/manu.png " width="70"	height="70"></div>
                    <% out.println(menu); %> 
            </div>
            <div class="mesa">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-6">
                        <%                        if (request.getParameter("info") != null) {
                        %>
                        <div class="alert alert-info text-center">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <p><strong> Cita asignada</Strong> La cita  se ha reservado sin contratiempo <i class='glyphicon glyphicon-ok'></i></p>
                        </div>
                        <%
                    } else if (request.getParameter("alert") != null) {%>
                        <div class="alert alert-danger " role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <p><strong> Cita No asignada</Strong> No se recuerde no puede tener 2 Citas el mismo dia <i class='glyphicon glyphicon-ok'></i></p>
                        </div>


                        <% }
                        %>
                        <div class="col-md-4"></div>
                    </div>
                </div>


                <%      if (request.getParameter("si") != null) {
                        CitaDTO citas = new CitaDTO();
                        citas = (CitaDTO) sesion.getAttribute("Citas");
                        UsuariosDTO doc = (UsuariosDTO) sesion.getAttribute("Odonto");


                %>
                
                    <div >
                        <div class="col-md-4"></div>
                        <div class="col-md-6"></div>

                        <div class="alert alert-success text-center">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <p><strong> Cita Programada </Strong> en este momento usted ya tiene una cita asignada <i class="glyphicon glyphicon-ok"></i></p>
                        </div>
                      

                    </div>
                    <div class="Divprint" style="  width: 700px; margin-top: 35px; margin-left: 81px;;"  
                         >
                        <h1 class="h1-session" style="padding-top: 20px;">Informacion Cita</h1>
                        <table id ="tablah"  class="table table-bordered table-striped table-hover" >
                            <thead>
                                <tr id="titulo" >


                                    <td style=" width:150px; height: 20px" > Identificacion</td>
                                    <td style=" width: 150px; height: 20px" > Doctor</td>

                                    <td style=" width: 150px; height: 20px">Fecha</td>
                                    <td style=" width: 150px; height: 20px" >Horario</td>
                                </tr>
                            </thead>
                            <tbody>

                                <tr>
                                    <td><%=citas.getIdOdontologo() %></td>
                                    <td><%=doc.getNombres() + "  " + doc.getApellidos() %></td>

                                    <td><%=citas.getFecha() %></td>
                                    <td><%= citas.getJornada()  %></td>

                                </tr>


                        </table>
                      <a  class="btn btn-danger" role="button"  href="../../GestionCitas?can2=<%=citas.getIdPaciente()%>&&fechaci2=<%=citas.getFecha()%> " title="Cancelar Cital" style="margin-left: 723px; margin-top: -54;" > Cancelar </a>        

                    </div>

                    <% } else {%>

                    <div class="col-md-10" style="margin-left: 24px;   width: 494px;">
                        <h1 class="h1-session" style="padding-top: 20px;width: 344px;">Asiganar Citas</h1>
                        <form class="form-horizontal" action="../../GestionCitas" method="post" autocomplete="off" >
                            <div class="col-md-8">
                                <%if (uregistrado.getRol().equals("Paciente")) {%>
                                <input type="hidden" name="cedula" value="<%=uregistrado.getDocumento()%>">
                                        
                                   <% }else{
                                %>
                                <div class="form-group has-feedback" id="inpDocumento">
                                    <label class="control-label" for="cedula">Documento:</label>
                                    <input type="text" class="form-control" tabindex="1" name="cedula" onchange=" validarUsuarioYaRegistrado(this);"
                                           id="cedula" value="" maxlength="12" onblur="validarDocumento(this)"  style=" margin-left: 0px;"  >
                  <div id="empResult" style="background-color: white; font-size: 12px;color:red;">
            </div><div id="empResult2" style="background-color: white; font-size: 12px;color:green;">
            </div>
                                </div>
              
                                <%}%>
                                <%if (uregistrado.getRol().equals("Medico")) {%>
                                <input type="hidden" name="odontologo" value="<%=uregistrado.getDocumento()%>">
                                        
                                  <%  } else{ %>
                                <div class="form-group has-feedback" id="inpRol">
                                    <label for="odontologo" class="control-label">Odontologo:</label>
                                    <select name="odontologo" id="odontologo" class="form-control" tabindex="2"  required autofocus   onblur="validarRol(this)" onchange="getSubcategorias(this) >
                                        <option value="" >Seleccione un odontologo</option>
                                        <%for (UsuariosDTO odontologos : odonto) { %>
                                        <option value="<%=odontologos.getDocumento()%>"><%=odontologos.getNombres() + odontologos.getApellidos()%></option>
                                        <%} %>                                                  
                                    </select>
                                </div> 
                                    <% }%>
                                <div class="form-group has-feedback" id="inpFecha">
                                    <label class="control-label" for="fechacita">Fecha:</label>
                                    <input type="date" class="form-control" name="fechacita" id="fechacita"    tabindex="3" onblur="validarFecha(this)" style=" margin-left: 0px; width: 312.5px;" onchange="getSubcategorias(this)>

                                </div>
                                <div class="form-group has-feedback" id="inpCiudad">
                                    <label class="control-label" for="turno">Hora:</label>
                                    <select name="turno" id="turno" class="form-control" tabindex="4"  required autofocus    onblur="validarHora(this)">
                                        <option value="">Seleccione una hora</option>
                                        <option value="3">9:30</option>
                                        
                                    </select>
                                </div>                                
                                    <%if (!uregistrado.getRol().equals("Medico")) {
                                          
                                        }else{
                                    %>
                                <div class="form-group has-feedback" id="inpNombres">
                                    <label class="control-label" for="observacion">Observacion:</label>
                                    <textarea class="form-control" rows="3" name="observacion"  onblur="validarNombres(this);" 

                                              id="observacion" tabindex="5" ></textarea>

                                </div>
                                <% }%>
                                <input class="btn btn-success" type="submit" name="citar"  value="Asignar" style="margin-left: 40px;">
                                </div>
                           
                                </form>
                            
                    </div>



                    <div class="lado4">
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-6">

                                <div class="col-md-4"></div>
                            </div>
                        </div>

                    </div>

                    <img src="../imagenes/imagenes.png" width="350" height="350" style="margin-top: 71px;" class="dibu">                
                </div>




               
                                  <% }%>
            </div>
       


<%  } else {
        response.sendRedirect("../index.jsp");
    }

%>

</body>
</html>
