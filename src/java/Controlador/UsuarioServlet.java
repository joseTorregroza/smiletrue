/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Dtos.UsuariosDTO;
import Facade.FUsuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USUARIO
 */
public class UsuarioServlet extends HttpServlet {

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
        if (request.getParameter("btnIngresar") != null && request.getParameter("btnIngresar").equals("Ingresar")) {
            String usr = request.getParameter("user");
            String psw = request.getParameter("pass");
            UsuariosDTO datosUsuario = new UsuariosDTO();
            String menuAPintar = "";
            HashMap<UsuariosDTO, String> hs = new HashMap<UsuariosDTO, String>();
            hs = fu.Validarusu(usr, psw);
            for (Map.Entry<UsuariosDTO, String> registro : hs.entrySet()) {
                datosUsuario = registro.getKey();
                menuAPintar = registro.getValue();
            }

            // out.print("documento " + datosUsuario.getDocumento());
            if (datosUsuario.getDocumento() != 0) {
                HttpSession miSesion = request.getSession(true);
                miSesion.setAttribute("usr", datosUsuario);
                miSesion.setAttribute("mp", menuAPintar);
                response.sendRedirect("sitioweb/usuarios/iniciarsesion.jsp");

            } else {
                response.sendRedirect("sitioweb/index.jsp?msg=no existe");
            }
        } else if (request.getParameter("guardarUsuario") != null) {

            UsuariosDTO usnuevo = null;

            try {

                usnuevo = new UsuariosDTO();
                usnuevo.setNombres(request.getParameter("NombreCompleto"));
                usnuevo.setApellidos(request.getParameter("ApellidoCompleto"));
                usnuevo.setTipoDoc(request.getParameter("tipodoc"));
                usnuevo.setDocumento(Long.parseLong(request.getParameter("Cedula").trim()));
                usnuevo.setGrupoSangui(Integer.parseInt(request.getParameter("Gruposanguineo").trim()));
                usnuevo.setTipoAlergia(Integer.parseInt(request.getParameter("TipoAlergia").trim()));
                usnuevo.setFechadenacimiento(request.getParameter("FechaNacimiento").trim());
                usnuevo.setLugardeNacimiento(request.getParameter("LugardeNacimiento").trim());
                usnuevo.setEmail(request.getParameter("email").trim());
                usnuevo.setTelefono(request.getParameter("Telefono").trim());
                usnuevo.setDireccion(request.getParameter("Direccion").trim());
                usnuevo.setCiudad(request.getParameter("Ciudad").trim());
                usnuevo.setGenero(request.getParameter("Sexo").trim());

                String mensa = fu.CrearU(usnuevo);

                response.sendRedirect("sitioweb/usuarios/registro.jsp?msg= Usuario Registrado" + mensa);
            } catch (IOException ex) {
                response.sendRedirect("sitioweb/sitioes/paciente/error");
            }

        } else if (request.getParameter("guardarAdmi") != null) {

            try {

                UsuariosDTO usnuevo = new UsuariosDTO();
                usnuevo.setNombres(request.getParameter("NombreCompleto"));
                usnuevo.setApellidos(request.getParameter("ApellidoCompleto"));
                usnuevo.setTipoDoc(request.getParameter("tipodoc"));
                usnuevo.setDocumento(Long.parseLong(request.getParameter("Cedula").trim()));
                usnuevo.setRoles(Integer.parseInt(request.getParameter("rol").trim()));
                usnuevo.setTarjetaprofesional(Long.parseLong(request.getParameter("tarjetaProfe").trim()));
                usnuevo.setFechadenacimiento(request.getParameter("FechaNacimiento").trim());
                usnuevo.setLugardeNacimiento(request.getParameter("LugardeNacimiento").trim());
                usnuevo.setEmail(request.getParameter("email").trim());
                usnuevo.setTelefono(request.getParameter("Telefono").trim());
                usnuevo.setDireccion(request.getParameter("Direccion").trim());
                usnuevo.setCiudad(request.getParameter("Ciudad").trim());
                usnuevo.setGenero(request.getParameter("Sexo").trim());

                String mensa = fu.CrearAd(usnuevo);

                response.sendRedirect("sitioweb/usuarios/registroadmi.jsp?msg= Usuario Registrado" + mensa);
            } catch (IOException ex) {
                response.sendRedirect("sitioweb/sitioes/paciente/error");
            }

        } else if (request.getParameter("btnModificar") != null) {

            try {
                UsuariosDTO usnuevo = new UsuariosDTO();
                usnuevo.setNombres(request.getParameter("NombreCompleto").trim());
                usnuevo.setApellidos(request.getParameter("ApellidoCompleto").trim());
                usnuevo.setTipoDoc(request.getParameter("tipodoc").trim());
                usnuevo.setDocumento(Long.parseLong(request.getParameter("Cedula").trim()));
                usnuevo.setRoles(Integer.parseInt(request.getParameter("rol").trim()));
                usnuevo.setTarjetaprofesional(Long.parseLong(request.getParameter("tarjetaProfe").trim()));
                usnuevo.setFechadenacimiento(request.getParameter("FechaNacimiento").trim());
                usnuevo.setLugardeNacimiento(request.getParameter("LugardeNacimiento").trim());
                usnuevo.setEmail(request.getParameter("email").trim());
                usnuevo.setTelefono(request.getParameter("Telefono").trim());
                usnuevo.setDireccion(request.getParameter("Direccion").trim());
                usnuevo.setCiudad(request.getParameter("Ciudad").trim());
                usnuevo.setGenero(request.getParameter("Sexo").trim());
                usnuevo.setClave(request.getParameter("clave").trim());
                String salida = fu.modificarAdmi(usnuevo);
                response.sendRedirect("sitioweb/usuarios/perfiladmi.jsp?sal" + salida);
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (request.getParameter("btnActualizarusu") != null) {

            boolean salida = fu.ModUs(Long.parseLong(request.getParameter("Cedula")), request.getParameter("NombreCompleto"));
            if (salida == true) {

                response.sendRedirect("sitioweb/usuarios/perfil.jsp?sal=actualizado!!!!");
            } else {
                response.sendRedirect("sitioweb/usuarios/perfil.jsp?sal= fallo al actualizar");
            }

        } else {
            response.sendRedirect("sitioweb/index.jsp?msg=no puede ingresar");
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
