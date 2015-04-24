/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Facade.FUsuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USUARIO
 */
public class GestionCorreos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String asunto = request.getParameter("cAsunto");
        String mensaje = request.getParameter("cCuerpo");
       int size =(Integer.parseInt(request.getParameter("contador")));
        FUsuarios  pdao = new FUsuarios();
        StringBuilder correos = new StringBuilder("");
        PrintWriter out = response.getWriter();
        for (int i = 0; i < size + 1; i++) {
            if (request.getParameter("idPersona[" + i + "]") != null) {
                correos.append(pdao.ObtenercorreoUsuarioId(Long.parseLong(request.getParameter("idPersona[" + i + "]"))));
                if (i != size - 1 && size > 0) {
                    correos.append(", ");
                }
            }
        }
        if (Correo.sendMail(asunto, mensaje, correos.toString())) {
            response.sendRedirect("sitioweb/usuarios/correomasivo.jsp?msg =  Se logró el envío, se le envió a los siguientes correos: " + correos.toString());
        } else {
            response.sendRedirect("sitioweb/usuarios/correomasivo.jsp?msg= no se pudo");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
