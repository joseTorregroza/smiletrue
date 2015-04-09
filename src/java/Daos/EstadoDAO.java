/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;


import Dtos.EstadoDTO;
import Conexion.Conectar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Administrador
 */
public class EstadoDAO {
 private Connection cnn = null;
      PreparedStatement pstm = null;
      int rtdo;
      ResultSet rs = null;
    
      
      public EstadoDAO (){
          
      }
      String mensaje = "";



    public EstadoDAO(Connection cnx) {
        cnn= cnx;
    }
      
     
    public List<EstadoDTO> listarTodos(Connection cnn) {
        this.cnn = cnn;
        ArrayList<EstadoDTO> estados = new ArrayList<>();
        try {
            String sqlAll = "SELECT idEstado, descripcion FROM estados where 1=1";                
            
            pstm = cnn.prepareStatement(sqlAll);
            rs = pstm.executeQuery();
            
            if (rs != null) {
                while (rs.next()) {
                    estados.add( new EstadoDTO(rs.getInt("idEstado"), rs.getString("descripcion")));
                }
            }
        } catch (SQLException ex) {
            mensaje = "Error, datelle " + ex.getMessage();
        }
        
        return estados;
    }

   
    public String crearEstado(EstadoDTO edto ,  Connection cnn) {
        this.cnn = cnn;
        try {
            String sqlInsert = "INSERT INTO `smilesystemv2`.`estados`(`idEstado`,`descripcion`) VALUES(?, ?)";
            
            pstm = cnn.prepareStatement(sqlInsert);
            pstm.setInt(1, edto.getIdEstado());
            pstm.setString(2, edto.getDescripcion());
           
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

    public EstadoDTO obtenerUno(int idEstado,  Connection cnn) {
        this.cnn = cnn;
        EstadoDTO edto = null;
        String sqlOne = "SELECT idEstado, descripcion FROM estados WHERE `idEstado` = ?";
        try {
            pstm = cnn.prepareStatement(sqlOne);
            pstm.setInt(1, idEstado);
            rs = pstm.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    edto = new EstadoDTO();
                    edto.setIdEstado(rs.getInt("idEstado"));
                    edto.setDescripcion(rs.getString("descripcion"));
                    
                }
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }

        return edto;
    } 

    public String modificarEstado(int idEstado, String descripcion,  Connection cnn) {
        this.cnn = cnn;
        try {
            String sqlUpdate = "UPDATE  `smilesystemv2`.`estados`SET `descripcion` = ? WHERE `idEstado` = ?";
            pstm = cnn.prepareStatement(sqlUpdate);
            pstm.setString(1, descripcion);
            pstm.setInt(2, idEstado);
            

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
    public String eliminarEstado(int idEstado,  Connection cnn) {
        this.cnn = cnn;
        try {
            String sqlDelete = "DELETE FROM `smilesystemv2`.`estados` WHERE `estados`.`idEstado` = ?;";

            pstm = cnn.prepareStatement(sqlDelete);
            pstm.setInt(1, idEstado);
            rtdo = pstm.executeUpdate();
            if (rtdo != 0) {
                mensaje = "Se elimino correctamente";
            } else {
                mensaje = "No se pudo realizar la eliminación";
            }
        } catch (SQLException ex) {
            mensaje = "Error, detalle: " + ex.getMessage();
        }
        return mensaje;
    }
      
}


    
    
  
    

  

