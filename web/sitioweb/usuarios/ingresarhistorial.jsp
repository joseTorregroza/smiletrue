
<%@page import="Dtos.Historial"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Facade.FHistorial"%>
<html>
    <head>
        <%@page import="Dtos.UsuariosDTO"%>
        <%@page import="Daos.UsuarioDAO"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <title>Smile System</title>
        <%@page errorPage="../error404.jsp" %> 
        <meta charset="utf-8" />
        <link rel="shortcut icon" href="../imagenes/favicon.ico" />
        <link href="../css/footer.css" rel="stylesheet" type="text/css">
        <link href="../css/css.css" rel="stylesheet" type="text/css">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css">        
        <link href="../css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
        <script src="../js/jquery.js"></script>
        <script  src="../js/paginacion.js"></script>
        <script src="../js/jquery.validate.js"></script>
         <script type="text/javascript" src="../js/Validacion.js"></script>
        <script type="text/javascript" src="../js/ajax.js"></script>
        <script type="text/javascript" src="../js/validacionesAjax.js"></script>
         <script src="../js/bootstrap.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Slab' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Bree+Serif' rel='stylesheet' type='text/css'>
     
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
    </head>
    <body style="margin-left:123px">
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
                <button type="button" onClick="javascript:window.location = '../indexout.jsp'"  class="btn btn-info" >Cerrar Sesión </button>
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
              
                   
                        <form action="../../GestionHistorial" class="form-inline"  method="POST"> 
                           
                            <h1 class="h1-session" style="padding-bottom: 20px;padding-left: 54px; padding-top: 20px; ">Consultar Pacientes</h1>    
                             
                            <div class="form-group has-feedback" id="inpDocumento">
                                    <label class="control-label" for="documento">Documento:</label>
                                    <input type="text" class="form-control" tabindex="1" name="documento"
                                           id="documento" value="0" maxlength="12" style=" margin-left: 7px;
">

                                </div>
                            <div class="form-group has-feedback" id="inpNombres">
                                                <label class="control-label" for="nombre">Nombres:</label>
                                                <input type="text" class="form-control" name="nombre" maxlength="25"  
                                                       id="nombre" tabindex="2" value="" style=" margin-left: 7px;
" >
                                              
                                            </div>

                                            <div class="form-group has-feedback" id="inpApellidos">
                                                <label class="control-label" for="ruApellidos">Apellidos:</label>
                                                <input type="text" class="form-control" name="apellido" maxlength="25"
                                                       id="ruApellidos" tabindex="3" value=""  style="margin-left: 7px;
">
                                                
                                            </div>
                            
                            <p style="padding-left:25%;padding-top: 16px;"> Puede agilizar su busqueda usando algunas de las opciones de filtrado</p>
                            
                            <input type="submit" value="Consultar" name="consultar" class="btn btn-primary " style="  margin-left: 38%;">
                        </form>
                      
                  
           
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


                <table id ="tablah" class="table table-bordered table-striped table-hover" style="margin-left: 42px; width: 892.222222328186px;"> 
                    <thead>
                    <th style=" width:150px; height: 20px">Documento</th>
                    <th style=" width:150px; height: 20px">Nombre</th>
                    <th style=" width:150px; height: 20px">Telefono</th>
                    <th style=" width:150px; height: 20px">Ciudad</th>
                     <th style=" width:150px; height: 20px">Acciones</th>

                    </thead>
                    <%            for (UsuariosDTO producto : productos) {


                    %>
                    <tr>
                        <td><%=producto.getDocumento()%></td>
                        <td><%=producto.getNombres() +"   "+ producto.getApellidos()%></td>
                        <td><%=producto.getTelefono()%></td>
                        <td><%=producto.getCiudad()%></td>
                        <td> <a href="../../GestionHistorial?Historial=<%=producto.getDocumento()%>" class="btn btn-success" role="button" title="Consultar Historial" >Historial</a> 
                        <a href="../../GestionUsuario?perfil=<%=producto.getDocumento()%>" class="btn btn-primary" role="button" title="Consultar Perfil" >Perfil</a> </td>
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
                        <table id ="tablah" style =" padding-bottom:5px; text-align: center;" class="table table-bordered table-striped table-hover" >
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
        </div>
        
    </body>
</html>
