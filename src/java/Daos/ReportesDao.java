/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Conexion.Conectar;
import Dtos.ReporteNoAssit;
import Dtos.ReporteOdontologo;
import Dtos.ReporteServicioDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Usuario
 */
public class ReportesDao {

    private Connection cnn = null;
    private PreparedStatement pstm = null;
    private ResultSet rs = null;

    public ReportesDao() {
        cnn = Conectar.getConnection();
    }

    public List<ReporteNoAssit> noAsistieron() {
        ArrayList<ReporteNoAssit> noAsistieron = new ArrayList();
        try {
            pstm = cnn.prepareStatement("select usuarios.nombres as Nombres, usuarios.apellidos as Apellidos, count(citas.fecha) as Citas \n"
                    + "from usuarios\n"
                    + "inner join pacientes on usuarios.documento = pacientes.idPaciente\n"
                    + "inner join citas on pacientes.idPaciente = citas.idPaciente\n"
                    + "inner join estados on citas.idEstados = estados.idEstado\n"
                    + "where estados.idEstado = 4 and month(citas.Fecha) =5\n"
                    + "group by usuarios.documento;");
            rs = pstm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    ReporteNoAssit reporte = new ReporteNoAssit();
                    reporte.setNombre(rs.getString("Nombres"));
                    reporte.setApellido(rs.getString("Apellidos"));
                    reporte.setNumero(rs.getInt("Citas"));
                    noAsistieron.add(reporte);
                }
            }
        } catch (SQLException ex) {

        }
        return noAsistieron;
    }

    public List<ReporteOdontologo> AsistieronPaci() {
        ArrayList<ReporteOdontologo> AsistieronPaci = new ArrayList();
        try {
            pstm = cnn.prepareStatement("select concat(usuarios.nombres, \" \", usuarios.apellidos) as Odontologo,\n"
                    + "procedimientoscatalogos.procedimiento as Procedimiento,\n"
                    + "procedimientoscatalogos.idCatalogo as Cantidad,\n"
                    + "concat(monthname(citas.Fecha), \"-\", year(citas.fecha)) as \"Periodo\",\n"
                    + "count(citas.idPaciente) as \"Pacientes\"\n"
                    + "from usuarios\n"
                    + "inner join odontologos on usuarios.documento = odontologos.idOdontologo\n"
                    + "inner join citas on odontologos.idOdontologo = citas.idOdontologo\n"
                    + "inner join procedimientos on (citas.idPaciente = procedimientos.idProcPac and citas.fecha = procedimientos.fechaproccita)\n"
                    + "inner join procedimientoscatalogos on procedimientos.idCatalogo= procedimientoscatalogos.idCatalogo\n"
                    + "inner join estados on citas.idEstados = estados.idEstado\n"
                    + "where citas.idEstados = 1\n"
                    + "group by Odontologo, Periodo;  ");
            rs = pstm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    ReporteOdontologo reporte = new ReporteOdontologo();
                    reporte.setOdontologo(rs.getString("Odontologo"));
                    reporte.setNombreProcedimiento(rs.getString("Procedimiento"));
                    reporte.setCantidad(rs.getInt("Cantidad"));
                    reporte.setPeriodo(rs.getString("Periodo"));
                    reporte.setNumPacientes(rs.getInt("Pacientes"));
                    AsistieronPaci.add(reporte);
                }
            }
        } catch (SQLException ex) {

        }
        return AsistieronPaci;
    }

    public List<ReporteServicioDTO> Servicio() {
        ArrayList<ReporteServicioDTO> Servicio = new ArrayList();
        try {
            pstm = cnn.prepareStatement(" select count(especializaciones.idEspecializacion)as Cantidad, especializaciones.descripcion as Descripcion\n"
                    + "from especializaciones\n"
                    + "order by Cantidad desc\n"
                    + "limit 5; ");
            rs = pstm.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    ReporteServicioDTO reporte = new ReporteServicioDTO();
                    reporte.setCantidad(rs.getInt("Cantidad"));
                    reporte.setDescripcion(rs.getString("Descripcion"));

                    Servicio.add(reporte);
                }
            }
        } catch (SQLException ex) {

        }
        return Servicio;
    }
}
