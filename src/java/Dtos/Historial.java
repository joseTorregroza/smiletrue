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
public class Historial {
    private long  idProPac=0;
    private String odontonlogo="";
    private String fecha="";
    private String hora="";
    private String procedimiento="";
    private String observacion="";

    public Historial() {
    }

public Historial(long  id, String odon, String fecha, String hora, String pro, String obv) {
        this.idProPac = id;
        this.odontonlogo = odon;
        this.fecha = fecha;
        this.hora = hora;
        this.procedimiento = pro;
        this.observacion = obv;
    }
    @Override
    public String toString() {
        return "Historial{" + "idProPac=" + idProPac + ", odontonlogo=" + odontonlogo + ", fecha=" + fecha + ", hora=" + hora + ", procedimiento=" + procedimiento + ", observacion=" + observacion + '}';
    }
  public Historial(long  idProPac){
        this.idProPac = idProPac;
       
    }
    /**
     * @return the nombre
     */
   

    /**
     * @return the fecha
     */
    public String getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    /**
     * @return the hora
     */
    public String getHora() {
        return hora;
    }

    /**
     * @param hora the hora to set
     */
    public void setHora(String hora) {
        this.hora = hora;
    }

    /**
     * @return the procedimiento
     */
    public String getProcedimiento() {
        return procedimiento;
    }

    /**
     * @param procedimiento the procedimiento to set
     */
    public void setProcedimiento(String procedimiento) {
        this.procedimiento = procedimiento;
    }

    /**
     * @return the observacion
     */
    public String getObservacion() {
        return observacion;
    }

    /**
     * @param observacion the observacion to set
     */
    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }



    /**
     * @return the idProcPac
     */
    public long  getIdProPac() {
        return idProPac;
    }

    /**
     * @param idProPac
     */
    public void setIdProPac(long  idProPac) {
        this.idProPac = idProPac;
    }

    /**
     * @return the odontonlogo
     */
    public String getOdontonlogo() {
        return odontonlogo;
    }

    /**
     * @param odontonlogo the odontonlogo to set
     */
    public void setOdontonlogo(String odontonlogo) {
        this.odontonlogo = odontonlogo;
    }

    
    

    
}
