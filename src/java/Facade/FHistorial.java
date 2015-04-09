package Facade;

import Conexion.Conectar;
import Daos.CartaDentalDAO;
import Daos.HistorialDAO;
import Daos.ProcedimientoDAO;
import Daos.ProcedimientosCatalogosDAO;
import Daos.UsuarioDAO;
import Dtos.CartaDentalDTO;
import Dtos.Historial;
import Dtos.ProcedimientoDTO;
import Dtos.ProcedimientosCatalogosDTO;
import Dtos.UsuariosDTO;
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
public class FHistorial extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          PrintWriter out = response.getWriter();
          
            FHistorial citas = new FHistorial(); 
            
        
        ArrayList<Historial> salida=(ArrayList<Historial>) citas.lisHisp(0, "", ""); 
          ArrayList<CartaDentalDTO> sali=citas.lisCarta(1019041211); 
          
        out.print(salida);
    }
     Connection cnx ;
     ProcedimientosCatalogosDAO catalogo;
     ProcedimientoDAO procedimiento;
     HistorialDAO historial;
     CartaDentalDAO carta;
     UsuarioDAO usu;

    public FHistorial() {
        cnx= Conectar.getConnection();
       catalogo = new ProcedimientosCatalogosDAO(cnx) ;
       procedimiento= new ProcedimientoDAO(cnx); 
       historial = new HistorialDAO (cnx);
       carta = new CartaDentalDAO(cnx);
      
    }
    
     public List lisHis(long e){
         return historial.ConsultarHistorial(e, cnx);    
     }
     public List lisHisp(long e,String non,String ape){
         return historial.ConsultarHistorialPa(non, ape, e, cnx);    
     }
//     public List<EstadoDTO> lisE(){
//         return estado.listarTodos();  
//     }
//     public String creE(EstadoDTO e){
//         return estado.crearEstado(e);
//     }
//     public String MoEs(int id, String mo){
//         return estado.modificarEstado(id, mo);
//     }
//     public EstadoDTO ObEs(int id){
//         return estado.obtenerUno(id); 
//     }
     ////////////////////////////////////////HISTORIAL//////////////////////////////////////////////
     public ArrayList<CartaDentalDTO> lisCarta(long idProcPac){
         return carta.listarTodos(idProcPac, cnx);
     }
     public CartaDentalDTO OCarta(int ce){
         return carta.obtenerUno(ce, cnx);
     }
     public String creCarta(CartaDentalDTO c){
         return carta.crearCarta(c, cnx);  
     }
      public String MoCarta(CartaDentalDTO c){
         return carta.crearCarta(c, cnx);  
      }
      //////////////////////////////////////////////CARTADENTAL////////////////////////////////////
        public List<ProcedimientoDTO> lisProc(){
         return procedimiento.listarTodos(cnx);
     }
     public ProcedimientoDTO conProc(long ce){
         return procedimiento.ConsultarHistorial(ce, cnx);
     }
     public String crePro(ProcedimientoDTO c){
         return procedimiento.crea(c, cnx);  
     }
      public String MoCi( long es, String ob, int id, String op){
         return procedimiento.modificarProcedimiento(op, es, id, ob, cnx);  
      }
      /////////////////////////////////////////////PROCEDIMIENTO////////////////////////////////
     
     public String eliCat(int e){
         return catalogo.eliminarprocedimientosCatalogos(e, cnx); 
     }
     public List<ProcedimientosCatalogosDTO> lisCat(){
         return catalogo.listarTodos(cnx);  
     }
     public String creProCa(ProcedimientosCatalogosDTO e){
         return catalogo.crearProcedimientosCatalogos(e, cnx);
     }
     public String MoProCa(ProcedimientosCatalogosDTO c){
         return catalogo.modificarCita(c, cnx);
     }
     public ProcedimientosCatalogosDTO  ObProCa(int id){
         return catalogo.obtenerUno(id, cnx); 
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
