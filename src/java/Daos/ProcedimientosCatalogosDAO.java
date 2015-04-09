/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.ProcedimientosCatalogosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import Conexion.Conectar;

import java.util.ArrayList;

public class ProcedimientosCatalogosDAO {
    PreparedStatement pstmt = null;
    Connection cnn ;
    int rtdo;
    ResultSet rs = null;
    String mensaje = "";

    public ProcedimientosCatalogosDAO() {
        
    }

    public ProcedimientosCatalogosDAO(Connection cnx) {
       cnn=cnx;
    }


    public String crearProcedimientosCatalogos( ProcedimientosCatalogosDTO pdto, Connection cnn) {
        this.cnn = cnn;
      {
        try {
            String sqlInsert = "INSERT INTO `smilesystemv2`.`procedimientosCatalogos`"
                    + "(`idCatalogo`,"
                    + "`duracion`,"
                    + "`procedimiento`,"
                    + "VALUES"
                    + "(?, ?, ?);";
            pstmt = cnn.prepareCall(sqlInsert);
            pstmt.setInt(1, pdto.getIdCatalogo());
            pstmt.setInt(2, pdto.getDuracion());
            pstmt.setString(5, pdto.getProcedimiento());
            rtdo = pstmt.executeUpdate();
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
}

           
 public List<ProcedimientosCatalogosDTO> listarTodos(Connection cnn) {
     this.cnn = cnn;
        ArrayList<ProcedimientosCatalogosDTO> proCatalogos = new ArrayList();
        try {
            String sqlAll = "SELECT `procedimientosCatalogos`.`idCatalogo`, "
                    + "`procedimientosCatalogo`.`duracion`,"
                    + "`procedimientosCatalogo`.`procedimiento`"
                    
                    + "FROM `smilesystemv2`.`procedimientosCatalogos`;"
                    + "where 1=1";
            pstmt = cnn.prepareCall(sqlAll);
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                  ProcedimientosCatalogosDTO pdto = new ProcedimientosCatalogosDTO();
                    pdto.setIdCatalogo(rs.getInt("idCatalogo"));
                    pdto.setDuracion(rs.getInt("duracion"));
                    pdto.setProcedimiento(rs.getString("procedimiento"));
                    proCatalogos.add(pdto);
                }
            }
        } catch (SQLException ex) {
            mensaje = "Error, datelle " + ex.getMessage();
        }
        return proCatalogos;
    }
 public ProcedimientosCatalogosDTO obtenerUno(int idCatalogo,Connection cnn) {
     this.cnn = cnn;
       ProcedimientosCatalogosDTO pdto = null;
        String sqlOne = "SELECT `procedimientosCatalogos`.`idCatalogo`, "
                + "`procedimientosCatalogos`.`duracion`,"
                + " `procedimientosCatalogos`.`procedimiento`"
                
                + "FROM `smilesystemv2`.`procedimientosCatalogos` WHERE `idCatalogo` = ?; "
                ;
        try {
            pstmt = cnn.prepareCall(sqlOne);
            pstmt.setInt(1, idCatalogo);
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    pdto = new ProcedimientosCatalogosDTO();
                    pdto.setIdCatalogo(rs.getInt("idCatalogo"));
                    pdto.setDuracion(rs.getInt("duracion"));
                    pdto.setProcedimiento(rs.getString("procedimiento"));
           ;
                }
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }

        return pdto;
    }


    public String eliminarprocedimientosCatalogos(int idCatalogo,Connection cnn) {
        this.cnn = cnn;
        try {
            String sqlDelete = "DELETE FROM `smilesystemv2`.`procedimientosCatalogos`"
                    + " WHERE `procedimientosCatalogos`.`idCatalogo` = ?;";

            pstmt = cnn.prepareCall(sqlDelete);
            pstmt.setInt(1, idCatalogo);
           
            rtdo = pstmt.executeUpdate();
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

   
    public String modificarCita(ProcedimientosCatalogosDTO pdto,Connection cnn) {
        this.cnn = cnn;
        try {
            String sqlUpdate = "UPDATE `smilesystemv2`.`procedimientosCatalogos`"
                    + "SET"
                    + "`duracion= ?," 
                    + "`procedimiento` = ?,"
                    + "WHERE `idCatalogo` = ?;";
            pstmt = cnn.prepareCall(sqlUpdate);
            pstmt.setInt(1, pdto.getDuracion());
            pstmt.setString(1, pdto.getProcedimiento());
            rtdo = pstmt.executeUpdate();
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
