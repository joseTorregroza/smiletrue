  /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Daos.AgendaMedico;
import Daos.CartaDentalDAO;
import Daos.CitaDAO;
import Daos.HistorialDAO;
import Daos.UsuarioDAO;
import Dtos.AgendaMedicoDTO;
import Dtos.CartaDentalDTO;
import Dtos.CitaDTO;
import Dtos.Historial;
import Dtos.JornadaDTO;
import Dtos.UsuariosDTO;
import Facade.FCitas;
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
 * @author USUARIO
 */
public class GestionCitas extends HttpServlet {

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

        UsuariosDTO datos = new UsuariosDTO();
        FUsuarios fu = new FUsuarios();
        FCitas fc = new FCitas();
        Historial h = null;
        HttpSession sesion = request.getSession(false);
        HttpSession miSesion = request.getSession(false);

        if (request.getParameter("can") != null || request.getParameter("fechaci") != null) {
            long ced = Long.parseLong(request.getParameter("can"));
            String fecha = request.getParameter("fechaci");
            String msg = fc.CanCi(ced, fecha);
            if (msg.equals("ok")) {
                response.sendRedirect("sitioweb/usuarios/agendamedico.jsp?info=1");
            } else {
                response.sendRedirect("sitioweb/usuarios/agendamedico.jsp?alert=1");
            }

//            response.sendRedirect("sitioweb/usuarios/odontograma.jsp" );
        } else if (request.getParameter("ci") != null) {
             UsuariosDTO us = (UsuariosDTO) miSesion.getAttribute("usr");

            ArrayList<JornadaDTO> jor = new ArrayList();
            ArrayList<UsuariosDTO> odon = new ArrayList();
            jor = (ArrayList<JornadaDTO>) fc.lisJor();
            odon = (ArrayList<UsuariosDTO>) fu.listOd();
         
            sesion.setAttribute("jornada", jor);
            sesion.setAttribute("medicos", odon);

       
              
                   int exis= fc.ValCi(us.getDocumento());
                 if (exis>1) {
               
                  CitaDTO cita= new CitaDTO ();
                     cita= fc.OCitaId(us.getDocumento());
                    String val= cita.toString();
                     if (val!=null) {
                                       
                     sesion.setAttribute("Citas", cita);
//                    datos = fu.ObUsu(1081407241);
//                  sesion.setAttribute("Odonto", datos);
                  response.sendRedirect("sitioweb/usuarios/citas.jsp?si=1"+us.getDocumento());
//                   
            } else {
                  response.sendRedirect("sitioweb/usuarios/citas.jsp?");
                     }
                 
                 }
         }else if(request.getParameter("citar")!=null){
            CitaDTO c= new CitaDTO();
            
           long id= Long.parseLong(request.getParameter("cedula"));
           if(fu.ObUsu(id)!=null){
           c.setIdPaciente(Long.parseLong(request.getParameter("cedula")));
           c.setIdOdontologo(Long.parseLong(request.getParameter("odontologo")));
           c.setFecha(request.getParameter("fechacita"));
           c.setIdJornada(Integer.parseInt(request.getParameter("turno")));
           c.setIdEstados(2);
           
           String msg = fc.creCi(c);
          if (msg.equals("ok")) {
                response.sendRedirect("sitioweb/usuarios/citas.jsp?info=1");
            } else {
                response.sendRedirect("sitioweb/usuarios/citas.jsp?alert=2");
            }
           }

    }
      else  if (request.getParameter("can2") != null || request.getParameter("fechaci2") != null) {
            long ced = Long.parseLong(request.getParameter("can2"));
            String fecha = request.getParameter("fechaci2");
            String msg = fc.CanCi(ced, fecha);
            if (msg.equals("ok")) {
                response.sendRedirect("sitioweb/usuarios/citas.jsp?info=1");
            } else {
                response.sendRedirect("sitioweb/usuarios/citas.jsp?si=1");
            }
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
