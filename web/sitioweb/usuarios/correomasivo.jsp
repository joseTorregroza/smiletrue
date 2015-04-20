<%@page import="java.util.ArrayList"%>
<%@page import="Facade.FUsuarios"%>
<html>
    <head>
        <%@page import="Dtos.UsuariosDTO"%>
        
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="../error404.jsp" %> 
        <title>Smile System</title>
        <meta charset="utf-8" />
        <link rel="shortcut icon" href="../imagenes/favicon.ico" />
        <link href="../css/footer.css" rel="stylesheet" type="text/css">
        <link href="../css/secre.css" rel="stylesheet" type="text/css">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css">        
        <link href="../css/bootstrap-responsive.css" rel="stylesheet" type="text/css">

        <script src="../js/jquery.js"></script>
        <script src="../js/jquery.validate.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Slab' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Bree+Serif' rel='stylesheet' type='text/css'>
        <script type="text/javascript">
            $(document).ready(function () {

                //codigo para validar que los campos solo sean letras
                jQuery.validator.addMethod("lettersonly", function (value, element) {
                    return this.optional(element) || /^[a-z]+$/i.test(value);
                }, "Digite solo caracteres");

                // sirve para bloquear los campos input
                $('.bloqueado').attr('disabled', 'disabled');
                $('.nobloqueado').attr('disabled', 'disabled');

              

                // sirver para validar los campos del formulario
                $('#form1').validate({
                    rules: {
                        Cedula: {
                            required: true,
                            number: true,
                            minlength: 8,
                            maxlength: 10
                        },
                        Telefono: {
                            required: true,
                            number: true,
                            minlength: 8,
                            maxlength: 10
                        },
                        Direccion: {
                            required: true,
                            minlength: 8,
                            maxlength: 30
                        },
                        clave: {
                            required: true,
                            minlength: 8,
                            maxlength: 15
                        }
                    },
                    messages: {
                        Cedula: {
                            required: "Este campo es Requerido",
                            number: "El campo debe ser Numérico ",
                            minlength: "Son {0} digitos Mínimo  ",
                            maxlength: "Son {0} digitos Máximo"
                        },
                        Telefono: {
                            required: "Este campo es Requerido",
                            number: "El campo debe ser Numérico ",
                            minlength: "Son {0} digitos Mínimo  ",
                            maxlength: "Son {0} digitos Máximo"
                        },
                        email: {
                            email: "Dirección de correo invalida"
                        },
                        Direccion: {
                            required: "Este campo es Requerido",
                            minlength: "Son {0} digitos Mínimo  ",
                            maxlength: "Son {0} digitos Máximo"

                        },
                        clave: {
                            required: "Este campo es Requerido",
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
           FUsuarios fu= new FUsuarios();
            if (miSesion.getAttribute("usr") != null) {
                UsuariosDTO uregistrado = (UsuariosDTO) miSesion.getAttribute("usr");
                String menu = (String) miSesion.getAttribute("mp");

        %>


        <div class="logo">       
            <img src="../imagenes/banner-enviar.jpg" height="160" width="1200">
        </div>
        <div class="menu">
            <div class="tags">
                <a href="iniciarsesion.jsp"><strong>Iniciar Sesión</strong></a>
                <a href="#"><strong>Perfil Secretaria</strong></a>
            </div>
            <div class ="menu-session">     
                <button type="button"  class="btn btn-info" onClick="javascript:window.location = '../indexout.jsp'">Cerrar Sesión </button>
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
                <div  class="" style="  margin-left: 329px;    margin-top: 70px;">  
                   <form method="POST" action="../../GestionCorreos">
                <div class="row">                
                    <div class="col-md-4">                       
                                <legend class="text-center"  style="  width: 230px;">Enviar correo másivo</legend>
                        <div class="form-group">
                            <label for="cAsunto">Asunto:</label>
                           <input type="text" name="cAsunto" id="cAsunto" 
                                           class="form-control" placeholder="Asunto del correo" value="" required  style="  width: 390px;">
                        </div>
                        <div class="form-group">
                            <label for="cCuerpo">Mensaje:</label>
 <textarea type="text" name="cCuerpo" id="cCuerpo" class="form-control" required placeholder="Mensaje para las personas" style="  width: 390px;  margin-left: -16px;  height: 332px;"></textarea>                        </div>                        
                        <button type="submit" class="btn btn-success">Enviar Correo</button>
                    </div>
                    <div class="col-md-8">

                              <table class="table table-striped table-hover table-condensed">
                            <thead>
                                <tr>
                                    <th>Documento</th>
                                    <th>Nombre</th>
                                    <th>Apellidos</th>
                                    <th>tipodocumento</th>
                                    <th>fecha</th>
                                    <th>lugar de nacimiento</th>
                                    <th>correo</th>
                                    <th>direccion</th>
                                    <th>ciudad</th>
                                    <th>genero </th>
                                    <th>usuario</th>
                                    <th>clave</th>
                                    <th>estado</th>
                                    <th>activos</th>
                                    
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    FUsuarios pdao = new FUsuarios();

                                    ArrayList<UsuariosDTO> misUsuarios;
                                    misUsuarios = (ArrayList<UsuariosDTO>) pdao.obtenerPersonasParaCorreos();
                                    int i = 0;
                                    for (UsuariosDTO p : misUsuarios) {

                                %>
                                <tr>
                                    <td><%= p.getDocumento()%></td>
                                    <td><%= p.getNombres()  %></td>
                                    <td><%= p.getApellidos()%></td>
                                    <td><%= p.getTipoDoc()  %></td>
                                     <td><%= p.getFechadenacimiento()  %></td>
                                    <td><%= p.getLugardeNacimiento()  %></td>
                                    <td><%= p.getEmail()  %></td>
                                     <td><%= p.getDireccion() %></td>
                                    <td><%= p.getCiudad()    %></td>
                                    <td><%= p.getGenero()  %></td>
                                     <td><%= p.getUsuario()   %></td>
                                    <td><%= p.getClave()  %></td>
                                    <td><%= p.getEstado()  %></td>
                                    <td><%= p.getActivarestado()  %></td>
                                     <td><a href="#">Suspender</a></td>
                                    <td class="text-center">
                                        <div class="checkbox <% if (p.getEstado() == 0 || p.getActivarestado()== 0) { out.print("disabled");} %>">
                                            <label>
                                                <input type="checkbox"  <% if (p.getEstado() == 0 || p.getActivarestado()== 0) { out.print("disabled "); out.print("value='" + 0 +"'"); } else { %> value='<%= p.getDocumento()  %>' <%}%>name="idPersona[<%= i%>]">
                                            </label>
                                        </div>
                                    </td>
                                </tr>                        
                                <%
                                        i++;
                                    }
                                %>
                            </tbody>
                        </table>            
                    </div>
                </div>
                <input type="hidden" name="contador" value="<%= i%>">                
            </form>
                  <div class="style"><%if (request.getParameter("msg") != null) {
                                                        out.print(request.getParameter("msg"));
                                                    }%>  </div>
            </div>
        
           </div>	

        <%     } else {
                response.sendRedirect("../index.jsp");
            }

        %>

    </body>
</html>
