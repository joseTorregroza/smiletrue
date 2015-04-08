
<html>
    <head>
        <%@page import="Dtos.UsuariosDTO"%>
        <%@page import="Daos.UsuarioDAO"%>
        <%@page import="Dtos.UsuariosDTO"%>
        <%@page import="java.util.ArrayList"%>
        <%@page import="Dtos.Historial"%>
        <%@page import="Daos.HistorialDAO"%>

        <%@page import="java.util.Date"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <title>Smile System</title>
        <meta charset="utf-8" />
        <link rel="shortcut icon" href="../imagenes/favicon.ico" />	
        <link rel="stylesheet" href="../js/jquery-ui-1.11.1/jquery-ui.css">
        <link href="../css/footer.css" rel="stylesheet" type="text/css">
        <link href="../css/css.css" rel="stylesheet" type="text/css">
        <link href="../css/bootstrap.css" rel="stylesheet" type="text/css">        
        <link href="../css/bootstrap-responsive.css" rel="stylesheet" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Pathway+Gothic+One' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Bree+Serif' rel='stylesheet' type='text/css'>
        <script type="text/javascript" src="paging.js"></script>
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
            //  UsuariosDTO us= new UsuariosDTO();
            HttpSession miSesion = request.getSession(false);
            HttpSession sesion = request.getSession(false);
            if (miSesion.getAttribute("usr") != null) {

                UsuariosDTO uregistrado = (UsuariosDTO) miSesion.getAttribute("usr");
                String menu = (String) miSesion.getAttribute("mp");
                ArrayList<Historial> lista = new ArrayList();
                lista = (ArrayList<Historial>) sesion.getAttribute("historial");


        %>



        <div class="logo">       
            <img src="../imagenes/banner-enviar.jpg" height="160" width="1200">
        </div>
        <div class="menu">
            <div class="tags">
                <a href="iniciarsesion.jsp"><strong>Iniciar Sesión</strong></a>
                <a href="ingresarhistorial.jsp"><strong>Ingresar Historial</strong></a>
                <a href="#"><strong> Historial Paciente</strong></a>
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
                <% out.println(menu); %> 
            </div>
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
                        <table id ="tablah" style =" padding-bottom:5px ;text-align: center;" >
                            <thead>
                                <tr id="titulo" >


                                    <th style=" width:150px; height: 20px" > Profesional</th>
                                    <th style=" width: 150px; height: 20px" > Fecha</th>
                                    <th style=" width: 150px; height: 20px" >Hora</th>
                                    <th style=" width: 150px; height: 20px">Procedimiento</th>
                                    <th style=" width: 150px; height: 20px" > Observaciones</th>
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
 <div id="pageNavPosition" ></div>
                        <script type="text/javascript"><!--
                     var pager = new Pager('tablah', 4);
                            pager.init();
                            pager.showPageNav('pager', 'pageNavPosition');
                            pager.showPage(1);
                            //--></script>

                        <a href="pdf/historial.pdf" target="_blank"><button  class="printer" type="button" style="margin-left: 74px;">Descargar</button></a>
                    </div>
                </div> 
            </div>
            <div id="dialog" title="Odontolgia" style="display:none">
            </div> 

            <% }
            %>
            <%  } else {
                    response.sendRedirect("../index.jsp");
                }

            %>

        </div>    </body>
</html>