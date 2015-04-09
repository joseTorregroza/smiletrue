<%-- 
    Document   : index
    Created on : 01-abr-2015, 23:24:14
    Author     : USUARIO
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SmileSystem</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <link rel="shortcut icon"  href="images/favicon.ico" />
        <meta name="keywords" content="" />
        <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
        <script src="js/jquery.min.js"></script>
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

                        <li><a href="index.jsp" class=" active icon  fa-home"> Inicio</a></li>
                         <li><a href="inicio.jsp" class="active icon fa-users"> Afiliados</a></li>
                        <li><a href="index.jsp" class="icon fa-user"> Contactenos</a></li>
                        <li><a href="index.jsp" class="icon fa-newspaper-o"> Servicios</a></li>
                        <li><a href="index.jsp" class="icon fa-question-circle "> Inquietudes</a></li>
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
                                            <form name="frmUsuario" action="../UsuarioServlet" id="form1" class=" form-horizontal" method="POST" style="position:relative; left: 200px;" role="form" action="../../UsuarioServlet">
                                                <br>
                                                <fieldset style="padding-left: 63px; font-size: 38px;"  padd>Iniciar Sesion</fieldset>
                                                <br>
                                                <br>
                                                <div  class=" form-group input-group input-group-lg">
                                                    <span   for ="user" class="input-group-addon">Usuario</span>
                                                    <input type="text" name="user" class="  form-control" required  id="use" value="" tabindex="2" name="Cedula"   >
                                                </div> 
                                                <div  class=" form-group input-group input-group-lg">
                                                    <span   for="pass" class="input-group-addon">Contraseña</span>
                                                    <input type="password" value="" name="pass" required class="lettersonly form-control" id="pass" >
                                                </div>  

                                                <div>
                                                    <label  class="ayuda"><a onClick="OcultarForm('Formlogin', 'Recuperar');" href="#">Recordar Contraseña ?</a></label>
                                                </div>

                                                <div class="style"><%if (request.getParameter("msg") != null) {
                                                        out.print(request.getParameter("msg"));
                                                    }%>  </div>
                                                    <div class="mover">
                                                <input style=" margin-left: 75px;  height: 57px; width: 200px; background-color: #46b8da; color:#000000;" type="submit" name="btnIngresar" value="Ingresar" class="btn btn-primary"> 
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
