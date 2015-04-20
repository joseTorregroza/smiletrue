<%-- 
    Document   : index
    Created on : 01-abr-2015, 23:24:14
    Author     : USUARIO
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
    <%@page errorPage="error404.jsp" %> 
        <link rel="stylesheet" type="text/css" href="css/estiloi.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SmileSystem</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <link rel="shortcut icon"  href="images/favicon.ico" />
        <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
        <meta name="keywords" content="" />
        <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
        <script src="js/jquery.js"></script>
         <script language="javascript" src="js/jquery.validate.js"></script>
        <script src="js/jquery.scrollzer.min.js"></script>
        <script src="js/jquery.scrolly.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/skel-layers.min.js"></script>
        <script src="js/init.js"></script>
        <noscript>
        <link rel="stylesheet" href="css/skel.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-xlarge.css" />
        </noscript>
        <!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
      <script type="text/javascript">
         $(document).ready(function () {
                jQuery.validator.addMethod("lettersonly", function (value, element) {
                    return this.optional(element) || /^[a-zA-ZÃ¡Ã©Ã­Ã³ÃºÃ Ã¨Ã¬Ã²Ã¹ÃÃÃÃÃÃÃÃÃÃÃ±ÃÃ¼Ã_\s]+$/i.test(value);
                }, '<div class="alert alert-info  movera"  role="alert">solo puede ingresar letras</div>');

                // sirver para validar los campos del formulario
                $("#form1").validate({
                        rules: {
                              pass: {
                                  required: true,                                  
                                  minlength: 5,
                                  maxlength: 13
                              },
                              user: {
                                  required: true,
                                  minlength: 5,
                                  maxlength: 30
                              }
                        },
                        messages: {
                            pass: {
                                required: '<div class="alert alert-info movera" role="alert">Este campo es Requerido</div>',
                                minlength:  '<div class="alert alert-info movera" role="alert">Son {0} digitos Mínimo </div>',
                                maxlength:  '<div class="alert alert-info movera" role="alert">Son {0} digitos Máximo </div>'
                            },
                            user: {
                                required:  '<div class="alert alert-info movera" role="alert">Este campo es Requerido</div>',
                                number: '<div class="alert alert-info movera" role="alert">El  campo debe ser Numérico  </div>',
                                minlength: '<div class="alert alert-info movera" role="alert">Son {0} digitos Mínimo </div>',
                                
                                 
                            }
                        },
                });
         });
        </script>

    </head>
    <body>
        <div id="wrapper">
            <!-- Header -->
            <section id="header" class="skel-layers-fixed">
                <header>
                    <span class="image avatar"><img src="images/favicon.jpg" alt="" /></span>
                    <h1 id="logo"><a href="#">SmileSystem</a></h1>
                    <p>Sistema  para la gestion de citas e historial clinico </p>
                </header>
                <nav id="nav">
                    <ul>

                         <li><a href="inicio.jsp" class="icon  fa-home"> Inicio</a></li>
                         <li><a href="#" class="active icon fa-users"> Afiliados</a></li>
                                           
                        <li><a href="inicio.jsp" class="icon fa-user"> Contactenos</a></li>
                        <li><a href="inicio.jsp" class="icon fa-newspaper-o"> Servicios</a></li>
                        <li><a href="inicio.jsp" class="icon fa-question-circle "> Inquietudes</a></li>
                    </ul>
                </nav>
                <br>
                <footer>
                    <ul class="icons">
                        <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                        <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                        <li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
                    </ul>
                </footer>
            </section>
            <!-- Header -->
            <!-- Main -->
            <div id="main">
                <!-- One -->
                <section id="one">
                    <div class="container">
                        <div class="panel panel-default" style="background-color:#a6e1ec">
                            <div class="panel panel-default" >
                                <br>
                                <div class="panel-heading" style=" color:#000000;  font-size: 40px;                         
                                     font-family:OpenSans  "><center>
                                        </center>
                                </div>
                                <div class="panel-body"  style=" color:#000000; ">
                                    <div class="row">                               
                                        <div class="col-md-6">
                                            <div class="mover"  style="  margin-left: -214px;">
                                            <form name="form1" action="../UsuarioServlet"  id="form1"   class=" form-horizontal" method="POST" style="position:relative; left: 150px;    margin-top: -19px;"  >
                                                <br>
                                                <fieldset style="padding-left: 114px; font-size: 38px;  font-family: 'Oswald', sans-serif;   color: white;"  padd>Iniciar Sesion</fieldset>
                                                <br>
                                                <br>
                                                <div  class=" form-group input-group input-group-lg">
                                                    <span   for ="user" class="input-group-addon"  style="  color: white;  font-size: 19px;  font-family: 'Oswald', sans-serif;  margin-left: 58px;">Usuario</span>
                                                    <input type="text" name="user" id="user" class="required form-control lettersonly" tabindex="2"   >
                                                </div> 
                                                <div  class=" form-group input-group input-group-lg">
                                                    <span   for="pass" class="input-group-addon"  style="  color: white;  font-size: 19px;   font-family: 'Oswald', sans-serif;   margin-left: 58px;">Contraseña</span>
                                                    <input type="password" value="" name="pass" required class=" form-control" id="pass" >
                                                </div>  

                                                <div>
                                                    <label  class="ayuda"><a onClick="OcultarForm('Formlogin', 'Recuperar');" href="indexx.jsp" style="margin-left: 158px;  font-family: 'Oswald', sans-serif;   font-size: 15px;">Recordar Contraseña ?</a></label>
                                                </div>

                                                <div class="style"><%if (request.getParameter("msg") != null) {%>

                                                    <div class="alert alert-error " role="alert" style="  width: 250px;  height: 40px;   margin-left: 57px;">
                                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                                            <span >&times;</span>
                                                        </button>
                                                        <p><strong> <%out.print(request.getParameter("msg")); %></Strong> <i class='glyphicon glyphicon-ok'></i></p>
                                                    </div>


                                                    <%    }%>  </div>
                                                    <div class="mover">
                                                <input style=" margin-left: 120px;  height: 57px; width: 200px; background-color: #46b8da; color:#000000;"  type="submit" name="btnIngresar" value="Ingresar" class="bt btn-info"> 
                                                </div>
                                                </form>     
                                                    </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                   
                </section>
                <!-- One -->

            </div>               
        </div>
        <!-- Footer -->
        <section id="footer">
            <div class="container">
                <ul class="copyright">
                    <li>&copy; Smile System</li><li> Gaes: Juan Manuel Vargas Liz y Jose Carlos Torregroza<li>
                </ul>
            </div>
        </section>
      
        <!-- Footer -->
    </body>
</html>
