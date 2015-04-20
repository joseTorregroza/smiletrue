
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>   
         <%@page errorPage="error404.jsp" %>          
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>SmileSystem</title>
        <link rel="stylesheet" type="text/css" href="css/estiloi.css">
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <link rel="shortcut icon"  href="images/favicon.ico" />
         <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
          <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
        <meta name="keywords" content="" />
         <link rel="shortcut icon"  href="images/favicon.ico" />
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
             
                // sirver para validar los campos del formulario
                $("#form1").validate({
                        rules: {
                              cedula: {
                                  required: true,                                  
                                  minlength: 8,
                                  maxlength: 13
                              }
                        },
                        messages: {
                            cedula: {
                                required: '<div class="alert alert-info movera" role="alert">Este campo es Requerido</div>',
                                minlength:  '<div class="alert alert-info movera" role="alert">Son {0} digitos Mínimo </div>',
                                maxlength:  '<div class="alert alert-info movera" role="alert">Son {0} digitos Máximo </div>'
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

                        <li><a href="inicio.jsp" class=" active icon  fa-home"> Inicio</a></li>
                         <li><a href="index.jsp" class="active icon fa-users"> Afiliados</a></li>
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
                                            <form   name="form1"  action="../Mail"  id="form1" class=" form-horizontal" method="POST" style="   position:relative; left: 175px;" role="form" >
                                                <br>
                                                <fieldset style="padding-left: 58px; font-size: 38px;  font-family: 'Oswald', sans-serif;   color: white;"  padd>Recuperar contraseña</fieldset>
                                                <br>
                                                <br>
                                               
                                                <div  class=" ">
                                                    <span   for="cedula" class="input-group-addon"  style="  color: white;  font-size: 19px;  font-family: 'Oswald', sans-serif;  margin-left: 45px; ">Contraseña</span>
                                                    <input type="password" value=""  name="cedula" required class=" form-control" id="cedula"   style="  font-size: 19px;   font-family: 'Oswald', sans-serif;   margin-left: 43px;  height: 43px;" >
                                                   
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
                                                <input style="    margin-top: 30px;   margin-left: 113px;  height: 57px; width: 200px; background-color: #46b8da; color:#000000;" type="submit"  name="recu"    value="Enviar" class="bt btn-info"> 
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
