/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Delegate;

import Conexion.Conectar;
import Dtos.CitaDTO;
import Dtos.EstadoDTO;
import Dtos.JornadaDTO;
import Facade.FCitas;
import Facade.FHistorial;

import java.sql.Connection;
import java.util.List;

/**
 *
 * @author Personal
 */
public class DGestionCitas {
    Connection cnx ;
     FCitas fcitas;
     FHistorial fhistorial;
     public DGestionCitas() {
        
        cnx=  Conectar.getConnection();
        fcitas = new FCitas();
        fhistorial= new FHistorial() ;
        
    }
     public List<CitaDTO>  listaCitas(long idProcPac){
         return fcitas.lisCi();
     }
      public List<EstadoDTO> listaEstados(long idProcPac){
         return fcitas.lisE();
     }
         public List<JornadaDTO> listaJornada(){
         return fcitas.lisJor();
         }
         
}
