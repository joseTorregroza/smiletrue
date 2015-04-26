/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facade;

import Conexion.Conectar;
import Conexion.MyException;
import Daos.UsuarioDAO;

import Daos.menuDAO;
import Dtos.UsuariosDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sena
 */
public class FUsuarios extends HttpServlet {
    Connection cnx ;
     menuDAO menu;
     UsuarioDAO usuario;
     
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter(); 
        FUsuarios u= new  FUsuarios();
        
 
  
    }
    
    public FUsuarios() {

        cnx = Conectar.getConnection();
        menu = new menuDAO(cnx);
        usuario = new UsuarioDAO(cnx);
    }

    public HashMap<UsuariosDTO, String> Validarusu(String e, String p) {
        return menu.validarUsuario(e, p, cnx);
    }

    public List<UsuariosDTO> listTodos() {
        return usuario.listarTodos(cnx);
    }

    public String CrearU(UsuariosDTO u) {
        return usuario.crearUsuario(u, cnx);
    }
     public String CrearAd(UsuariosDTO u) {
        return usuario.crearAdmi(u, cnx);
    }

    public UsuariosDTO ObUsu(long id) {
        return usuario.obtenerUno(id, cnx);
    }
    
     public String modificarAdmi(UsuariosDTO  usdto) throws SQLException {
        return usuario.modificarAdmi(usdto, cnx);
    }
    public UsuariosDTO listarUsu(long id) {
        return usuario.listarUno(id, cnx);
    }
    
      public UsuariosDTO listarUsuAdmi(long id) {
        return usuario.listarUnoAdmi(id, cnx);
    }

    public String  ModUs(UsuariosDTO  usdto)   throws SQLException {
        return usuario.modfificarUsuario(usdto, cnx);
    }

    public String Eli(long id) {
        return usuario.eliminarUsuario(id, cnx);
    }

    public boolean modificarMail(long clave, long id) {
        return usuario.modificarUsuMail(clave, id, cnx);
    }

      public List<UsuariosDTO> listOd(){
        return usuario.listarOdontologos(cnx);
    }

    public List<UsuariosDTO> listTodos(long e,String non,String ape){
        return usuario.listarPacinetes(non, ape, e, cnx);
    }
    
     public String ObtenercorreoUsuarioId(long usuarioid) {
        return usuario.obtenerCorreoPorId(usuarioid, cnx);
    }
     
      public List obtenerPersonasParaCorreos() {
      return usuario.obtenerPersonas(cnx);
      }
       public StringBuilder valajax(long id) {
        return usuario.validarUserName(id);
    }
      
       public String cambiarEstado(int personaID, int nuevoEstado) {
       return usuario.cambiarestado(personaID, nuevoEstado, cnx);
       }
       
       public List<UsuariosDTO> ListarTodosLosUsuarios() throws MyException, SQLException {
           return usuario.ListarTodisUsuarios(cnx);
       }
      
          
     ////////////////////////////////////////ESTADOS//////////////////////////////////////////////
//     public List<CitaDTO> lisCi(){
//         return cita.listarTodos(cnx);
//     }
//     public CitaDTO OCita(String f ,int ce){
//         return cita.obtenerUno(f, ce, cnx);
//     }
//     public String creCi(CitaDTO c){
//         return cita.crearCita(c, cnx);  
//     }
//      public String MoCi(String f, int ce, int es, String ob){
//         return cita.modificarCita(f, ce, es, ob, cnx);  
//      }
//      //////////////////////////////////////////////CITAS////////////////////////////////////
//      public List<JornadaDTO> lisJor(){
//         return jornada.listarTodos(cnx);
//     }
//     public JornadaDTO OJorn(int ce){
//         return jornada.obtenerUno(ce, cnx);
//     }
//     public String creJor(JornadaDTO c){
//         return jornada.crearJornada(c, cnx);  
//     }
//      public String MoCi( int es, String ob){
//         return jornada.modificarJornada(es, ob, cnx);  
//      }
//      ////////////////////////////////////////////AGENDA//////////////////////////////////////////////
//      public ArrayList<AgendaMedicoDTO> lisAgen(int od){
//         return agenda.ConsultarAgenda(od, cnx);
//     }
    
    
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
