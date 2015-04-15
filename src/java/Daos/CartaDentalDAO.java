/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.CartaDentalDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import Conexion.Conectar;

import java.util.ArrayList;

public class CartaDentalDAO {
    PreparedStatement pstmt = null;
    Connection cnn ;
    int rtdo;
    ResultSet rs = null;
    String mensaje = "";

    public CartaDentalDAO() {
       
    }

    public CartaDentalDAO(Connection cnx) {
        cnn=cnx;
   }


    public String crearCarta( CartaDentalDTO cdto,  Connection cnn) {
        
      this.cnn = cnn;
        try {
            String sqlInsert = "INSERT INTO `smilesystemv2`.`cartaDental`"
                    + "(`idCartaDental`,"
                    + "`Descripcion`,"
                    + "VALUES"
                    + "(?, ?);";
            pstmt = cnn.prepareCall(sqlInsert);
            pstmt.setInt(1, cdto.getIdCartaDental());
            pstmt.setString(5, cdto.getDescripcion());
        
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

           
 public ArrayList<CartaDentalDTO> lisporDiente(long  idProcPac, int id ,  Connection cnn ) {
     this.cnn = cnn;
        ArrayList< CartaDentalDTO> cartaDental = new ArrayList();
        try {
            String sqlAll = "select cartadental.idCartaDental , cartadental.Descripcion, procedimientos.fechaProcCita,  procedimientos.observacion, procedimientoscatalogos.procedimiento, cartadental.Estado \n" +
"from procedimientos\n" +
"join procedimientoscatalogos on procedimientos.idCatalogo= procedimientoscatalogos.idCatalogo \n" +
"join cartadental on procedimientos.idCartadental = cartadental.idCartaDental\n" +
"where procedimientos.idProcPac= ?  and cartadental.idCartaDental= ?   order by procedimientos.fechaProcCita desc ;";
            pstmt = cnn.prepareCall(sqlAll);
            pstmt.setLong(1, idProcPac);
            pstmt.setInt(2, id);
            
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                  CartaDentalDTO cdto = new  CartaDentalDTO();
                    cdto.setIdCartaDental(rs.getInt("idCartaDental"));
                    cdto.setDescripcion(rs.getString("Descripcion"));
                    cdto.setFechaProccita(rs.getString("fechaProcCita"));
                    cdto.setProcedimientos(rs.getString("procedimiento"));
                    cdto.setEstado(rs.getInt("Estado"));
                    cdto.setObservacion(rs.getString("observacion"));
                    cartaDental.add(cdto);
                }
            }
        } catch (SQLException ex) {
            mensaje = "Error, datelle " + ex.getMessage();
        }
        return cartaDental;
    }
 public  CartaDentalDTO obtenerUno(int idCartaDental,  Connection cnn) {
     this.cnn = cnn;
        CartaDentalDTO cdto = null;
        String sqlOne = "SELECT `cartaDental`.`idCartaDental`, `cartaDental`.`Descripcion`,"
       
                + "FROM `smilesystemv2`.`cartaDental` WHERE `idCartaDental` = ?; ";
          
        try {
            pstmt = cnn.prepareCall(sqlOne);
            pstmt.setInt(1, idCartaDental);
            
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    cdto = new CartaDentalDTO();
                    cdto.setIdCartaDental(rs.getInt("IdCartaDental"));
                    cdto.setDescripcion(rs.getString("Descripcion"));
           
                }
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }

        return cdto;
    }


    public String eliminarCartaDental(int idCartaDental,  Connection cnn) {
        this.cnn = cnn;
        try {
            String sqlDelete = "DELETE FROM `smilesystemv2`.`cartaDental`"
                    + " WHERE `cartaDental`.`idcartaDental` = ? ;" ;

            pstmt = cnn.prepareCall(sqlDelete);
            pstmt.setInt(1, idCartaDental);
            
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

   
    public String modificarCartaDental(CartaDentalDTO cdto,  Connection cnn) {
        this.cnn = cnn;
        try {
            String sqlUpdate = "UPDATE `smilesystemv2`.`cartaDental`"
                    + "SET"
                    + "`Descripcion` = ?,"
                    + "WHERE `idCarta` = ?;"
                    ;
            pstmt = cnn.prepareCall(sqlUpdate);
            pstmt.setString(1, cdto.getDescripcion());
       

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
    public ArrayList<CartaDentalDTO> listodos(Connection cnn ) {
     this.cnn = cnn;
        ArrayList< CartaDentalDTO> cartaDental = new ArrayList();
        try {
            String sqlAll = "select cartadental.idCartaDental , cartadental.Descripcion from cartadental where 1=1\n" +
"order by idCartaDental asc";
            pstmt = cnn.prepareCall(sqlAll);
           
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                  CartaDentalDTO cdto = new  CartaDentalDTO();
                    cdto.setIdCartaDental(rs.getInt("idCartaDental"));
                    cdto.setDescripcion(rs.getString("Descripcion"));
        
                    cartaDental.add(cdto);
                }
            }
        } catch (SQLException ex) {
            mensaje = "Error, datelle " + ex.getMessage();
        }
        return cartaDental;
    }

}

    
    

