
<%@page import="Facade.FCitas"%>
<%@page import="Dtos.AgendaMedicoDTO"%>
<%@page import="java.util.ArrayList"%>
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
        <script src="../js/jquery.js"></script>
        <script src="../js/jquery.validate.js"></script>
        <script  src="../js/paginacion.js"></script>
        <script src="../css/bootstrap.css"></script>
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
                FCitas fc = new FCitas();
                UsuariosDTO uregistrado = (UsuariosDTO) miSesion.getAttribute("usr");
                String menu = (String) miSesion.getAttribute("mp");
                ArrayList<AgendaMedicoDTO> lista = new ArrayList();
                lista = (ArrayList<AgendaMedicoDTO>) fc.lisAgen(uregistrado.getDocumento());


        %>

        <div class="logo">        
            <img src="../imagenes/banner-enviar.jpg" height="160" width="1200">
        </div>
        <div class="menu">
            <div class="tags">
                <a href="iniciarsesion.jsp"><strong style="font-size: 16px;  font-weight: bold">Iniciar Sesión</strong></a>
                <a href="#"><strong>Agenda Medìco</strong></a>
            </div>
            <div class ="menu-session">     
                <button type="button" onClick="javascript:window.location = '../indexout.jsp'" class="btn btn-info" >Cerrar Sesión </button>
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
           <% if (request.getParameter("time") != null) {%>
                         <div class="alert alert-danger text-center">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <p><strong> Recuerda:</Strong>No es posible activar una cita antes de la fecha de la misma<i class='glyphicon glyphicon-ok'></i>%></p>
                        </div>


                        <% }
                        %>
                            <%                        if (request.getParameter("info") != null) {
                        %>
                        <div class="alert alert-info text-center">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <p><strong> Cita cancelada</Strong> La cita  se ha cancelado sin contratiempo <i class='glyphicon glyphicon-ok'></i>%></p>
                        </div>
                        <%
                        } else if (request.getParameter("alert") != null) {%>
                        <div class="alert alert-danger " role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <p><strong> No cancelada</Strong> No se ha podido cancelar recuerde que solo es posible cancelar  con minimo 24 horas de anticipacion <i class='glyphicon glyphicon-ok'></i></p>
                        </div>


                        <% }
                        %>

            <div class="mesa"  style="height: 414px">	
                <div >
                    <h1>Agenda Medica </h1>
                    <% if (lista.size() == 0) {
                    %>
                    <div class="row text-right">
                        <div class="col-md-4 alert alert-success" style="margin-left: 539px;margin-right: 277px;margin-top: 113px;"><h2 class="text-center">No Existen Citas</h2></div>

                    </div>         
                    <%
                    } else {
                    %>


                </div>

                <div class="Divprint" style= "width:98%; " 
                     >
                    <table id ="tablah"  class="table table-bordered table-striped table-hover" style="  width: 950px;
  margin-left: 21px;" >
                        <thead>
                            <tr id="titulo" >


                                <td style=" width:150px; height: 20px" > Identificacion</td>
                                <td style=" width: 150px; height: 20px" > Nombres</td>

                                <td style=" width: 150px; height: 20px">Fecha</td>
                                <td style=" width: 150px; height: 20px" >Horario</td>
                                <td style=" width: 150px; height: 20px" >Acciones</td>
                            </tr>
                        </thead>
                        <tbody>
                            <%            for (AgendaMedicoDTO producto : lista) {
                            %>
                            <tr>
                                <td><%=producto.getIdPaciente()%></td>
                                <td><%=producto.getNombre() + producto.getApellido()%></td>

                                <td><%=producto.getFecha()%></td>
                                <td><%=producto.getHorario()%></td>
                                 <td style="margin-left: 740px; margin-top: -50;"><a class="btn btn-success" role="button"  title="Iniciar Cital" href="../../GestionCitas?paci=<%=producto.getIdPaciente()%>&&fecha=<%=producto.getFecha()%> ">Iniciar</a> 
                            <a class="btn btn-danger" role="button"  title="Cancelar Cital" href="../../GestionCitas?can=<%=producto.getIdPaciente()%>&&fechaci=<%=producto.getFecha()%> ">Cancelar </a>  
                             </td>
                            </tr>
                <%}%>
                    </table>
                    

                    <div id="pageNavPosition" style="margin-left: 320px" ></div>


                </div>
                <script type="text/javascript">
                    var pager = new Pager('tablah', 4);
                    pager.init();
                    pager.showPageNav('pager', 'pageNavPosition');
                    pager.showPage(1);
                </script>


            </div>                            
           
              
                    
                       
                
              

            



        </div>


        <%     }
            } else {
                response.sendRedirect("../index.jsp");
            }

        %>

    </body>
</html>
