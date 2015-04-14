
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
        <script src="../js/bootstrap.js"></script>
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css">        
        <link href="../css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Slab' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Bree+Serif' rel='stylesheet' type='text/css'>
        <script type="text/javascript">

            $(document).ready(function () {

                // sirve para bloquear los campos input
                $('.bloqueado').attr('disabled', 'disabled');

                //sirve para desbloquear los campos input y ocultar el boton actualizar
                $('#actualizar').click(function () {
                    $('.bloqueado').removeAttr('disabled');
                    $('#actualizar').hide();
                    $('#guardar').show();
                });

                // sirver para validar los campos del formulario
                $('#form1').validate({
                    rules: {
                        Documento: {
                            required: true,
                            number: true,
                            minlength: 8,
                            maxlength: 10
                        }
                    },
                    messages: {
                        Documento: {
                            required: "Este campo es Requerido",
                            number: "El campo debe ser Numérico ",
                            minlength: "Son {0} digitos Mínimo  ",
                            maxlength: "Son {0} digitos Máximo"
                        }
                    },
                });
            });
        </script>
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
        <div class="contenido">

            <div class="menu2"> 
                <div class="menucoreer"> <img class="vector" src="../imagenes/manu.png " width="70"	height="70"></div>
                    <% out.println(menu); %> 
            </div>
            <div class="mesa">
                <% if (uregistrado.getRol().equals("Medico")){ %>

                <div class="lado3">
                    <h1>Programar Citas</h1>
                    <form class="form-horizontal" name="form1" id="form1" action="../../GestionCitas">
                        <table>
                            <tr>
                                <td><label for="cedula" class="  col-lg-2 control-label">Documento:</label></td>
                                <td>
                                    <div class="form-group">

                                        <div class="col-lg-10">
                                            <input type="text" value="" name="cedula" required class="lettersonly form-control" id="cedula" placeholder="********">
                                        </div>
                                    </div>
                                </td>
                            </tr>  
                            <tr>

                                <td>
                                    <div class="form-group">

                                        <div class="col-lg-10">
                                            <input type="hidden" value="<%=uregistrado.getDocumento()%>" name="odontologo"  id="cedula" >
                                        </div>
                                    </div>
                                </td>
                            </tr> 
                            <tr>

                                <td><label for="fechacita" class=" InputRequired col-lg-2 control-label">Fecha Cita:</label></td> 
                                <td><div class="form-group">

                                        <div class="col-lg-10">
                                            <input type="date" id="fechacita" name="fechacita"  required class="form-control input-sm" onblur="javascript:validarFecha();">
                                        </div>
                                        
                                     
                          
                                    </div>
                                </td>
                               
                            </tr>
                            <tr>
                                <td><label for="turno" class=" InputRequired col-lg-2 control-label">Hora:</label></td> 
                                <td><div class="form-group">

                                        <div class="col-lg-10">
                                            <select  name="turno" id="turno" required class="  form-control">
                                                <%for (JornadaDTO jornadas : jornada) { %>
                                                <option value="<%=jornadas.getIdJornada()%>"><%=jornadas.getHorario()%></option>                                                
                                                <%} %>

                                            </select>

                                        </div>
                                    </div></td> 
                            </tr>
                            <tr>
                                <td><label for="Observaciones" class=" InputRequired col-lg-2 control-label">Observaciones:</label></td> 
                                <td><div class="form-group">

                                        <div class="col-lg-10">
                                            <select   name="observaciones" id="Especialidad" required class="  form-control">
                                                <option value="">Seleccione Especialidad</option>
                                                <option value="1">Odontología</option>
                                                <option value="2">Periodoncia </option>
                                                <option value="3" >Endodoncia </option>
                                                <option value="4">Odontopediatría  </option>    
                                                <option value="5">Ortodoncia </option>
                                                <option value="6">Odontogeriatría </option>
                                                <option value="7">Cirugía maxilofacial  </option>
                                            </select>
                                        </div>
                                    </div></td> 
                            </tr>
                        </table> 
                        <input type="submit" name="citar" class="botones" value="Asignar">
                    </form>
                </div>                            
                <div class="lado4">
                    <div id="respuesta" class="mensajegError"> </div>

                    <img src="../imagenes/imagenes.png" width="450" height="450" class="dibu">                
                



            

            <% } else if (uregistrado.getRol().equals("Secretaria")) {%>
            <div class="lado3">
                <h1>Programar Citas</h1>
                <form class="form-horizontal" name="form1" id="form1" action="../../GestionCitas">
                    <table>
                        <tr>
                            <td><label for="cedula" class="  col-lg-2 control-label">Documento Paciente:</label></td>
                            <td>
                                <div class="form-group">

                                    <div class="col-lg-10">
                                        <input type="text" value="" name="cedula" required class="lettersonly form-control" id="cedula" placeholder="********">
                                    </div>
                                </div>
                            </td>
                        </tr> 
                        <tr>
                            <td><label for="turno" class=" InputRequired col-lg-2 control-label">Odontologo:</label></td> 
                            <td><div class="form-group">

                                    <div class="col-lg-10">
                                        <select  name="odontologo" id="turno" required class="  form-control  InputRequired col-lg-2 control-label">
                                            <option value="">Seleccione un odontologo</option>
                                            <%for (UsuariosDTO odontologos : odonto) { %>
                                            <option value="<%odontologos.getDocumento();%>"><%=odontologos.getNombres() + odontologos.getApellidos()%></option>
                                            <%} %>

                                        </select>

                                    </div>
                                </div></td> 
                        </tr> 
                        <tr>

                            <td><label for="fechacita" class=" InputRequired col-lg-2 control-label">Fecha Cita:</label></td> 
                            <td><div class="form-group">

                                    <div class="col-lg-10">
                                        <input type="date" id="fechacita" name="fechacita"  required class="form-control input-sm" onblur="javascript:validarFecha();">
                                    </div>
                                    
                                    
                                </div></td>
                        </tr>
                        <tr>
                        <tr>
                            <td><label for="turno" class=" InputRequired col-lg-2 control-label">Hora:</label></td> 
                            <td><div class="form-group">

                                    <div class="col-lg-10">
                                        <select  name="turno" id="turno" required class="  form-control">
                                            <%for (JornadaDTO jornadas : jornada) { %>
                                            <option value="<%jornadas.getIdJornada();%>"><%=jornadas.getHorario()%></option>
                                            <%} %>

                                        </select>

                                    </div>
                                </div></td> 
                        </tr>

                    </table> 
                    <input type="submit" name="citar" class="botones" value="Asignar">
                </form>
            </div>                            
            <div class="lado4">
                <div id="respuesta" class="mensajegError"> </div>

                <img src="../imagenes/imagenes.png" width="450" height="450" class="dibu">                
            </div>


            <% } else if (uregistrado.getRol().equals("Paciente")) {%>

            
            

            <%                        if (request.getParameter("si") != null) {
                 CitaDTO citas = new CitaDTO();
                citas = (CitaDTO)sesion.getAttribute("Citas");
                UsuariosDTO doc = (UsuariosDTO) sesion.getAttribute("Odonto");
                
                
                
            %>
            <div class="lado4"  style="margin-top: 20px" >
                <div >
                    <div class="col-md-4"></div>
                    <div class="col-md-6"></div>

                    <div class="alert alert-success text-center">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <p><strong> Cita Programada </Strong> en este momento usted ya tiene una cita asignada <i class="glyphicon glyphicon-ok"></i></p>
                    </div>
                      <div class="lado1" style="text-align: center;">

                </div>
                <div class="lado2">

                </div>

            </div>
             <div class="Divprint" style="width:700px; margin-top:-80px;"  
                     >
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
                                <td><%=doc.getNombres() +"  "+doc.getApellidos() %></td>
                                
                                <td><%=citas.getFecha() %></td>
                                <td><%= citas.getJornada() %></td>
                                
                                


                            </tr>
                          


                    </table>
                                <div > <a href="../../GestionCitas?can=<%=citas.getIdPaciente()%>&&fechaci=<%=citas.getFecha()%> "><img style=" float: right; margin-right: -60;margin-top: -65;" src="../imagenes/cancelar.png" width="50" height="50" alt="Cancelar Cita" title="Cancelar Cital"/> </a></div>         

                   


                </div>
                    
                    
                    
                   <% } else {%>
                    <div class="lado3">
                        <h1>Programar Citas</h1>        
                        <form class="form-horizontal" name="form1" id="form1" action="../../GestionCitas">
                            <table>
                                <tr>

                                <div class="form-group">

                                    <div class="col-lg-10">
                                        <input type="hidden" value="<%=uregistrado.getDocumento()%>" name="cedula"  id="cedula" >
                                    </div>
                                </div>

                                </tr> 
                                <form class="form-horizontal" name="form2" id="form1" action="../../GestionCitas">
                                <tr>
                                    <td><label for="turno" class=" InputRequired col-lg-2 control-label">Odontologo:</label></td> 
                                    <td><div class="form-group">

                                            <div class="col-lg-10">
                                                <select  name="odontologo" id="turno" required class="  form-control  InputRequired col-lg-2 control-label">
                                                    <option value="">Seleccione un odontologo</option>
                                                    <%for (UsuariosDTO odontologos : odonto) { %>
                                                    <option value="<%odontologos.getDocumento();%>"><%=odontologos.getNombres() + odontologos.getApellidos()%></option>
                                                    <%} %>

                                                </select>

                                            </div>
                                        </div></td> 
                                </tr> 
                                <tr>

                                    <td><label for="fechacita" class=" InputRequired col-lg-2 control-label">Fecha Cita:</label></td> 
                                    <td><div class="form-group">

                                            <div class="col-lg-10">
                                                <input type="date" id="fechacita" name="fechacita"  required class="form-control input-sm" onblur="javascript:validarFecha();">
                                            </div>

                                        </div>
                                        
                                       </td>
                                
                                </tr>
                                
                                <input type="submit" name="horas" class="botones" value=">>">
                                </form>
                                <tr>
                                    <td><label for="turno" class=" InputRequired col-lg-2 control-label">Hora:</label></td> 
                                    <td><div class="form-group">

                                            <div class="col-lg-10">
                                                <select  name="turno" id="turno" required class="  form-control">
                                                    <%for (JornadaDTO jornadas : jornada) { %>
                                                    <option value="<%jornadas.getIdJornada();%>"><%=jornadas.getHorario()%></option>
                                                    <%} %>

                                                </select>

                                            </div>
                                        </div></td> 
                                </tr>

                            </table> 
                            <input type="submit" name="citar" class="botones" value="Asignar">
                        </form>
                    </div>                            
                    <div class="lado4">
                        <div id="respuesta" class="mensajegError"> </div>
                                   <div class="lado4">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-6">
                             
                        <div class="col-md-4"></div>
                    </div>
                </div>

            </div>
                             
                        <img src="../imagenes/imagenes.png" width="450" height="450" class="dibu">                
                    </div>




                    <div class="col-md-4"></div>
                </div>
            </div>

        </div>


        <% }%>

    </div>     

 <%   }%>   
    
                    <div class="lado4">
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
                        <div class="alert alert-error " role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <p><strong> Cita No asignada</Strong> No se ha podido asignar la cita vuelva a intentarlo <i class='glyphicon glyphicon-ok'></i></p>
                        </div>


                        <% }
                        %>
                        <div class="col-md-4"></div>
                    </div>
                </div>

            </div>
                
        
     <%  }  else {
            response.sendRedirect("../index.jsp");
        }

    %>

</body>
</html>
