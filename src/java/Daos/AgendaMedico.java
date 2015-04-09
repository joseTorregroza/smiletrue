/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;
import Dtos.AgendaMedicoDTO;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Personal
 */
public class AgendaMedico {
    
     private Connection cnn ;
      PreparedStatement pstm = null;
      int rtdo;
      ResultSet rs = null;
      CallableStatement cst= null;
       public AgendaMedico (){
          
      }
      String mensaje = "";

    public AgendaMedico(Connection cnx) {
        cnn =cnx;
    }
      
     
     public ArrayList<AgendaMedicoDTO> ConsultarAgenda( long  idOdontologo, Connection cnn) {
          this.cnn = cnn;
        ArrayList<AgendaMedicoDTO> lista = new ArrayList();
        String sqlOne =   "  select  uo.nombres, uo.apellidos , up.nombres, up.apellidos ,citas.idPaciente , jornadas.horario,  " +
"       citas.Fecha,Estados.Descripcion " +
"       from citas" +
"       join jornadas ON citas.idJornada = jornadas.idJornada" +
"       join estados ON citas.idEstados = estados.idEstado" +
"       " +
"       " +
"       join pacientes ON citas.idPaciente = pacientes.idPaciente" +
"       join odontologos ON citas.idOdontologo = odontologos.idOdontologo" +
"       join usuarios uo ON uo.documento = odontologos.idOdontologo" +
"       join usuarios up ON up.documento = pacientes.idPaciente" +
"       where       citas.idEstados = 2  and citas.fecha >= date(now()) and odontologos.idOdontologo= ?  order by citas.Fecha asc";
          
             try { 
                 pstm = cnn.prepareStatement(sqlOne);
                 pstm.setLong (1, idOdontologo);
                 rs = pstm.executeQuery();
                 
            if (rs != null) {
                while (rs.next()) {
                   AgendaMedicoDTO  ht  = new AgendaMedicoDTO(idOdontologo, rs.getString("up.nombres"), rs.getString("up.apellidos"), rs.getString("idPaciente"), rs.getString("Fecha"),rs.getString("horario"),rs.getString("Descripcion"));
                    
                    lista.add(ht);
                }
            }
        } catch (SQLException sqle) {
            mensaje = "Error, detalle " + sqle.getMessage();
        }
         

        return lista ;
    } 


    
}
