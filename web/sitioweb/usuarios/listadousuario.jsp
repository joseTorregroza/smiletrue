<%-- 
    Document   : listadousuario
    Created on : 23-mar-2015, 8:22:06
    Author     : USUARIO
--%>

<%@page import="Facade.FUsuarios"%>
<%@page import="java.util.LinkedList"%>
<html>
    <head>
      
        <%@page import="Daos.UsuarioDAO"%>
        <%@page import="Dtos.UsuariosDTO"%>
        <%@page import="java.util.ArrayList"%>
       
<%@page import="java.util.Date"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page errorPage="../error404.jsp" %> 
        <title>Smile System</title>
        <meta charset="utf-8" />
        <link rel="shortcut icon" href="../imagenes/favicon.ico" />	
        <link rel="stylesheet" href="../js/jquery-ui-1.11.1/jquery-ui.css">
        <link href="../css/footer.css" rel="stylesheet" type="text/css">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css">        
        <link href="../css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
        <link href="../css/css.css" rel="stylesheet" type="text/css">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css">        
        <link href="../css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Pathway+Gothic+One' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Bree+Serif' rel='stylesheet' type='text/css'>
        <script src="../js/jquery.js"></script>
        <script src="../js/jquery.PrintArea.js"></script>
        <script src="../js/jquery-ui-1.11.1/jquery-ui.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {

                /*$(".printer").click(function(){
                 $('.Divprint').printArea();
                 });*/

                $("#dialog").dialog({
                    autoOpen: false,
                    width: 400,
                    height: 300,
                    close: function () {
                        $('input').prop('checked', false);
                    }
                });
            });

            function mostrar(indentidad) {

                if ($(".check-" + indentidad).is(':checked')) {

                    valor = $(".check-" + indentidad).val();
                    $("#dialog").html(valor);
                    $("#dialog").dialog("open");
                }
            }

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
            FUsuarios  usdao = new  FUsuarios ();
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
                
                <a href="#"><strong> Listado Usuarios</strong></a>
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
            <div class="mesahisto  mesa-overflow">
                <h1>Listado de los usuarios registrados</h1>
                
      <%--           <%  LinkedList<UsuariosDTO> lista = new LinkedList<UsuariosDTO>();
         lista = (LinkedList<UsuariosDTO>) usdao.ListarTodosLosUsuarios(); %>   --%>
   
   <div class="col-md-8">
   <table border="1" class="table table-striped table-hover table-condensed">
            <thead>
                <tr>
                    <th>Cedula</th>
                     <th>Tipo</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Direccion</th>
                    <th>F.Nacimiento</th>
                    <th>Usuario</th>
                    <th>Clave</th>
                    <th>Sexo</th>
                    <th>Correo</th>
                    <th>L.Nacimiento</th>
                    <th>Ciudad</th>
                     <th>Estado</th>
                    <th>Telefono</th>
                    <th>Rh</th>
                    <th>Alergia</th>
                    <th>N. tarjeta</th>
                    <th>Rol</th>
                    <th>Descripcion</th>
                    
                   
                   
                        <%--
                            if ( uregistrado.getDocumento() == 3) {
                        --%>   

                    <th>Eliminar</th>
                        <%-- }--%> 
                     <th>Modificar</th>
                </tr>
            </thead>
            <tbody>
                <%                    for (UsuariosDTO p : lista) {

                %>
                <tr>
                    <td><%=p.getDocumento()  %></td>
                    <td><%=p.getTipoDoc()  %></td>
                    <td><%=p.getNombres()  %></td>
                    <td><%=p.getApellidos() %></td>
                    <td><%=p.getDireccion()  %></td>
                    <td><%=p.getFechadenacimiento()  %></td>
                    <td><%=p.getUsuario() %></td>
                    <td><%=p.getClave() %></td>
                    <td><%=p.getGenero()  %></td>
                    <td><%=p.getEmail()  %></td>
                    <td><%=p.getLugardeNacimiento()  %></td>
                    <td><%=p.getCiudad()  %></td>
                    <td><%=p.getActivarestado() %></td>
                    <td><%=p.getTelefono()  %></td>
                    <td><%=p.getGrupoSangui()  %></td>
                    <td><%=p.getTipoAlergia()  %></td>
                    <td><%=p.getTarjetaprofesional() %></td>
                    <td><%=p.getRoles() %></td>
                    <td><%=p.getRol() %></td>
                    
                    
                    <%--
                        if (uregistrado.getDocumento() == 3) {
                    --%>   
                        <td><a href="../Controlador?id=<%=p.getDocumento()  %>" onclick="return confirmar();"><img src="../img/eliminar.png" width="48" height="48" alt="Eliminar Registro"/>
                            </a>
                        </td>
                    <%-- }--%> 
                   <td><a href="modificar.jsp?id=<%=p.getDocumento()%>"><img src="../img/Modificar.png" width="48" height="48" alt="Eliminar Registro"/>
                        </a></td>     
                        
                </tr>
                <%
                    }%>

            </tbody>
        </table>
                    </div>
            </div>
        </div>
       
        <%     } else {
                response.sendRedirect("../index.jsp");
            }

        %>

    </body>
</html>