/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

/**
 *
 * @author Sena
 */
public class JornadaDTO {
    
    private int idJornada=0;
    private String horario="";
    
    
      public JornadaDTO() {
        
    }

     public JornadaDTO(int id, String horario){
        this.idJornada = id;
        this.horario=  horario;
    }
    /**
     * @return the idJornada
     */
    public int getIdJornada() {
        return idJornada;
    }

    /**
     * @param idJornada the idJornada to set
     */
    public void setIdJornada(int idJornada) {
        this.idJornada = idJornada;
    }

    /**
     * @return the horario
     */
    public String getHorario() {
        return horario;
    }

    /**
     * @param horario the horario to set
     */
    public void setHorario(String horario) {
        this.horario = horario;
    }

    @Override
    public String toString() {
        return "JornadaDTO{" + "idJornada=" + idJornada + ", horario=" + horario + '}';
    }
    
}
