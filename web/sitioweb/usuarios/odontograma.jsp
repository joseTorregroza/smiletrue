
<%@page import="Dtos.ProcedimientosCatalogosDTO"%>
<%@page import="Dtos.CartaDentalDTO"%>
<%@page import="Facade.FCitas"%>
<%@page import="Dtos.AgendaMedicoDTO"%>
<%@page import="java.util.ArrayList"%>
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
        <script src="../js/jquery.js"></script>
        <script src="../js/jquery.validate.js"></script>
        <script src="../css/bootstrap.css"></script>
        <script  src="../js/paginacion.js"></script>
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
            });</script>
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
                CartaDentalDTO cartas = new CartaDentalDTO();
                ArrayList<CartaDentalDTO> lista = new ArrayList();
                lista = (ArrayList<CartaDentalDTO>) sesion.getAttribute("dientes");
                ArrayList<CartaDentalDTO> dientes = new ArrayList();
                dientes = (ArrayList<CartaDentalDTO>) sesion.getAttribute("histodent");
                 ArrayList<ProcedimientosCatalogosDTO> proca = new ArrayList();
                 proca= (ArrayList<ProcedimientosCatalogosDTO>)sesion.getAttribute("catalo");

        %>

        <div class="logo">        
            <img src="../imagenes/banner-enviar.jpg" height="160" width="1200">
        </div>
        <div class="menu">
            <div class="tags">
                <a href="iniciarsesion.jsp"><strong  font-size: 16px;  font-weight: bold>Iniciar Sesión</strong></a>
                <a href="#"><strong></strong></a>
            </div>
            <div class ="menu-session">     
                <button type="button" onClick="javascript:window.location = '../indexout.jsp'" class="btn btn-info" >Cerrar Sesión </button>
            </div>
            <div class ="menu-session">
                <span style="color:white; font-size: 16px;  font-weight: bold">  <%  out.print(uregistrado.getRol());%>:  </span>
                <span style="color:white; font-size: 16px;  font-weight: bold"> <%  out.print(uregistrado.getNombres());%> <%  out.print(uregistrado.getApellidos());%></span>                  
            </div>
        </div>
        <div class="contenido" style="  height: 708px;">

            <div class="menu2" style="height: 672px;"> 
                <div class="menucoreer"> <img class="vector" src="../imagenes/manu.png " width="70"	height="70"></div>
                    <% out.println(menu); %> 
            </div>

            <div class="mesa"  style="height: 414px">	
                <div class="dent"  style="border-color: green ;  border-style: solid;">
                    <h1 class="h1-session" style="padding-top: 15px;">Odontograma</h1>
                    <div class="pri"  style="border-color: #0033FF;  border-style: solid;">
                        <div class="carta1"  style="border-color: #4acaa8 ;  border-style: solid;"> 
                            <%for (int i = 0; i < 8; i++) {%>
                            <button type="submit" class="btn btn-default btn-mini" style="  margin-right: 3px;" onclick=location.href="../../GestionCitas?iddiente=<%=lista.get(i).getIdCartaDental()%>"><%=lista.get(i).getIdCartaDental()%></button>

                            <%} %> 
                        </div>


                    </div>
                    <div class="sec"  style="border-color: #4acaa8 ;  border-style: solid;">
                        <div class="carta2"  style="border-color: #4acaa8 ;  border-style: solid;">
                            <%for (int i = 8; i < 16; i++) {%>
                            <button type="submit" class="btn btn-default btn-mini" style="  margin-right: 3px;" onclick=location.href="../../GestionCitas?iddiente=<%=lista.get(i).getIdCartaDental()%>"><%=lista.get(i).getIdCartaDental()%></button>

                            <%} %>
                        </div>
                    </div>
                    <div class="tre"   style="border-color: #8702A8 ;  border-style: solid;">
                        <div class="carta1"  style="border-color: #4acaa8 ;  border-style: solid;">
                            <%for (int i = 16; i < 24; i++) {%>
                            <button type="submit" class="btn btn-default btn-mini" style="  margin-right: 3px;" onclick=location.href="../../GestionCitas?iddiente=<%=lista.get(i).getIdCartaDental()%>"><%=lista.get(i).getIdCartaDental()%></button>

                            <%} %>
                        </div>
                    </div>
                    <div class="four"  style="border-color: #C00;  border-style: solid;">
                        <div class="carta2"  style="border-color: #4acaa8 ;  border-style: solid;">
                            <%for (int i = 24; i < 32; i++) {%>
                            <button type="submit" class="btn btn-default btn-mini" style="  margin-right: 3px;" onclick=location.href="../../GestionCitas?iddiente=<%=lista.get(i).getIdCartaDental()%>"><%=lista.get(i).getIdCartaDental()%></button>
                            <%} %>
                        </div>
                    </div>
                </div>	


                <% if (sesion.getAttribute("histodent") != null) {%>
                <div class="his" style="border-color: blue;   border-style: solid;">
                    <div class="es" style="border-color: blue;   border-style: solid;"></div>
                    

                    <table id ="tablah"  style="padding: 5px;" class="table table-bordered table-striped table-hover" >
                        <thead>
                            <tr id="titulo" >


                                <th  >Fecha</th>
                                <th >Observacion</th>
                                <th  >Procedimiento</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%for (CartaDentalDTO his : dientes) {%>
                            <tr>
                                <td><%=his.getFechaProccita()%></td>
                                <td><%=his.getObservacion()%></td>
                                <td><%=his.getProcedimientos()%></td>
                                

                            </tr>

                            <% } %>
                    </table>
                    <div id="pageNavPosition" ></div>
                    <script type="text/javascript">
                                var pager = new Pager('tablah', 4);
                                pager.init();
                                pager.showPageNav('pager', 'pageNavPosition');
                                pager.showPage(1);
                    </script>

                    <% } %>
                </div>
                    <% if (sesion.getAttribute("histodent") != null ) {%>
                <div class="act" style="border-color: yellow ;  border-style: solid;">
                    <h1 class="h1-session" style="padding-top: 20px;">Agregar Informacion</h1>
                    <form class="inline"  action="../../GestionCitas" style="margin-top: 0px;">
                        <table>
                            <tr>
                                <td><label for="estado" class=" InputRequired col-lg-1  control-label">Estado:</label></td> 
                                <td><div class="form-group">    
                                        <div >
                                            <select  class="form-control input-sm" name="estado" id="estado" required class="form-control input-sm"  style="width: 75px; padding-right: 0px; padding-left: 0px;">
                                                <option value="0">Presente</option> 
                                                <option value="2"> Ausente</option>                                                
                                            </select>
                                        </div>
                                    </div></td> 
                            </tr>
                            <tr>
                                <td><label for="procedimientos" class=" InputRequired col-lg-1  control-label">Procedimientos:</label></td> 
                                <td><div class="form-group">  
                                        <div col-lg-9>
                                            <select  class="form-control input-sm InputRequired"  name="procedimientos" id="procedimientos" required >
                                                <option value="">Seleccione Especialidad</option>
                                                <%for (ProcedimientosCatalogosDTO proce:proca) {%>
                                                <option value="<%=proce.getIdCatalogo()  %>"><%=proce.getProcedimiento() %></option>
                                                        
                                                   <% }  %>
                                              

                                            </select>
                                        </div>
                                    </div>
                                </td> 
                            </tr>
                            <tr>
                                <td><label for="observacion" class=" InputRequired col-lg-1  control-label">Observaciones:</label></td> 
                                <td><div class="form-group">  
                                        <div col-lg-9
                                             >
                                            <textarea style="margin-left: -20;" rows="3"   name="observacion" id="observacion" required >
                                                 
                                                  
                                            </textarea>
                                        </div>
                                    </div>
                                </td> 
                            </tr>

                        </table> 
                        <input type="submit" name="infodiente" class="btn btn-primary input-small col-lg-3 " value="Guardar" style="margin-left: 278px;">
                    </form> 
                    </div>
                    <% }%>
                

            </div>
     
            <%
                } else {
                    response.sendRedirect("../index.jsp");
                }

            %>

    </body>
</html>