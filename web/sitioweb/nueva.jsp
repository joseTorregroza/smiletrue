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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <h1>Nueva Contraseña</h1>
       <form action="Mail" method="POST">
            <input type="text" name="cla1" value="" placeholder="nueva"/>
             <h1>Confirmacion Contraseña</h1>
            <input type="text" name="cla2" value="" placeholder="confirmacion" />
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