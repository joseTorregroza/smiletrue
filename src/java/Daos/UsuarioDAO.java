package Daos;

import Conexion.MyException;
import Dtos.UsuariosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import Conexion.MyException;
import java.sql.*;
import java.util.LinkedList;
import java.util.Random;

/**
 *
 * @author Administrador
 */
public class UsuarioDAO {

    private Connection cnn = null;
    PreparedStatement pstmt = null;
    int rtdo;
    ResultSet rs = null;
    String sqlTemp = "";

    public UsuarioDAO() {

    }
    String mensaje = "";

    public UsuarioDAO(Connection cnx) {
        cnn = cnx;
    }

    public List<UsuariosDTO> listarTodos(Connection cnn) {
        this.cnn = cnn;

        ArrayList<UsuariosDTO> usuario = new ArrayList<UsuariosDTO>();
        try {
            String sqlAll = "SELECT   documento, tipoDoc,nombres, apellidos, direccion, fechadenacimiento,usuario, clave,genero, correo,lugarDeNacimiento, ciudad   FROM usuarios where 1=1";

            pstmt = cnn.prepareStatement(sqlAll);
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    //  usuario.add( new UsuariosDTO(rs.getLong("documento") ,rs.getString("tipoDoc"),rs.getString("nombres"), rs.getString("apellidos"), rs.getString("grupoSangui"), rs.getString("tipoAlergia"),rs.getString("fechadenacimiento"), rs.getString("lugarDeNacimiento"),rs.getString("correo"),rs.getString("telefono") ,rs.getString("direccion"), rs.getString("ciudad"), rs.getString("genero")));
                }
            }
        } catch (SQLException ex) {
            mensaje = "Error, datelle " + ex.getMessage();
        }

        return usuario;
    }

    public String crearUsuario(UsuariosDTO odto, Connection cnn) {
        this.cnn = cnn;
        CallableStatement cstm;
        // recibe usuario, retorna entero 1: exitoso, 2: fallo;
        try {

            cstm = cnn.prepareCall("{call ProceRegistrarUsuarios(?,?,?,?,?,?,?,?,?,?,?,?,?,?) }");

            cstm.setLong(1, odto.getDocumento());
            cstm.setString(2, odto.getTipoDoc());
            cstm.setString(3, odto.getNombres());
            cstm.setString(4, odto.getApellidos());
            cstm.setString(5, odto.getDireccion());
            cstm.setString(6, odto.getFechadenacimiento());
            cstm.setString(7, odto.getGenero());
            cstm.setString(8, odto.getEmail());
            cstm.setString(9, odto.getLugardeNacimiento());
            cstm.setString(10, odto.getCiudad());
            cstm.setString(11, odto.getTelefono());
            cstm.setInt(12, odto.getGrupoSangui());
            cstm.setInt(13, odto.getTipoAlergia());
            cstm.registerOutParameter(14, Types.INTEGER);
            cstm.execute();
            int salida = cstm.getInt(14);
            if (salida == 1) {
                mensaje = "ok";
            } else if (salida == 2) {
                mensaje = "no";
            } else {
                mensaje = "Ningun cambio";
            }

        } catch (SQLException sqle) {
            mensaje = " " + sqle.getMessage() + " - error: " + sqle.getSQLState() + " ";
        } catch (NullPointerException np) {
            mensaje = "no se encuentra:  " + np + "  " + np.getLocalizedMessage();
        }

        return mensaje;
    }

    public String crearAdmi(UsuariosDTO odto, Connection cnn) {
        this.cnn = cnn;
        CallableStatement cstm;
        // recibe usuario, retorna entero 1: exitoso, 2: fallo;
        try {
         
            
            cstm = cnn.prepareCall("{call ProceRegistrarAdministrador(?,?,?,?,?,?,?,?,?,?,?,?,?,?) }");

            cstm.setLong(1, odto.getDocumento());
            cstm.setString(2, odto.getTipoDoc());
            cstm.setString(3, odto.getNombres());
            cstm.setString(4, odto.getApellidos());
            cstm.setString(5, odto.getDireccion());
            cstm.setString(6, odto.getFechadenacimiento());
            cstm.setString(7, odto.getGenero());
            cstm.setString(8, odto.getEmail());
            cstm.setString(9, odto.getLugardeNacimiento());
            cstm.setString(10, odto.getCiudad());
            cstm.setString(11, odto.getTelefono());
            cstm.setInt(12, odto.getRoles());
            cstm.setLong(13, odto.getTarjetaprofesional());
            cstm.registerOutParameter(14, Types.INTEGER);
            cstm.execute();
            int salida = cstm.getInt(14);
            if (salida == 1) {
                mensaje = "ok";
            } else if (salida == 2) {
                mensaje = "no";
            } else {
                mensaje = "Ningun cambio";
            }

        } catch (SQLException sqle) {
            mensaje = " " + sqle.getMessage() + " - error: " + sqle.getSQLState() + " ";
        } catch (NullPointerException np) {
            mensaje = "no se encuentra:  " + np + "  " + np.getLocalizedMessage();
        }

        return mensaje;
    }

    public UsuariosDTO obtenerUno(long id, Connection cnn) {
        this.cnn = cnn;

        UsuariosDTO odto = new UsuariosDTO();

        try {
            String sqlOne = "SELECT  nombres, apellidos , tipoDoc, fechadenacimiento, lugarDeNacimiento, correo,direccion,  ciudad , genero,usuario, clave FROM usuarios WHERE documento = ?";
            pstmt = cnn.prepareStatement(sqlOne);
            pstmt.setLong(1, id);
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    odto.setDocumento(id);
                    odto.setNombres(rs.getString("nombres"));
                    odto.setApellidos(rs.getString("apellidos"));
                    odto.setTipoDoc(rs.getString("tipoDoc"));
                    odto.setFechadenacimiento(rs.getString("fechadenacimiento"));
                    odto.setLugardeNacimiento(rs.getString("lugarDeNacimiento"));
                    odto.setEmail(rs.getString("correo"));
                    odto.setDireccion(rs.getString("direccion"));
                    odto.setCiudad(rs.getString("ciudad"));
                    odto.setGenero(rs.getString("genero"));
                    odto.setUsuario(rs.getString("usuario"));
                    odto.setClave("clave");
                }
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }

        return odto;
    }

    public UsuariosDTO listarUno(long id, Connection cnn) {
        this.cnn = cnn;

        UsuariosDTO odto = new UsuariosDTO();

        try {
            String sqlOne = "SELECT \n"
                    + "                        us.nombres as nombres,\n"
                    + "                        us.apellidos as apellidos,\n"
                    + "                        us.tipoDoc as tipoDoc,\n"
                    + "                        us.fechadenacimiento as fechadenacimiento,\n"
                    + "                        us.lugarDeNacimiento as lugarDeNacimiento,\n"
                    + "                        us.correo as correo,\n"
                    + "                        us.direccion as direccion,\n"
                    + "                        us.ciudad as ciudad,\n"
                    + "                        us.genero as genero,\n"
                    + "                       us.usuario as usuario,\n"
                    + "                       us.clave as clave,\n"
                    + "                        te.idTelefono as Telefono,\n"
                    + "                        paci.idRh  as rh,\n"
                    + "		pacale.idAlergia as alergia,\n"
                    + "                    	per.perfilid as rol,\n"
                    + "                       p.descripcion as rolnom\n"
                    + "                    FROM\n"
                    + "                        usuarios us\n"
                    + "                            inner join\n"
                    + "                        telefonos te ON us.documento = te.documentoid\n"
                    + "                            inner join\n"
                    + "                        pacientes paci ON us.documento = paci.idPaciente\n"
                    + "                            inner join \n"
                    + "				        pacientealergias pacale on paci.idPaciente= pacale.idPaciente\n"
                    + "					        inner join \n"
                    + "                       usuariosperfiles per ON us.documento= per.usuarioid\n"
                    + "                            inner join \n"
                    + "                    	perfiles p ON  per.perfilid= p.idperfil\n"
                    + "                    WHERE\n"
                    + "                        us.documento = ?";
            pstmt = cnn.prepareStatement(sqlOne);
            pstmt.setLong(1, id);
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {                    
                    odto.setNombres(rs.getString("nombres"));
                    odto.setApellidos(rs.getString("apellidos"));
                    odto.setTipoDoc(rs.getString("tipoDoc"));
                    odto.setFechadenacimiento(rs.getString("fechadenacimiento"));
                    odto.setLugardeNacimiento(rs.getString("lugarDeNacimiento"));
                    odto.setEmail(rs.getString("correo"));
                    odto.setDireccion(rs.getString("direccion"));
                    odto.setCiudad(rs.getString("ciudad"));
                    odto.setGenero(rs.getString("genero"));
                    odto.setUsuario(rs.getString("usuario"));
                    odto.setClave(rs.getString("clave"));
                    odto.setTelefono(rs.getString("Telefono"));
                     odto.setGrupoSangui(rs.getInt("rh"));   
                    odto.setTipoAlergia(rs.getInt("alergia"));                                    
                    odto.setRoles(rs.getInt("rol"));
                    odto.setRol(rs.getString("rolnom"));
                    odto.setDocumento(id);
                }
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }

        return odto;
    }
    
     public UsuariosDTO listarUnoAdmi(long id, Connection cnn) {
        this.cnn = cnn;

        UsuariosDTO odto = new UsuariosDTO();
        try {
            String sqlOne = "SELECT    us.nombres as nombres,  us.apellidos as apellidos,   us.tipoDoc as tipoDoc,\n"
                    + "  us.fechadenacimiento as fechadenacimiento,  us.lugarDeNacimiento as lugarDeNacimiento,\n"
                    + " us.correo as correo,   us.direccion as direccion,    us.ciudad as ciudad,\n"
                    + "  us.genero as genero,   us.clave as clave,   te.idTelefono as Telefono, \n"
                    + " 	odon.tarjetaProfesional  as tarjeta ,   	per.perfilid as rol,\n"
                    + " p.descripcion as rolnom\n"
                    + "   FROM\n"
                    + "                                       usuarios us\n"
                    + "                                               inner join\n"
                    + "                                            telefonos te ON us.documento = te.documentoid\n"
                    + "                                                inner join    \n"
                    + "                                         odontologos odon   on us.documento= odon.idOdontologo\n"
                    + "                    	              inner join \n"
                    + "                                           usuariosperfiles per ON us.documento= per.usuarioid\n"
                    + "                                                inner join \n"
                    + "                                        	perfiles p ON  per.perfilid= p.idperfil\n"
                    + "                                       WHERE\n"
                    + "                                            us.documento =?;";
            pstmt = cnn.prepareStatement(sqlOne);
            pstmt.setLong(1, id);
            rs = pstmt.executeQuery();

            if (rs != null) {
                while (rs.next()) {                    
                    odto.setNombres(rs.getString("nombres"));
                    odto.setApellidos(rs.getString("apellidos"));
                    odto.setTipoDoc(rs.getString("tipoDoc"));
                    odto.setFechadenacimiento(rs.getString("fechadenacimiento"));
                    odto.setLugardeNacimiento(rs.getString("lugarDeNacimiento"));
                    odto.setEmail(rs.getString("correo"));
                    odto.setDireccion(rs.getString("direccion"));
                    odto.setCiudad(rs.getString("ciudad"));
                    odto.setGenero(rs.getString("genero"));                   
                    odto.setClave(rs.getString("clave"));
                    odto.setTelefono(rs.getString("Telefono"));
                     odto.setTarjetaprofesional(rs.getLong("tarjeta"));                                                      
                    odto.setRoles(rs.getInt("rol"));
                    odto.setRol(rs.getString("rolnom"));
                    odto.setDocumento(id);
                }
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }

        return odto;
    }


    public String eliminarUsuario(long id, Connection cnn) {
        this.cnn = cnn;
        try {
            String sqlDelete = "DELETE FROM `smilesystemv2`.`usuarios` WHERE `usuarios`.`documento` = ?";

            pstmt = cnn.prepareStatement(sqlDelete);
            pstmt.setLong(1, id);
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

    public String modificarAdmi(UsuariosDTO usdto, Connection cnn) throws SQLException {
        this.cnn = cnn;
        String fuera = "";
        int res = 0;
        try {
            pstmt = cnn.prepareStatement("Update usuarios us"
                    + "        inner join"
                    + "    telefonos te ON us.documento = te.documentoid"
                    + "        inner join"
                    + "    odontologos odon ON us.documento = odon.idOdontologo"
                    + "        inner join"
                    + "    usuariosperfiles per ON us.documento = per.usuarioid "
                    + "SET "
                    + "    us.nombres = ?"
                    + "    us.apellidos =?"
                    + "    us.tipoDoc = ?"
                    + "    us.fechadenacimiento = ?"
                    + "    us.lugarDeNacimiento =?"
                    + "    us.correo =?"
                    + "    us.direccion =?"
                    + "    us.ciudad =?"
                    + "    us.genero =?"                   
                    + "    us.clave = ?"
                    + "    te.idTelefono =?"
                    + "    odon.tarjetaProfesional =?"
                    + "    per.perfilid = ?"
                    + "WHERE"
                    + "    us.documento = ?;");
            pstmt.setString(1, usdto.getNombres());
            pstmt.setString(2, usdto.getApellidos());
            pstmt.setString(3, usdto.getTipoDoc());
            pstmt.setString(4, usdto.getFechadenacimiento());
            pstmt.setString(5, usdto.getLugardeNacimiento());
            pstmt.setString(6, usdto.getEmail());
            pstmt.setString(7, usdto.getDireccion());
            pstmt.setString(8, usdto.getCiudad());
            pstmt.setString(9, usdto.getGenero());       
            pstmt.setString(10, usdto.getClave());
            pstmt.setString(11, usdto.getTelefono());
            pstmt.setLong(12, usdto.getTarjetaprofesional());
            pstmt.setInt(13, usdto.getRoles());
            pstmt.setLong(14, usdto.getDocumento());

            res = pstmt.executeUpdate();
            if (res != 0) {
                fuera = "Perfil actualizado";
            } else {
                fuera = "Error al actualizar   el perfil";
            }
        } catch (SQLException sqle) {
            System.out.println("Error en la base de datos" + sqle.getSQLState() + "y" + sqle.getMessage());
        }
        return fuera;
    }

    public String modfificarUsuario(UsuariosDTO usdto, Connection cnn) {
        this.cnn = cnn;
        String fuera = "";
        int res = 0;
        try {
            pstmt = cnn.prepareStatement("Update usuarios us\n"
                    + "			inner join   telefonos te ON us.documento = te.documentoid\n"
                    + "          inner join    pacientes pa ON us.documento = pa.idPaciente\n"
                    + "		inner join     pacientealergias paler ON pa.idPaciente = paler.idPaciente \n"
                    + "                                       SET \n"
                    + "                                            us.nombres = ?,\n"
                    + "                                             us.apellidos =?,\n"
                    + "                                            us.tipoDoc = ?,\n"
                    + "                    	            us.fechadenacimiento = ?,\n"
                    + "                                            us.lugarDeNacimiento =?,\n"
                    + "                    	          us.correo =?,\n"
                    + "                                            us.direccion =?,\n"
                    + "                                                us.ciudad =?,\n"
                    + "                                           us.genero =?,                 \n"
                    + "                                            us.clave = ?,\n"
                    + "                                            te.idTelefono =?,\n"
                    + "                                            pa.idRh=?,\n"
                    + "                                            paler.idAlergia=?                \n"
                    + "                                        WHERE\n"
                    + "                                           us.documento = ?;");
            pstmt.setString(1, usdto.getNombres());
            pstmt.setString(2, usdto.getApellidos());
            pstmt.setString(3, usdto.getTipoDoc());
            pstmt.setString(4, usdto.getFechadenacimiento());
            pstmt.setString(5, usdto.getLugardeNacimiento());   
             pstmt.setString(6, usdto.getEmail());
             pstmt.setString(7, usdto.getDireccion());
            pstmt.setString(8, usdto.getCiudad());
            pstmt.setString(9, usdto.getGenero());             
            pstmt.setString(10, usdto.getClave());
            pstmt.setString(11, usdto.getTelefono());
            pstmt.setInt(13, usdto.getGrupoSangui());
              pstmt.setInt(12, usdto.getTipoAlergia());            
            pstmt.setLong(14, usdto.getDocumento());

            res = pstmt.executeUpdate();
            if (res != 0) {
                fuera = "Perfil actualizado";
            } else {
                fuera = "Error al actualizar   el perfil";
            }
        } catch (SQLException sqle) {
            System.out.println("Error en la base de datos" + sqle.getSQLState() + "y" + sqle.getMessage());
        }
        return fuera;
    }

    public long checkUser(long cedula, Connection cnn) {
        this.cnn = cnn;

        long validada = 0;
        try {
            pstmt = cnn.prepareStatement("SELECT documento FROM usuarios WHERE documento = ?;");
            pstmt.setLong(1, cedula);
            rs = pstmt.executeQuery();
            if (rs != null) {
                UsuariosDTO PDTO = new UsuariosDTO();
                while (rs.next()) {
                    PDTO.setDocumento(rs.getLong("idPersona"));
                }
                validada = PDTO.getDocumento();
            }
        } catch (SQLException ex) {
            mensaje = "Error: " + ex.getMessage();
        }

        return validada;
    }

    public boolean modificarUsuMail(Long clave, long id, Connection cnn) {
        this.cnn = cnn;
        boolean salida = false;
        try {
            pstmt = cnn.prepareStatement("update  usuarios  set clave =? where documento = ?");
            pstmt.setLong(1, clave);
            pstmt.setLong(2, id);
            int valor = pstmt.executeUpdate();
            if (valor > 0) {
                salida = true;
            } else {
                salida = false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return salida;
    }

    public List<UsuariosDTO> listarPacinetes(String nombre, String apellidos, long idpa, Connection cnn) {
        ArrayList<UsuariosDTO> usuarios = new ArrayList();
        try {
            StringBuilder sb = new StringBuilder("SELECT   usuarios.documento, tipoDoc,usuarios.nombres, usuarios.apellidos, direccion, fechadenacimiento,usuario, clave,genero, correo,lugarDeNacimiento, ciudad , usuariosperfiles.perfilid "
                    + "FROM usuarios "
                    + "join usuariosperfiles on usuariosperfiles.usuarioid=usuarios.documento where usuariosperfiles.perfilid=1 ");

            if (nombre != null) {
                sb.append("AND nombres LIKE '").append(nombre).append("%'");
            }
            if (apellidos != null) {
                sb.append("AND apellidos LIKE '").append(apellidos).append("%'");
            }
            if (idpa != 0) {
                sb.append("AND documento  LIKE '").append(idpa).append("%'");
            }

            sb.append("order by apellidos desc; ");
            pstmt = cnn.prepareStatement(sb.toString());
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    UsuariosDTO usuario = new UsuariosDTO();
                    usuario.setDocumento(rs.getLong("documento"));
                    usuario.setNombres(rs.getString("nombres"));
                    usuario.setApellidos(rs.getString("apellidos"));
                    usuario.setDireccion(rs.getString("direccion"));
                    usuario.setFechadenacimiento(rs.getString("fechadenacimiento"));
                    usuario.setUsuario(rs.getString("usuario"));
                    usuario.setGenero(rs.getString("genero"));
                    usuario.setEmail(rs.getString("correo"));
                    usuario.setLugardeNacimiento(rs.getString("lugardenacimiento"));
                    usuario.setCiudad(rs.getString("ciudad"));
                    usuarios.add(usuario);
                }
            }
        } catch (SQLException ex) {

        }
        return usuarios;
    }

    public List<UsuariosDTO> listarOdontologos(Connection cnn) {
        ArrayList<UsuariosDTO> usuarios = new ArrayList();
        try {
            String sql = ("SELECT   usuarios.documento, tipoDoc,usuarios.nombres, usuarios.apellidos, direccion, fechadenacimiento,usuario, clave,genero, correo,lugarDeNacimiento, ciudad , usuariosperfiles.perfilid "
                    + "FROM usuarios "
                    + "join usuariosperfiles on usuariosperfiles.usuarioid=usuarios.documento where usuariosperfiles.perfilid=2 order by apellidos desc; ");
            pstmt = cnn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    UsuariosDTO usuario = new UsuariosDTO();
                    usuario.setDocumento(rs.getLong("documento"));
                    usuario.setNombres(rs.getString("nombres"));
                    usuario.setApellidos(rs.getString("apellidos"));
                    usuario.setDireccion(rs.getString("direccion"));
                    usuario.setFechadenacimiento(rs.getString("fechadenacimiento"));
                    usuario.setUsuario(rs.getString("usuario"));
                    usuario.setGenero(rs.getString("genero"));
                    usuario.setEmail(rs.getString("correo"));
                    usuario.setLugardeNacimiento(rs.getString("lugardenacimiento"));
                    usuario.setCiudad(rs.getString("ciudad"));
                    usuarios.add(usuario);
                }
            }
        } catch (SQLException ex) {

        }
        return usuarios;
    }

    public List<UsuariosDTO> ObtOdontologos(Connection cnn, long id) {
        ArrayList<UsuariosDTO> usuarios = new ArrayList();
        try {
            String sql = ("SELECT   usuarios.documento, tipoDoc,usuarios.nombres, usuarios.apellidos, direccion, fechadenacimiento,usuario, clave,genero, correo,lugarDeNacimiento, ciudad , usuariosperfiles.perfilid "
                    + "FROM usuarios "
                    + "join usuariosperfiles on usuariosperfiles.usuarioid=usuarios.documento where usuariosperfiles.perfilid=2 and  usuarios.documento=? order by apellidos desc; ");
            pstmt = cnn.prepareStatement(sql);
            pstmt.setLong(1, id);
            rs = pstmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    UsuariosDTO usuario = new UsuariosDTO();
                    usuario.setDocumento(rs.getLong("documento"));
                    usuario.setNombres(rs.getString("nombres"));
                    usuario.setApellidos(rs.getString("apellidos"));
                    usuario.setDireccion(rs.getString("direccion"));
                    usuario.setFechadenacimiento(rs.getString("fechadenacimiento"));
                    usuario.setUsuario(rs.getString("usuario"));
                    usuario.setGenero(rs.getString("genero"));
                    usuario.setEmail(rs.getString("correo"));
                    usuario.setLugardeNacimiento(rs.getString("lugardenacimiento"));
                    usuario.setCiudad(rs.getString("ciudad"));
                    usuarios.add(usuario);
                }
            }
        } catch (SQLException ex) {

        }
        return usuarios;
    }

    public String obtenerCorreoPorId(long usuaerioid, Connection cnn) {
        this.cnn = cnn;
         sqlTemp = "SELECT `correo` FROM `usuarios` WHERE  `documento` = ?";
        try {
            pstmt = cnn.prepareStatement(sqlTemp);
            pstmt.setLong(1, usuaerioid);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                mensaje = rs.getString("correo");
            }

        } catch (SQLException ex) {
            mensaje = "Error, detalle: " + ex.getMessage();
        }
        return mensaje;
    }

    public List obtenerPersonas(Connection cnn) {
        ArrayList<UsuariosDTO> usuario = null;
        String sqlTemp = "SELECT documento , nombres, apellidos ,  correo, ActivarCorreo  FROM usuarios";
        try {
            pstmt = cnn.prepareStatement(sqlTemp);
            rs = pstmt.executeQuery();

            usuario = new ArrayList();
            while (rs.next()) {
                UsuariosDTO odto = new UsuariosDTO();
                odto.setDocumento(rs.getLong("documento"));                 
                odto.setNombres(rs.getString("nombres"));
                odto.setApellidos(rs.getString("apellidos"));                   
                odto.setEmail(rs.getString("correo"));            
                 odto.setActivarestado(rs.getInt("ActivarCorreo"));              
                
                usuario.add(odto);
            }

        } catch (SQLException ex) {
            System.out.println("Error, detalle: " + ex.getMessage());
        }
        return usuario;
    }
    
        public String cambiarestado(int personaID, int nuevoEstado, Connection cnn) {
             this.cnn = cnn;
        try {
            String sqlInsert = "UPDATE `usuarios` SET `estado` = ? WHERE `documento` = ?";
            pstmt = cnn.prepareStatement(sqlInsert);

            pstmt.setInt(1, nuevoEstado);
            pstmt.setInt(2, personaID);

            rtdo = pstmt.executeUpdate();
            if (rtdo != 0) {
                mensaje = "ok";
            } else {
                mensaje = "okno";
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }
        return mensaje;
    }
        
        public List<UsuariosDTO> ListarTodisUsuarios(Connection cnn) throws MyException, SQLException {
        LinkedList<UsuariosDTO> listarusuarios = new LinkedList<UsuariosDTO>();
        try {


            String query = "SELECT   us.documento as documento,    us.tipoDoc as tipoDoc,us.nombres as nombres,  us.apellidos as apellidos, \n"
                    + "us.fechadenacimiento as fechadenacimiento,  us.lugarDeNacimiento as lugarDeNacimiento,\n"
                    + "us.correo as correo,   us.direccion as direccion,    us.ciudad as ciudad,\n"
                    + "us.genero as genero,   us.clave as clave,   te.idTelefono as Telefono, \n"
                    + "paci.idRh  as rh,   pacale.idAlergia as alergia,\n"
                    + " 	odon.tarjetaProfesional  as tarjeta ,   	per.perfilid as rol,\n"
                    + "p.descripcion as rolnom\n"
                    + "                                        FROM\n"
                    + "                                       usuarios us\n"
                    + "				left join\n"
                    + "				telefonos te ON us.documento = te.documentoid\n"
                    + "				left join  \n"
                    + "				 pacientes paci ON us.documento = paci.idPaciente\n"
                    + "				left join \n"
                    + "				pacientealergias pacale on paci.idPaciente= pacale.idPaciente\n"
                    + "				left join\n"
                    + "				odontologos odon   on us.documento= odon.idOdontologo\n"
                    + "				left join \n"
                    + "				usuariosperfiles per ON us.documento= per.usuarioid\n"
                    + "				left join \n"
                    + "				perfiles p ON  per.perfilid= p.idperfil;";
            pstmt = cnn.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                UsuariosDTO odto = new UsuariosDTO();  
                 odto.setDocumento(rs.getLong("documento"));
                 odto.setTipoDoc(rs.getString("tipoDoc"));
                     odto.setNombres(rs.getString("nombres"));
                    odto.setApellidos(rs.getString("apellidos"));  
                      odto.setDireccion(rs.getString("direccion"));
                    odto.setFechadenacimiento(rs.getString("fechadenacimiento"));
                     odto.setUsuario(rs.getString("usuario"));
                    odto.setClave(rs.getString("clave"));
                    odto.setGenero(rs.getString("genero"));                     
                    odto.setEmail(rs.getString("correo"));
                    odto.setLugardeNacimiento(rs.getString("lugarDeNacimiento"));                    
                    odto.setCiudad(rs.getString("ciudad"));
                    odto.setActivarestado(rs.getInt(" ActivarCorreo"));      
                    odto.setTelefono(rs.getString("Telefono"));
                    odto.setGrupoSangui(rs.getInt("rh"));   
                    odto.setTipoAlergia(rs.getInt("alergia"));  
                     odto.setTarjetaprofesional(rs.getLong("tarjeta"));                                                      
                    odto.setRoles(rs.getInt("rol"));
                    odto.setRol(rs.getString("rolnom"));
                   
                listarusuarios.add(odto);
                
            }
        } catch (SQLException ex) {
            throw new MyException("Error al listar los elementos "+ex.getSQLState()+" - "+ex.getMessage());
        }finally{
            pstmt.close();
        }

        return listarusuarios;
    }
    

}
