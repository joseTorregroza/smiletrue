/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Dtos.Historial;
import Dtos.UsuariosDTO;
import Facade.FHistorial;
import Facade.FUsuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Personal
 */
public class GestionHistorial extends HttpServlet {

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

        PrintWriter out = response.getWriter();

        UsuariosDTO datosUsuario = new UsuariosDTO();
        FUsuarios fu = new FUsuarios();
        FHistorial fh = new FHistorial();
        Historial h = null;
        HttpSession sesion = request.getSession(false);
        HttpSession miSesion = request.getSession(false);

        if (request.getParameter("consultar") != null) {

            long ced = Long.parseLong(request.getParameter("documento"));
            String nom = request.getParameter("nombre");
            String ape = request.getParameter("apellido");

            ArrayList<UsuariosDTO> lista = (ArrayList<UsuariosDTO>) fu.listTodos(ced, nom, ape);
            sesion.setAttribute("pacientes", lista);
            response.sendRedirect("sitioweb/usuarios/ingresarhistorial.jsp");
           

        } else if (request.getParameter("Historial") != null) {
            long ced = Long.parseLong(request.getParameter("Historial"));
            ArrayList<UsuariosDTO> lista = (ArrayList<UsuariosDTO>) fh.lisHis(ced);
            sesion.setAttribute("historial", lista);
            response.sendRedirect("sitioweb/usuarios/historial.jsp");

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

