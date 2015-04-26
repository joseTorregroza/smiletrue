package Daos;

import Dtos.CitaDTO;
import Conexion.Conectar;
import Conexion.MyException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrador
 */
public class CitaDAO {

    Connection cnn;
    PreparedStatement pstm = null;
    int rtdo;
    ResultSet rs = null;
    int estado = 0;

    public CitaDAO() {

    }
    String mensaje = "";

    public CitaDAO(Connection cnx) {
        cnn = cnx;
    }

    public List<CitaDTO> listarTodos(Connection cnn) {
        this.cnn = cnn;
        ArrayList<CitaDTO> citas = new ArrayList<>();
        try {
            String sqlAll = "SELECT fecha, idPaciente, idOdontologo, idEstados, idJornada observacion FROM citas where 1=1";

            pstm = cnn.prepareStatement(sqlAll);
            rs = pstm.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    citas.add(new CitaDTO(rs.getString("fecha"), rs.getInt("idPaciente"), rs.getInt("idOdontologo"), rs.getInt("idEstados"), rs.getInt("idJornada"), rs.getString("observacion")));
                }
            }
        } catch (SQLException ex) {
            mensaje = "Error, datelle " + ex.getMessage();
        }

        return citas;
    }

    public String crearCita(CitaDTO cdto, Connection cnn) {
        this.cnn = cnn;
        try {
            String sqlInsert = "INSERT INTO `smilesystemv2`.`citas`(`fecha`,`idPaciente`,`idOdontologo`,`idEstados`,`idJornada`,`observacion`) VALUES(?,?,?,?,?,?)";

            pstm = cnn.prepareStatement(sqlInsert);
            pstm.setString(1, cdto.getFecha());
            pstm.setLong(2, cdto.getIdPaciente());
            pstm.setLong(3, cdto.getIdOdontologo());
            pstm.setInt(4, cdto.getIdEstados());
            pstm.setInt(5, cdto.getIdJornada());
            pstm.setString(6, cdto.getObservaciones());

            rtdo = pstm.executeUpdate();
            if (rtdo != 0) {
                mensaje = "ok";
            } else {
                mensaje = "no";
            }

        } catch (SQLException sqle) {
            mensaje = sqle.getMessage();
        }
        return mensaje;
    }

    public CitaDTO obtenerUno(String fecha, long idPaciente, Connection cnn) {
        this.cnn = cnn;
        CitaDTO cdto = null;
        String sqlOne = "SELECT fecha, idPaciente, idOdontologo, idEstados,idJornada, observacion FROM citas  WHERE `fecha` = ? and `idPaciente` = ?";
        try {
            pstm = cnn.prepareStatement(sqlOne);
            pstm.setString(1, fecha);
            pstm.setLong(2, idPaciente);
            rs = pstm.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    cdto = new CitaDTO();
                    cdto.setFecha(rs.getString("fecha"));
                    cdto.setIdPaciente(rs.getInt("idPaciente"));
                    cdto.setIdOdontologo(rs.getInt("idOdontologo"));
                    cdto.setIdEstados(rs.getInt("idEstados"));
                    cdto.setIdJornada(rs.getInt("IdJornada"));

                    cdto.setObservaciones(rs.getString("observacion"));

                }
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }

        return cdto;
    }

    public String modificarCita(String fecha, long idPaciente, int idEstado, String observacion, Connection cnn) {
        this.cnn = cnn;
        try {
            String sqlUpdate = "UPDATE  `smilesystemv2`.`citas`SET `IdEstado` = ?"
                    + ",`observacion` = ? from citas INNER JOIN estados ON citas.idEstado= estados.idEstados"
                    + " WHERE `fecha` = ? and `idPaciente` = ?";
            pstm = cnn.prepareStatement(sqlUpdate);
            pstm.setInt(1, idEstado);
            pstm.setString(2, observacion);
            pstm.setString(3, fecha);
            pstm.setLong(4, idPaciente);

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

    public String cancelarCita(long idpa, String fecha, Connection cnn) {
        this.cnn = cnn;

        CallableStatement cstm;
        try {
            cstm = cnn.prepareCall("{call cancelarCita(?,?,?) }");
            cstm.setLong(1, idpa);
            cstm.setString(2, fecha);
            cstm.registerOutParameter(3, Types.INTEGER);
            cstm.execute();
            int salida = cstm.getInt(3);
            if (salida == 1) {
                mensaje = "ok";
            } else if (salida == 2) {
                mensaje = "no";
            } else {
                mensaje = "Ningun cambio";
            }

        } catch (SQLException ex) {
            mensaje = "Error: " + ex.getMessage();
        }

        return mensaje;
    }

    public int validarCitas(long perid , Connection cnn) {
    this.cnn = cnn;
        try {

            pstm = cnn.prepareStatement("select count(citas.idEstados) "
                    + "       from citas "
                    + "	      where citas.idPaciente= ? and citas.idEstados=4;");
            pstm.setLong(1, perid);

            rs = pstm.executeQuery();

            if (rs != null) {
                while (rs.next()) {

                    estado = (rs.getInt("count(citas.idEstados)"));

                }
            } else {
                mensaje = " el usuario no existe";
            }

        } catch (SQLException ex) {
            try {
                throw new MyException(" Datos errones. Revise!");
            } catch (MyException ex1) {
                Logger.getLogger(CitaDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }

        return estado;
    }
    public CitaDTO obtCita(long idPaciente, Connection cnn) {
        this.cnn = cnn;
        CitaDTO cdto = null;
        String sqlOne = "SELECT citas.fecha, citas.idPaciente, citas.idOdontologo, citas.idEstados,jornadas.horario, citas.observacion"
                + " FROM citas "
                + "join jornadas on citas.idJornada=jornadas.idJornada WHERE idEstados=2 and idPaciente= ?";
        try {
            pstm = cnn.prepareStatement(sqlOne);
            pstm.setLong(1, idPaciente);
            rs = pstm.executeQuery(); 
 
            if (rs != null) {
                while (rs.next()) {
                    cdto = new CitaDTO();
                    cdto.setFecha(rs.getString("fecha"));
                    cdto.setIdPaciente(rs.getInt("idPaciente"));
                    cdto.setIdOdontologo(rs.getInt("idOdontologo"));
                    cdto.setIdEstados(rs.getInt("idEstados"));
                   
                    cdto.setJornada(rs.getString("horario"));
                    cdto.setObservaciones(rs.getString("observacion"));

                }
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }

        return cdto;
    }
        public String Noasistio(Connection cnn) {
        this.cnn = cnn;

        CallableStatement cstm;
        try {
            cstm = cnn.prepareCall("{call sp_NoAsiste(?)}");
            
            
            cstm.registerOutParameter(1, Types.INTEGER);
            cstm.execute();
            int salida = cstm.getInt(1);
            if (salida == 1) {
                mensaje = "ok";
            } else if (salida == 2) {
                mensaje = "no";
            } else {
                mensaje = "Ningun cambio";
            }

        } catch (SQLException ex) {
            mensaje = "Error: " + ex.getMessage();
        }

        return mensaje;
    }
          public String estadoCita(long idpa, String fecha, Connection cnn) {
        this.cnn = cnn;

        CallableStatement cstm;
        try {
            cstm = cnn.prepareCall("{call sp_estadocita(?,?,?) }");
            cstm.setString(1, fecha);
            cstm.setLong(2, idpa);
           
            cstm.registerOutParameter(3, Types.INTEGER);
            cstm.execute();
            int salida = cstm.getInt(3);
            if (salida == 1) {
                mensaje = "ok";
            } else if (salida == 2) {
                mensaje = "no";
             
             } else if (salida == 3) {
                mensaje = "ok 48";
             } else if (salida == 4) {
                mensaje = "no 48";
            }  else {
                mensaje = "Ningun cambio";
            }

        } catch (SQLException ex) {
            mensaje = "Error: " + ex.getMessage();
        }

        return mensaje;
    }

}
