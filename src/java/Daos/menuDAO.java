/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Dtos.UsuariosDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;


/**
 *
 * @author USUARIO
 */
public class menuDAO {
private Connection cnn = null;
    public menuDAO(Connection cnx) {
         cnn = cnx;
    }
public HashMap<UsuariosDTO, String> validarUsuario(String usuario, String pss,Connection cnn) {
        this.cnn = cnn;
        PreparedStatement stmt;
        String menu = "<ul>";
        HashMap<UsuariosDTO, String> usuarioValidado = new HashMap<UsuariosDTO, String>();
        UsuariosDTO user = new UsuariosDTO();
        
        ResultSet rs = null;
        try {
            stmt = cnn.prepareStatement("SELECT u.documento, u.nombres,u.tipoDoc,u.apellidos,u.direccion,u.fechadenacimiento,\n"
                    + "                    u.usuario, u.clave,u.genero,u.correo,t.idTelefono  as telefono, u.lugarDeNacimiento, \n"
                    + "                   u.ciudad,p.descripcion as rol,p.idperfil as idrol, p.idperfil, a.descripcion, \n"
                    + "                  a.url, a.idaccion, up.perfilid, pac.idRh as rh, paler.idAlergia as alergia, odon.tarjetaProfesional as tarjeta\n"
                    + "				FROM usuarios u				\n"
                    + "			    LEFT JOIN  pacientes pac on u.documento= pac.idPaciente\n"
                    + "		        LEFT JOIN  pacientealergias paler on pac.idPaciente= paler.idPaciente\n"
                    + "                LEFT JOIN  odontologos odon on u.documento= idOdontologo\n"
                    + "                LEFT JOIN telefonos t on  u.documento = t.documentoid				\n"
                    + "				LEFT JOIN usuariosperfiles up on u.documento = up.usuarioid \n"
                    + "				LEFT JOIN perfiles p ON up.perfilid = p.idperfil\n"
                    + "				LEFT JOIN perfilaccion pa ON p.`idperfil`= pa.`perfilid`\n"
                    + "				LEFT JOIN  acciones a ON pa.`accionid`=a.`idaccion`\n"
                    + "				WHERE u.usuario =?\n"
                    + "				AND clave =?"
                    + "				AND a.parent=0");

            stmt.setString(1, usuario);
            stmt.setString(2, pss);
                    


            rs = stmt.executeQuery();
            if (rs!=null) {
                while (rs.next()) {
                    
                    user.setDocumento(rs.getLong("documento"));
                    user.setNombres(rs.getString("nombres"));
                    user.setApellidos(rs.getString("apellidos"));
                    user.setRol(rs.getString("rol"));
                    user.setRoles(rs.getInt("idrol"));
                    user.setTipoDoc(rs.getString("tipoDoc"));
                    user.setDireccion(rs.getString("direccion"));
                    user.setFechadenacimiento(rs.getString("fechadenacimiento"));
                    user.setUsuario(rs.getString("usuario"));
                    user.setClave(rs.getString("clave"));
                    user.setGenero(rs.getString("genero"));
                    user.setEmail(rs.getString("correo"));
                    user.setLugardeNacimiento(rs.getString("lugarDeNacimiento"));
                    user.setCiudad(rs.getString("ciudad"));
                    user.setTelefono(rs.getString("telefono"));                    
                    user.setGrupoSangui(rs.getInt("rh"));
                    user.setTipoAlergia(rs.getInt("alergia"));
                    user.setTarjetaprofesional(rs.getLong("tarjeta"));
                    
                    
                    
                    menu += "<li>";
                    // menu+="<a href='"+rs.getString("url")+"'>"+rs.getString("descripcion")+"</a>";
                    menu += rs.getString("descripcion");
                    ResultSet rsSub = cnn.prepareStatement("SELECT a.idaccion, a.descripcion, a.url "
                            + " FROM acciones a INNER JOIN perfilaccion pa ON a.idaccion=pa.accionid"
                            + " WHERE parent = " + rs.getInt("idaccion")
                            + " AND pa.perfilid = "+rs.getInt("idperfil")).executeQuery(); 
                                    

                    menu += "<ul>";
                    while (rsSub.next()) {
                        menu += "<li>";
                        menu += "<a href='" + rsSub.getString("Url") + "'>" + rsSub.getString("a.descripcion") + "</a>";
                        menu += "</li>";
                    }

                    menu += "</ul>";
                    menu += "</li>";


                }
                menu += "</ul>";
            }else{
                menu="";
            }
        }catch (SQLException sqle) {

            menu = " error " + sqle.getMessage();

        } finally {
        }usuarioValidado.put (user, menu);

    return usuarioValidado ;
}
    
    
}
