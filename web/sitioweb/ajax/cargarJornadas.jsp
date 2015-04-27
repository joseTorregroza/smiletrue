

<%@page import="Facade.FCitas"%>
<%@page import="Dtos.JornadaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jornadas</title>
    </head>
    <body>
        <%
            FCitas fc = new FCitas();
            ArrayList<JornadaDTO> jornadas = new ArrayList();

          if (request.getParameter("idfecha")!=null) {
                  
              

                jornadas = (ArrayList<JornadaDTO>) fc.lisDis(1081407271,"2015-04-21");                
                if (jornadas.size() > 0) {
                    for (JornadaDTO cDatos : jornadas) {
                        out.write("<option value= " + cDatos.getIdJornada() + ">" + cDatos.getHorario() + "</option>");
                    }
                }
          }
        %>
    </body>
</html>
