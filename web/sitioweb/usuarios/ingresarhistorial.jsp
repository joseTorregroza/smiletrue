
<%@page import="Dtos.Historial"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Facade.FHistorial"%>
<html>
    <head>
        <%@page import="Dtos.UsuariosDTO"%>
        <%@page import="Daos.UsuarioDAO"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <title>Smile System</title>
        <meta charset="utf-8" />
        <link rel="shortcut icon" href="../imagenes/favicon.ico" />
        <link href="../css/footer.css" rel="stylesheet" type="text/css">
        <link href="../css/css.css" rel="stylesheet" type="text/css">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css">        
        <link href="../css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
        <script src="../js/jquery.js"></script>
        <script  src="../js/paginacion.js"></script>
        <script src="../js/jquery.validate.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Slab' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Bree+Serif' rel='stylesheet' type='text/css'>
        <script type="text/javascript">

            $(document).ready(function () {

                //codigo para validar que los campos solo sean letras
                jQuery.validator.addMethod("lettersonly", function (value, element) {
                    return this.optional(element) || /^[a-zA-ZÃ¡Ã©Ã­Ã³ÃºÃ Ã¨Ã¬Ã²Ã¹ÃÃÃÃÃÃÃÃÃÃÃ±ÃÃ¼Ã_\s]+$/i.test(value);
                }, "Digite solo caracteres");

                // sirver para validar los campos del formulario
                $('#form1').validate({
                    rules: {
                        password: {
                            required: true,
                            number: true,
                            minlength: 8,
                            maxlength: 10
                        }
                    },
                    messages: {
                        password: {
                            required: "Este campo es Requerido",
                            number: "El campo debe ser Numérico ",
                            minlength: "Son {0} digitos Mínimo  ",
                            maxlength: "Son {0} digitos Máximo"
                        }
                    }
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
           
            if (miSesion.getAttribute("usr") != null) {
                UsuariosDTO uregistrado = (UsuariosDTO) miSesion.getAttribute("usr");
                String menu = (String) miSesion.getAttribute("mp");
                ArrayList<Historial> lista = new ArrayList();
                

        %>

        <div class="logo">       
            <img src="../imagenes/banner-enviar.jpg" height="160" width="1200">
        </div>
        <div class="menu">
            <div class="tags">
                <a href="iniciarsesion.jsp"><strong>Iniciar Sesión</strong></a>
                <a href="#"><strong>Ingresar Historial</strong></a>
            </div>
            <div class ="menu-session">          
                <button type="button" onClick="javascript:window.location = '../indexout.jsp'">Cerrar Sesión </button>
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

            <% if (uregistrado.getRol().equals("Medico") || uregistrado.getRol().equals("Secretaria")) {%>

            <div class="mesa">
                <div class="lado1-agenda">
           
                        <form action="../../GestionHistorial" id="form1" class="form-format1" method="POST"> 
                            <h1 class="h1-session" style="padding-bottom: 10px;padding-left: 54px;">Consultar Pacientes</h1>    

                            <div >
                                <label for ="documento"  class=" control-label" style="margin-left: 244px;"> Documento</label>
                                <div class="corr">

                                    <input type="text" name="documento" id="documento" style=" margin-top: -30;" value="0">
                                </div>
                                <label for ="nombre"  class="control-label" style="margin-left: 244px; margin-top: 30px;"> Nombre</label>
                                <div class="corr">

                                    <input type="text" name="nombre" id="nombre" style=" margin-top: -30;"  >
                                </div>
                                <label for ="apellido"  class="control-label" style="margin-left: 244px; margin-top: 30px;"> Apellidos</label>
                                <div class="corr">

                                    <input type="text" name="apellido" id="apellido" style=" margin-top: -30;" >
                                </div>
                            </div>
                            <p style="padding-left: 66px;padding-top: 16px;"> Puede agilizar su busqueda usando <br>
                                algunas de las opciones de filtrado</p>
                            <input type="submit" value="Consultar" name="consultar" class="btn btn-primary btn-lg" style="margin-left: 70px;">
                        </form>
                    </div>
                
                <%
 HttpSession sesion = request.getSession(false);
                    if (sesion.getAttribute("pacientes")!=null) {

                        ArrayList<UsuariosDTO> productos = (ArrayList<UsuariosDTO>) sesion.getAttribute("pacientes");
                        if (productos.size() == 0) {
                %>
                <div class="row text-right">
                    <div class="col-md-6 alert alert-info"><h2 class="text-center">Sin resultados</h2></div>

                </div>         
                <%
                } else {
                %>
                
                <div class="row text-right">
                    <div class="col-md-6"><h2 class="text-center">Resultados</h2></div>                         
                </div>
                <br>


                <table id ="tablah" class="table table-bordered table-striped table-hover"> 
                    <thead>
                    <th style=" width:150px; height: 20px">Documento</th>
                    <th style=" width:150px; height: 20px">Nombre</th>
                    <th style=" width:150px; height: 20px">Telefono</th>
                    <th style=" width:150px; height: 20px">Ciudad</th>

                    </thead>
                    <%            for (UsuariosDTO producto : productos) {


                    %>
                    <tr>
                        <td><%=producto.getDocumento()%></td>
                        <td><%=producto.getNombres() +"   "+ producto.getApellidos()%></td>
                        <td><%=producto.getTelefono()%></td>
                        <td><%=producto.getCiudad()%></td>
                        <td id="button"><a href="../../GestionHistorial?Historial=<%=producto.getDocumento()%>"> <img class="vector" src="../imagenes/Historial.png" width="30" height="30" alt="Historial" title=" Consultar Historial"/> </a> </td>
                        <td id="button"><a href="../../GestionUsuario?perfil=<%=producto.getDocumento()%>"> <img class="vector" src="../imagenes/perfil.png" width="30" height="30" alt="perfil" title=" Consultar Perfil"/> </a>  </td>  
                    </tr>
                    <%            }
                    %>
                </table>
                <div id="pageNavPosition" ></div>
                    <script type="text/javascript">
                        var pager = new Pager('tablah', 4);
                        pager.init();
                        pager.showPageNav('pager', 'pageNavPosition');
                        pager.showPage(1);
                    </script>
                    <div class="confirmarOK" style="color: red;">
                       

                    </div>
                <%
                        }
                    }
                %>
            </div>    

            <% } else {
                FHistorial fh = new FHistorial();

                lista = (ArrayList<Historial>) fh.lisHis(uregistrado.getDocumento());

            %>

            <div >
                <div >
                    <h1>Historial Odontolígico </h1>
                    <% if (lista.size() == 0) {
                    %>
                    <div class="row text-right">
                        <div class="col-md-6 alert alert-info"><h2 class="text-center">Sin resultados</h2></div>

                    </div>         
                    <%
                    } else {
                    %>
                    <div class="lado1" style="text-align: center;">

                    </div>
                    <div class="lado2">

                    </div>

                </div>
                <div class="mesa"  style="height: 414px">	


                    <div class="Divprint" style= "width: 90% " 
                         >
                        <table id ="tablah" style =" padding-bottom:5px ;text-align: center;" class="table table-bordered table-striped table-hover" >
                            <thead>
                                <tr id="titulo" >


                                    <td style=" width:150px; height: 20px" > Profesional</td>
                                    <td style=" width: 150px; height: 20px" > Fecha</td>
                                    <td style=" width: 150px; height: 20px" >Hora</td>
                                    <td style=" width: 150px; height: 20px">Procedimiento</td>
                                    <td style=" width: 150px; height: 20px" > Observaciones</td>
                                </tr>
                            </thead>
                            <tbody>
                                <%            for (Historial producto : lista) {
                                %>
                                <tr>
                                    <td><%=producto.getOdontonlogo()%></td>
                                    <td><%=producto.getFecha()%></td>
                                    <td><%=producto.getHora()%></td>
                                    <td><%=producto.getProcedimiento()%></td>
                                    <td><%=producto.getObservacion()%></td>




                                </tr>
                                <%            }

                                %>


                        </table>

                        <div id="pageNavPosition" style="margin-left: 320px" >


                    </div>
                    <script type="text/javascript">
                        var pager = new Pager('tablah', 4);
                        pager.init();
                        pager.showPageNav('pager', 'pageNavPosition');
                        pager.showPage(1);
                    </script>
                    <div class="confirmarOK" style="color: red;">
                        <%                //    if (request.getParameter("msg") != null) {
                            // out.print(request.getParameter("msg"));
                            // }
                            // %>

                    </div>

                    <a href="pdf/historial.pdf" target="_blank"><button  class="printer" type="button" style="margin-left: 74px;">Descargar</button></a>
                </div>
            </div> 

            <% }%>
        </div>  
        
        <%     }}else{
                response.sendRedirect("../index.jsp");
            }

        %>
        </div>
    </body>
</html>
