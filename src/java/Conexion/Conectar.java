/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import Daos.AgendaMedico;
import Daos.EstadoDAO;
import Dtos.AgendaMedicoDTO;
import Dtos.EstadoDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author USUARIO
 */
public class Conectar extends HttpServlet {

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
                       AgendaMedico pdao = new AgendaMedico();
               AgendaMedicoDTO pdto = new  AgendaMedicoDTO();
          
     try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Conectar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Conectar at " + request.getContextPath() + "</h1>");
            out.println("<h1>Resultado de la conexión " + getConnection() + "</h1>");
                AgendaMedico ag= new  AgendaMedico();
           AgendaMedicoDTO a= new AgendaMedicoDTO();
           ArrayList<AgendaMedicoDTO> agenda;
            Connection cnn = Conectar.getConnection() ;
           
           //agenda= ag.ConsultarAgenda(1234567891,cnn);
           EstadoDAO es = new EstadoDAO ();
            EstadoDTO est  = new EstadoDTO ();
          
            String salida = es.modificarEstado(3, "nuevo", cnn);
           out.print(salida);
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }
    
     public static Connection getConnection() {
        Connection cnn = null;
        String salida = "inicio";
        Context ctx;
        try {
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("jdbc/smile");
            cnn = ds.getConnection();
            if (cnn != null) {

            EstadoDAO es = new EstadoDAO ();
            EstadoDTO est  = new EstadoDTO ();
          
            salida = es.eliminarEstado(1, cnn);
                return cnn;

            } else {
                cnn= null;
            }
        } catch (NamingException ex) {
            salida += ex.getMessage();
        } catch (SQLException sqle) {
            salida += sqle.getMessage();
        }
        return cnn ;

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
