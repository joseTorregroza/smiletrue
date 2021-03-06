<%@page import="Facade.FUsuarios"%>
<html>
    <head>
        <%@page import="Dtos.UsuariosDTO"%>
        
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@page errorPage="../../error404.jsp" %> 
        <title>Smile System</title>
        <meta charset="utf-8" />
        <link rel="shortcut icon" href="../imagenes/favicon.ico" />
        <link href="../css/footer.css" rel="stylesheet" type="text/css">
        <link href="../css/secre.css" rel="stylesheet" type="text/css">
           <link href="../css/error.css" rel="stylesheet" type="text/css">
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
                }, '<div class="alert alert-danger movera" role="alert">Digite solo caracteres</div>');

                // sirve para bloquear los campos input
                $('.bloqueado').attr('disabled', 'disabled');
                $('.nobloqueado').attr('disabled', 'disabled');

                //sirve para desbloquear los campos input y ocultar el boton actualizar
                $('#actualizar').click(function () {
                    $('.bloqueado').removeAttr('disabled');
                    $('#actualizar').hide();
                    $('#guardar').show();
                });

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
                            required:  '<div class="alert alert-danger movera" role="alert">Este campo es Requerido</div>',
                            number: '<div class="alert alert-danger movera" role="alert">El campo debe ser Numérico </div>',
                            minlength: "Son {0} digitos Mínimo  ",
                            maxlength: "Son {0} digitos Máximo"
                        },
                        Telefono: {
                            required:  '<div class="alert alert-danger movera" role="alert">Este campo es Requerido</div>',
                            number: '<div class="alert alert-danger movera" role="alert">El campo debe ser Numérico </div>',
                            minlength:  '<div class="alert alert-danger  movera" role="alert">Son {0} digitos Mínimo </div>',
                            maxlength:  '<div class="alert alert-info movera" role="alert">Son {0} digitos Máximo </div>'
                        },
                        email: {
                            email:  '<div class="alert alert-danger  movera" role="alert">Dirección de correo invalida</div>',
                        },
                        Direccion: {
                            required:  '<div class="alert alert-danger movera" role="alert">Este campo es Requerido</div>',
                            minlength:  '<div class="alert alert-danger  movera" role="alert">Son {0} digitos Mínimo </div>',
                            maxlength:  '<div class="alert alert-info movera" role="alert">Son {0} digitos Máximo </div>'

                        },
                        clave: {
                            required:  '<div class="alert alert-danger movera" role="alert">Este campo es Requerido</div>',
                            minlength: '<div class="alert alert-danger  movera" role="alert">Son {0} digitos Mínimo </div>',
                            maxlength:  '<div class="alert alert-info movera" role="alert">Son {0} digitos Máximo </div>'
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
                <a href="#"><strong>Perfil   <%  out.print(uregistrado.getRol());%></strong></a>
            </div>
            <div class ="menu-session">     
                <button   class="btn btn-info"  type="button" onClick="javascript:window.location = '../indexout.jsp'">Cerrar Sesión </button>
            </div>
            <div class ="menu-session">
                <span style="color: white;">  <%  out.print(uregistrado.getRol());%>: </span>
                <span style="color: white;"> <%  out.print(uregistrado.getNombres());%> <%  out.print(uregistrado.getApellidos());%>  </span>                  
            </div>
        </div>
        <div class="contenido">
            <div class="menu2"> 
                <div class="menucoreer"> <img class="vector" src="../imagenes/manu.png " width="70"	height="70"></div>
                    <% out.println(menu); %> 
            </div>
            <div class="mesa">
                <h1>Datos de Registro</h1>

                <form class="form-horizontal" name="form1" id="form1" action="">

                    <table>
                        <tr>
                            <td><label for="NombreCompleto" class="  col-lg-2 control-label">Nombres:</label></td>
                            <td>
                                <div class="form-group">

                                    <div class="col-lg-10">
                                        <input type="text" value="<%  out.print(uregistrado.getNombres());%>" name="NombreCompleto" required class=" nobloqueado lettersonly form-control" id="NombreCompleto" placeholder="">
                                    </div>
                                </div>
                            </td>
                            <td><label for="rol" class="col-lg-2 control-label">Rol Usuario:</label></td> 
                            <td><div class="form-group">

                                    <div class="col-lg-10">
                                        <select  for="rol" name="rol" id="rol" required class="nobloqueado  form-control">

                                            <option value="2" <% if ("2".equals(uregistrado.getRoles())) {
                                                    out.println("selected");
                                                } %>>Medico</option>
                                                    <option value="3" <% if ("3".equals(uregistrado.getRoles())) {
                                                    out.println("selected");
                                                } %>>Secretaria</option>
                                                      <option value="4" <% if ("4".equals(uregistrado.getRoles())) {
                                                    out.println("selected");
                                                } %>>Administrador</option>
                                                   
                                        </select>
                                    </div>
                                </div></td>

                        </tr>  
                        <tr>
                            <td><label for="ApellidoCompleto" class=" col-lg-2 control-label">Apellidos:</label></td> 
                            <td><div class="form-group">

                                    <div class="col-lg-10">
                                        <input type="text" class="form-control  nobloqueado lettersonly" required id="ApellidoCompleto" value="<%  out.print(uregistrado.getApellidos());%>" name="ApellidoCompleto" placeholder="">


                                    </div>
                                </div></td>
                            <td><label for="tarjetaProfe" class="col-lg-2 control-label">No. Tarjeta:</label></td> 
                            <td><input type="text" class="form-control  nobloqueado " required id="tarjetaProfe" value="<%  out.print(uregistrado.getTarjetaprofesional());%>" name="tarjetaProfe" placeholder="">
</td>
                        </tr>
                        <tr>
                            <td><label for="tipodoc" class="col-lg-2 control-label">T.Documento:</label></td> 
                            <td><div class="form-group">

                                    <div class="col-lg-10">
                                        <select  for="tipodoc" name="tipodoc" id="tipodoc" required value="" class="nobloqueado  form-control">
                                            <option selected> Seleccione Tipo</option>
                                            <option value="CC"<% if ("CC".equals(uregistrado.getTipoDoc())) {
                                                    out.println("selected");
                                                } %>>Documento</option>
                                                    <option value="TC" <% if ("TC".equals(uregistrado.getTipoDoc())) {
                                                    out.println("selected");
                                                } %>> Tarjeta de Identidad </option>
                                            
                                        </select>
                                    </div>
                                </div></td>
                            <td><label for="email" class="InputRequired col-lg-2 control-label">Correo:</label></td> 
                            <td><div class="form-group">

                                    <div class="col-lg-10">
                                        <input type="text" class="  bloqueado email form-control" id="ejemplo_email_3" name="email" required value="<%  out.print(uregistrado.getEmail());%>"  placeholder="">
                                    </div>
                                </div></td>
                        </tr>
                        <tr>
                            <td><label for="Cedula" class="col-lg-2 control-label">Documento:</label></td> 
                            <td><div class="form-group">

                                    <div class="col-lg-10">
                                        <input type="text" class="nobloqueado  form-control" required id="ejemplo_email_3" value="<%  out.print(uregistrado.getDocumento());%>" name="Cedula" placeholder=""  >
                                    </div>
                                </div></td>
                            <td><label for="Telefono" class="InputRequired col-lg-2 control-label">Teléfono</label></td> 
                            <td><div class="form-group">

                                    <div class="col-lg-10">
                                        <input type="text" class=" form-control bloqueado" required name="Telefono" value="<%  out.print(uregistrado.getTelefono());%>"  id="" placeholder="">
                                    </div>
                                </div></td>
                        </tr>
                        <tr>
                            <td><label for="FechaNacimiento" class="col-lg-2 control-label">F.Nacimiento:</label></td> 
                            <td><div class="form-group">

                                    <div class="col-lg-10">
                                        <input type="date" class="nobloqueado  form-control" required id="ejemplo_email_3" value="<%if(uregistrado !=null){out.print(uregistrado.getFechadenacimiento());}%>" name="">
                                    </div>
                                </div></td>
                            <td><label for="Direccion" class=" InputRequired col-lg-2 control-label" >Direccion</label></td> 
                            <td><div class="form-group">

                                    <div class="col-lg-10">
                                        <input type="text" class=" bloqueado" id="" name="Direccion" required value="<%  out.print(uregistrado.getDireccion());%>" placeholder="" >
                                    </div>
                                </div></td>
                        </tr>
                        <tr>
                            <td><label for="LugardeNacimiento" class="col-lg-2 control-label">L.Nacimiento:</label></td> 
                            <td><div class="form-group">

                                    <div class="col-lg-10">
                                        <select  for="LugardeNacimiento" name="LugardeNacimiento" id="tipodoc" required class="nobloqueado   form-control">
                                                <option value="Bogota"<% if ("Bogota".equals(uregistrado.getLugardeNacimiento())) {
                                                    out.println("selected");
                                                } %>>Bogotá</option>
                                                    <option value="Barranquilla" <% if ("Barranquilla".equals(uregistrado.getLugardeNacimiento())) {
                                                    out.println("selected");
                                                } %>>Barranquilla</option>
                                                    <option value="Cali"<% if ("Cali".equals(uregistrado.getLugardeNacimiento())) {
                                                    out.println("selected");
                                                } %>>Cali</option>
                                                    <option value="Cartagena"<% if ("Cartagena".equals(uregistrado.getLugardeNacimiento())) {
                                                    out.println("selected");
                                                } %>>Cartagena</option>
                                                    <option value="Ibague"<% if ("Ibague".equals(uregistrado.getLugardeNacimiento())) {
                                                    out.println("selected");
                                                } %>>Ibagué</option>
                                                    <option value="Medellin"<% if ("Medellin".equals(uregistrado.getLugardeNacimiento())) {
                                                    out.println("selected");
                                                } %>> Medellín </option>
                                                    <option value="Neiva"<% if ("Neiva".equals(uregistrado.getLugardeNacimiento())) {
                                                    out.println("selected");
                                                } %>>Neiva</option>  
                                                    <option value="Pereira"<% if ("Pereira".equals(uregistrado.getLugardeNacimiento())) {
                                                    out.println("selected");
                                                } %>> Pereira </option>
                                                    <option value="Pasto"<% if ("Pasto".equals(uregistrado.getLugardeNacimiento())) {
                                                    out.println("selected");
                                                } %>> Pasto </option>
                                                    <option value="Tesalia"<% if ("Tesalia".equals(uregistrado.getLugardeNacimiento())) {
                                                    out.println("selected");
                                                } %>>Tesalia</option>   	
                                        </select>
                                    </div>
                                </div></td>
                            <td><label for="Sexo" class="col-lg-2 control-label InputRequired">Genero:</label></td> 
                            <td><div class="form-group">

                                    <div class="col-lg-10">
                                        <select  for="Sexo" name="Sexo" id="Sexo" required class=" nobloqueado ">
                                            <option> Seleccione Tipo</option>
                                            <option value="F"<% if ("F".equals(uregistrado.getGenero())) {
                                                    out.println("selected");
                                                } %>>Mujer</option>
                                                    <option value="M"<% if ("M".equals(uregistrado.getGenero())) {
                                                    out.println("selected");
                                                } %>>Hombre</option>
                                                    <option value="O" <% if ("O".equals(uregistrado.getGenero())) {
                                                    out.println("selected");
                                                } %>> Otros </option>

                                        </select>
                                    </div>
                                </div></td>
                        </tr>

                        <tr>
                            <td><label for="Ciudad" class="InputRequired col-lg-2 control-label">Ciudad:</label></td> 
                            <td><div class="form-group">

                                    <div class="col-lg-10">
                                        <option></option>
                                        <select  for="Ciudad" name="Ciudad" id="Ciudad" required class="nobloqueado   form-control">

                                            <option> Seleccione </option>
                                                    <option value="Bogota"<% if ("Bogota".equals(uregistrado.getCiudad())) {
                                                    out.println("selected");
                                                } %>>Bogotá</option>
                                                    <option value="Cali"<% if ("Cali".equals(uregistrado.getCiudad())) {
                                                    out.println("selected");
                                                } %>>Cali</option>
                                                    <option value="Medellin"<% if ("Medellin".equals(uregistrado.getCiudad())) {
                                                    out.println("selected");
                                                } %>> Medellín </option>
                                                    <option value="Neiva"<% if ("Neiva".equals(uregistrado.getCiudad())) {
                                                    out.println("selected");
                                                } %>>Neiva</option>										
                                        </select>
                                    </div>
                                </div></td>
                            <td><label for="clave" class="InputRequired col-lg-2 control-label">Clave:</label></td> 
                            <td><div class="form-group">

                                    <div class="col-lg-10">
                                        <input type="password" class=" bloqueado form-control" id=""  name="clave" required value="<%  out.print(uregistrado.getClave());%>"  placeholder="">
                                    </div>
                                </div></td>
                        </tr>
                    </table> 
                        <div class="style"><%if (request.getParameter("msg") != null) {
                            } %>  </div>
                            
                  <input  type="button"  class="btn btn-info  beton" name="btnActualizarusu"  onClick="location.href =  'recibirperfiladmi.jsp?idadministra=<%=uregistrado.getDocumento()%> '" id="guardar"   value="  Enviar"  >


                </form>
            </div>		                     
        </div>

        <%     } else {
                response.sendRedirect("../index.jsp");
            }

        %>

    </body>
</html>
