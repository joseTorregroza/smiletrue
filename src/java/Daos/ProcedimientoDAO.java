/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;


import Dtos.ProcedimientoDTO;
import Conexion.Conectar;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Administrador
 */
public class ProcedimientoDAO {
      Connection cnn;
      PreparedStatement pstm = null;
      int rtdo;
      ResultSet rs = null;
      CallableStatement cst= null;
    
      
      public ProcedimientoDAO (){
          
      }
      String mensaje = "";

    public ProcedimientoDAO(Connection cnx) {
        cnn=cnx;
     }
      
     
    public List<ProcedimientoDTO> listarTodos(Connection cnn) {
        this.cnn = cnn;
        ArrayList<ProcedimientoDTO> procedimientos = new ArrayList<>();
        try {
            String sqlAll = "SELECT fechaProcCita, idProcPac, idCartadental, idCatalogo, observacion FROM  where 1=1";                
            
            pstm = cnn.prepareStatement(sqlAll);
            rs = pstm.executeQuery();
            
            if (rs != null) {
                while (rs.next()) {
                    procedimientos.add( new ProcedimientoDTO(rs.getString("fechaProcCita"), rs.getInt("idProcPaciente"),rs.getInt("idCartadental"),rs.getInt("idCatalogo"),rs.getString("observacion")));
                }
            }
        } catch (SQLException ex) {
            mensaje = "Error, datelle " + ex.getMessage();
        }
        
        return procedimientos;
    }

   
    public String crea(ProcedimientoDTO pdto,  Connection cnn) {
        this.cnn = cnn;
        try {
            String sqlInsert = "INSERT INTO `smilesystemv2`.`procedimientos`(fechaProcCita, idProcPac, idCartadental, idCatalogo, observacion ) VALUES(?, ?,?,?,?)";
            
            pstm = cnn.prepareStatement(sqlInsert);
            pstm.setString(1, pdto.getFechaProcCita());
            pstm.setLong(2, pdto.getIdProcPac());
            pstm.setInt(3, pdto.getIdCartadental());
            pstm.setInt(4, pdto.getIdCatalogo());
            pstm.setString(6, pdto.getObservacion());
           
            rtdo = pstm.executeUpdate();
            if (rtdo != 0) {
                mensaje = "Registro éxitoso";
            } else {
                mensaje = "No se pudo realizar la insert";
            }

        } catch (SQLException sqle) {
            mensaje = sqle.getMessage();
        }
        return mensaje;
    }

    public ProcedimientoDTO ConsultarHistorial( long  idProcPac,Connection cnn) {
        this.cnn = cnn;
        ProcedimientoDTO pdto = null;
        String sqlOne =   "select  usuarios.nombres,usuarios.apellidos, citas.Fecha " +
"        jornadas.horario ,procedimientosCatalogos.procedimiento, citas.observacion from   usuarios "+
"        join odontologos ON usuarios.documento = odontologos.idOdontologojoin citas ON odontologos.idOdontologo = citas.idOdontologo" +
"        join procedimientos ON citas.idPaciente = procedimientos.idProcPac and citas.Fecha = procedimientos.fechaProcCita" +
"        join procedimientoscatalogos ON procedimientos.idCatalogo = procedimientoscatalogos.idCatalogo" +
"        join estados ON citas.idEstados = estados.idEstado join jornadas ON citas.idJornada= jornadas.idJornada" +
"        where citas.idPaciente = ? ";
          ResultSet resultado = rs;
             try { 
                 pstm = cnn.prepareCall(sqlOne);
                 pstm.setLong(1, idProcPac);
                 rs= pstm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
             
                }
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }
         

        return pdto;
    } 

    public String modificarProcedimiento( String fechaProcCita, long  idProcPac,int idCatalogo, String observacion,  Connection cnn ) {
        this.cnn = cnn;
        try {
            String sqlUpdate = "UPDATE  `smilesystemv2`.`procedimientos`SET `idCatalogo` = ? WHERE `fechaProcCita` = ? and  idProcPac=?";
            pstm = cnn.prepareStatement(sqlUpdate);
            pstm.setString(1, fechaProcCita);
            pstm.setLong(2, idProcPac);
            pstm.setInt(3, idCatalogo);
            pstm.setString(4, observacion);
            

            rtdo = pstm.executeUpdate();
            if (rtdo != 0) {
                mensaje = "Actualización éxitosa";
            } else {
                mensaje = "No se pudo realizar la actualización";
            }
        } catch (SQLException sqle) {
            mensaje = sqle.getMessage();
        }
        return mensaje;
    }



 

}