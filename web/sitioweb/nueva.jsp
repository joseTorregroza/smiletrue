<%-- 
    Document   : nueva
    Created on : 04-mar-2015, 8:04:11
    Author     : Sena
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String id=request.getParameter("id").trim();
 if (id != "") {
%>
<html>
    <head>
           <script src="js/jquery.js"></script>
        <script src="js/jquery.validate.js"></script>
        
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
        <link rel="stylesheet" href="css/manu.css" />
        <link rel="stylesheet" href="css/style-xlarge.css" />
        </noscript>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <h1>Nueva Contraseña</h1>
       <form action="../Mail" method="POST">
           <label>Contraseña</label>
           <input type="text" name="cla1" value="" requerid  placeholder="nueva"/><br>
             <label>Comprobar Contraseña</label>
             <input type="text" name="cla2" value=""   requerid   placeholder="confirmacion" /><br>
            <input type="hidden" name="ids" value="<%=id %>" />
            <input type="submit" value="guardar" name="cambiar" />
            
        </form>
    </body>
        </html>

    <% }%><% else{%>
    <html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page2</title>

    </head>
    <body>
        <h1>acceso illegal</h1>

    </body>
     </html>

 <%}%>