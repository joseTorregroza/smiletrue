package Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class VerificaConexion {
    
   public static void main(String[] args) {
            Connection con= null;
            PreparedStatement stmt ;
	    ResultSet rs ;       
        
            
         
        try {
            con= Conexion.getInstance();  
               // La Query
	        stmt = con.prepareStatement("SELECT nombre, user FROM profesores");
	        rs = stmt.executeQuery();
	   
	        // Recorremos el resultado
                //Encabezad de la tablas a mostrar
                System.out.println ("Nombre "+" User");
                //mientras el apuntador encuentre un elemento en el arreglo (resultset) haga
                //trae cada campo (nombre de la columna) de la consulta
	        while (rs.next())                  
	         outprint(rs.getString("nombre")+"     "+rs.getString("user"));

	      } catch (SQLException sqle) { 
	          outprint("Error en la ejecución sqle:" 
	             + sqle.getErrorCode() + " " + sqle.getMessage());    
	      } catch (Exception e) { 
	           outprint("Error en la ejecución e:" 
	             +  " " + e.getMessage());    
	      }finally{
            
        }
              }

    private static void outprint(String string) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}

    