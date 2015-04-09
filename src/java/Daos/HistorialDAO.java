/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.Historial;
import Conexion.Conectar;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HistorialDAO {

    Connection cnn;
    PreparedStatement pstm = null;
    int rtdo;
    ResultSet rs = null;
    CallableStatement cst = null;

    public HistorialDAO() {

    }
    String mensaje = "";

    public HistorialDAO(Connection cnx) {
        cnn = cnx;
    }

    public List ConsultarHistorial(long idProcPac, Connection cnn) {
        this.cnn = cnn;
        ArrayList<Historial> lista = new ArrayList();
        String sqlOne = "select usuarios.nombres, usuarios.apellidos, citas.Fecha "
                + ",jornadas.horario, procedimientoscatalogos.procedimiento, citas.observacion from usuarios "
                + "join odontologos ON usuarios.documento = odontologos.idOdontologo "
                + "join citas ON odontologos.idOdontologo = citas.idOdontologo "
                + "join procedimientos ON citas.idPaciente = procedimientos.idProcPac and citas.Fecha = procedimientos.fechaProcCita "
                + "join procedimientoscatalogos ON procedimientos.idCatalogo = procedimientoscatalogos.idCatalogo "
                + "join estados ON citas.idEstados = estados.idEstado join jornadas ON citas.idJornada= jornadas.idJornada where 1=1" +
"                 order by citas.Fecha desc;";

        try {
            pstm = cnn.prepareStatement(sqlOne);

            rs = pstm.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    Historial ht = new Historial(idProcPac, rs.getString("nombres"), rs.getString("Fecha"), rs.getString("horario"), rs.getString("procedimiento"), rs.getString("observacion"));

                    lista.add(ht);
                }
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }

        return lista;
    }

    public String modificarProcedimiento(String fechaProcCita, long idProcPac, int idCatalogo, String observacion) {
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

    public List<Historial> ConsultarHistorialPa(String nombre, String apellidos, long idpa, Connection cnn) {
        ArrayList<Historial> lista = new ArrayList();
        try {
            StringBuilder sb = new StringBuilder("select usuarios.nombres, usuarios.apellidos, citas.Fecha "
                    + ",jornadas.horario, procedimientoscatalogos.procedimiento, citas.observacion from usuarios "
                    + "join odontologos ON usuarios.documento = odontologos.idOdontologo "
                    + "join citas ON odontologos.idOdontologo = citas.idOdontologo "
                    + "join procedimientos ON citas.idPaciente = procedimientos.idProcPac and citas.Fecha = procedimientos.fechaProcCita "
                    + "join procedimientoscatalogos ON procedimientos.idCatalogo = procedimientoscatalogos.idCatalogo "
                    + "join estados ON citas.idEstados = estados.idEstado join jornadas ON citas.idJornada= jornadas.idJornada ");

            if (nombre != null) {
                sb.append("AND usuarios.nombres LIKE '").append(nombre).append("%'");
            }
            if (apellidos != null) {
                sb.append("AND usuarios.apellidos LIKE '").append(apellidos).append("%'");
            }
            if (idpa != 0) {
                sb.append("AND citas.idPaciente  LIKE '").append(idpa).append("%'");
            }

            sb.append("order by citas.Fecha desc; ");
            pstm = cnn.prepareStatement(sb.toString());
            rs = pstm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    Historial ht = new Historial(idpa, rs.getString("nombres"), rs.getString("Fecha"), rs.getString("horario"), rs.getString("procedimiento"), rs.getString("observacion"));

                    lista.add(ht);
                }
            }
        } catch (SQLException ex) {

        }
        return lista;
    }
}
