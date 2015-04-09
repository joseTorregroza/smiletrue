/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dtos;

/**
 *
 * @author Personal
 */
public class CitaDTO {
    
        private String fecha="";
        private long  idPaciente=0;
        private long  idOdontologo=0;
        private int idEstados=0;
        private int idJornada=0;
        private String observacion="";
        private String jornada="";
        

    public CitaDTO(String fecha, long  idPaciente, long  idOdontologo, int idEstados, int idJornada, String observacion) {
        this.fecha= fecha;
        this.idPaciente= idPaciente;
        this.idOdontologo= idOdontologo;
        this.idEstados= idEstados;
        this.idJornada= idJornada;
        this.observacion= observacion;
        
    }

    public CitaDTO() {
      
    }
    /**
     * @return the fecha
     */
    public String getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(String  fecha) {
        this.fecha = fecha;
    }

    /**
     * @return the idPaciente
     */
    public long  getIdPaciente() {
        return idPaciente;
    }

    /**
     * @param idPaciente the idPaciente to set
     */
    public void setIdPaciente(long  idPaciente) {
        this.idPaciente = idPaciente;
    }

    /**
     * @return the idOdontologo
     */
    public long  getIdOdontologo() {
        return idOdontologo;
    }

    /**
     * @param idOdontologo the idOdontologo to set
     */
    public void setIdOdontologo(long  idOdontologo) {
        this.idOdontologo = idOdontologo;
    }

    /**
     * @return the idEstados
     */
    public int getIdEstados() {
        return idEstados;
    }

    /**
     * @param idEstados the idEstados to set
     */
    public void setIdEstados(int idEstados) {
        this.idEstados = idEstados;
    }

    /**
     * @return the observaciones
     */
    public String getObservaciones() {
        return observacion;
    }

    /**
     * @param observaciones the observaciones to set
     */
    public void setObservaciones(String observaciones) {
        this.observacion = observaciones;
    }

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
     * @return the jornada
     */
    public String getJornada() {
        return jornada;
    }

    /**
     * @param jornada the jornada to set
     */
    public void setJornada(String jornada) {
        this.jornada = jornada;
    }

    @Override
    public String toString() {
        return "CitaDTO{" + "fecha=" + fecha + ", idPaciente=" + idPaciente + ", idOdontologo=" + idOdontologo + ", idEstados=" + idEstados + ", idJornada=" + idJornada + ", observacion=" + observacion + ", jornada=" + jornada + '}';
    }
    
    
}
