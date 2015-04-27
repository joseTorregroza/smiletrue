/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;


import Dtos.JornadaDTO;
import Conexion.Conectar;
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
public class JornadaDAO {
      Connection cnn ;
      PreparedStatement pstm = null;
      int rtdo;
      ResultSet rs = null;
    
      
      public JornadaDAO (){
          
      }
      String mensaje = "";

    public JornadaDAO(Connection cnx) {
        cnn= cnx;
    }
      
     
    public List<JornadaDTO> listarTodos(Connection cnn) {
        this.cnn = cnn;
        ArrayList<JornadaDTO> jornada = new ArrayList<>();
        try {
            String sqlAll = "SELECT idJornada, horario FROM jornadas where 1=1";                
            
            pstm = cnn.prepareStatement(sqlAll);
            rs = pstm.executeQuery();
            
            if (rs != null) {
                while (rs.next()) {
                    jornada.add( new JornadaDTO(rs.getInt("idJornada"), rs.getString("horario")));
                }
            }
        } catch (SQLException ex) {
            mensaje = "Error, datelle " + ex.getMessage();
        }
        
        return jornada;
    }

   
    public String crearJornada(JornadaDTO jdto,  Connection cnn) {
        this.cnn = cnn;
        try {
            String sqlInsert = "INSERT INTO `smilesystemv2`.`jornadas`(`idJornada`,`horario`) VALUES(?, ?)";
            
            pstm = cnn.prepareStatement(sqlInsert);
            pstm.setInt(1, jdto.getIdJornada());
            pstm.setString(2, jdto.getHorario());
           
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

    public JornadaDTO obtenerUno(int idJornada,  Connection cnn) {
        this.cnn = cnn;
        JornadaDTO jdto = null;
        String sqlOne = "SELECT idJornada, horario FROM jornadas WHERE `idJornada` = ?";
        try {
            pstm = cnn.prepareStatement(sqlOne);
            pstm.setInt(1, idJornada);
            rs = pstm.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    jdto = new JornadaDTO();
                    jdto.setIdJornada(rs.getInt("idJornada"));
                    jdto.setHorario(rs.getString("horario"));
                    
                }
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }

        return jdto;
    } 

    public String modificarJornada(int idjornada, String horario,  Connection cnn) {
        this.cnn = cnn;
        try {
            String sqlUpdate = "UPDATE  `smilesystemv2`.`jornadas`SET `horario` = ? WHERE `idJornada` = ?";
            pstm = cnn.prepareStatement(sqlUpdate);
            pstm.setString(1, horario);
            pstm.setInt(2, idjornada);
            

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
    public String eliminarJornada(int idJornada,  Connection cnn) {
        this.cnn = cnn;
        try {
            String sqlDelete = "DELETE FROM `smilesystemv2`.`jornadas` WHERE `jornadas`.`idJornada` = ?;";

            pstm = cnn.prepareStatement(sqlDelete);
            pstm.setInt(1, idJornada);
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
     public List<JornadaDTO> listaDispo( long id, String fe,Connection cn) {
        this.cnn = cnn;
        ArrayList<JornadaDTO> jornada = new ArrayList<>();
        try {
            String sqlAll = "select horario , idJornada from jornadas where idJornada not in (select idJornada from citas where  idOdontologo = ? and fecha= ?);";  
            pstm = cnn.prepareStatement(sqlAll);
            pstm.setLong(1, id);
            pstm.setString(2, fe);
            rs = pstm.executeQuery();
            
            if (rs != null) {
                while (rs.next()) {
                    jornada.add( new JornadaDTO(rs.getInt("idJornada"), rs.getString("horario")));
                }
            }
        } catch (SQLException ex) {
            mensaje = "Error, datelle " + ex.getMessage();
        }
        
        return jornada;
    }

}

