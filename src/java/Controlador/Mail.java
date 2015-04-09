/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Conexion.newClass;
import Dtos.UsuariosDTO;
import Facade.FUsuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.EncoderException;

/**
 *
 * @author USUARIO
 */
public class Mail extends HttpServlet {

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
    FUsuarios fu = new FUsuarios();
        UsuariosDTO us = new UsuariosDTO();
        newClass nc = new newClass();
        String rol;
        
        HttpSession sesion = request.getSession(true);
        if (request.getParameter("recu") != null) {
            long asu = Long.parseLong(request.getParameter("cedula"));
            if (fu.ObUsu(asu) != null) {
                try {
                    us = fu.ObUsu(asu);
                    long doc = us.getDocumento();
                    String con = String.valueOf(doc);
                    String ced = nc.encode(con);

                    String url = "http://localhost:8080/smilesystem/sitioweb/nueva.jsp?id=" + (ced);
                    Correo.sendMail("Recuperar Contraseña", url, us.getEmail());
                    response.sendRedirect("sitioweb/index.jsp?msg= correo enviado ");

                    // 
                } catch (EncoderException ex) {
                    Logger.getLogger(Mail.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        } else if (request.getParameter("cambiar") != null) {
            String cedu = request.getParameter("ids").trim();
            long cla1 = Long.parseLong(request.getParameter("cla1").trim());
            long cla2 = Long.parseLong(request.getParameter("cla2").trim());

            if (cla1 == cla2) {
                try {
                    String cod = nc.Decode(cedu);
                    long cedula = Long.parseLong(cod);
                    fu.modificarMail(cla2, cedula);
                    response.sendRedirect("sitioweb/index.jsp?msg= clave modificada ");
                } catch (Exception ex) {
                    Logger.getLogger(Mail.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            response.sendRedirect("sitioweb/index.jsp?msg= las claves no coinciden");

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
