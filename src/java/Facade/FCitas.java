/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facade;

import Conexion.Conectar;
import Daos.AgendaMedico;
import Daos.CitaDAO;
import Daos.EstadoDAO;
import Daos.JornadaDAO;
import Dtos.AgendaMedicoDTO;
import Dtos.CitaDTO;
import Dtos.EstadoDTO;
import Dtos.JornadaDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Personal
 */
public class FCitas extends HttpServlet {
    Connection cnx ;
     AgendaMedico agenda;
     CitaDAO cita;
     EstadoDAO estado;
     JornadaDAO jornada;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter(); 
        FCitas citas = new FCitas(); 
        
        CitaDTO salida=citas.OCitaId(1081407241); 
        
        out.print(salida);
    }
    
    public FCitas() {
        
        cnx= Conectar.getConnection();
        cita = new CitaDAO(cnx);
        estado= new EstadoDAO(cnx);
        jornada= new JornadaDAO(cnx);
        agenda = new AgendaMedico(cnx);
    }
   
     public String eliEstado(int e){
         return estado.eliminarEstado(e, cnx); 
     }
     public List<EstadoDTO> lisE(){
         return estado.listarTodos(cnx);  
     }
     public String creE(EstadoDTO e){
         return estado.crearEstado(e, cnx);
     }
     public String MoEs(int id, String mo){
         return estado.modificarEstado(id, mo, cnx);
     }
     public EstadoDTO ObEs(int id){
         return estado.obtenerUno(id, cnx); 
     }
     ////////////////////////////////////////ESTADOS//////////////////////////////////////////////
     public List<CitaDTO> lisCi(){
         return cita.listarTodos(cnx);
     }
     public CitaDTO OCita(String f ,int ce){
         return cita.obtenerUno(f, ce, cnx);
     }
      public CitaDTO OCitaId(long ce){
         return cita.obtCita(ce, cnx);
     }
     public String creCi(CitaDTO c){
         return cita.crearCita(c, cnx);  
     }
      public String MoCi(String f, int ce, int es, String ob){
         return cita.modificarCita(f, ce, es, ob, cnx);  
      }
      public String CanCi( long ce, String fec){
         return cita.cancelarCita( ce, fec,cnx);  
      }
        public int ValCi(long ce ){
         return cita.validarCitas(ce, cnx);  
     }
      ////
      //////////////////////////////////////////////CITAS////////////////////////////////////
      public List<JornadaDTO> lisJor(){
         return jornada.listarTodos(cnx);
     }
     public JornadaDTO OJorn(int ce){
         return jornada.obtenerUno(ce, cnx);
     }
     public String creJor(JornadaDTO c){
         return jornada.crearJornada(c, cnx);  
     }
      public String MoCi( int es, String ob){
         return jornada.modificarJornada(es, ob, cnx);  
      }
      ////////////////////////////////////////////AGENDA//////////////////////////////////////////////
      public ArrayList<AgendaMedicoDTO> lisAgen(long od){
         return agenda.ConsultarAgenda(od, cnx);
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
