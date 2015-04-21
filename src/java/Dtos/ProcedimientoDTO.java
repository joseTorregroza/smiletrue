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
public class ProcedimientoDTO {
    
        private String fechaProcCita="";
        private long  idProcPac=0;
        private int idCartadental=0;
        private int idCatalogo=0;
        private String observacion="";
        private int detalle=0;

    
       public ProcedimientoDTO(String fechaProcCita, long  idProcPac, int idCartadental, int idCatalogo, String observacion) {
           this.fechaProcCita= fechaProcCita;
           this.idProcPac= idProcPac;
           this.idCartadental= idCartadental;
           this.idCatalogo= idCatalogo;
           this.observacion= observacion;
}

    public ProcedimientoDTO() {
       }


    /**
     * @return the fechaProcCita
     */
    public String getFechaProcCita() {
        return fechaProcCita;
    }

    /**
     * @param fechaProcCita the fechaProcCita to set
     */
    public void setFechaProcCita(String fechaProcCita) {
        this.fechaProcCita = fechaProcCita;
    }

    /**
     * @return the idProcPac
     */
    public long  getIdProcPac() {
        return idProcPac;
    }

    /**
     * @param idProcPac the idProcPac to set
     */
    public void setIdProcPac(long  idProcPac) {
        this.idProcPac = idProcPac;
    }

    /**
     * @return the idCartadental
     */
    public int getIdCartadental() {
        return idCartadental;
    }

    /**
     * @param idCartadental the idCartadental to set
     */
    public void setIdCartadental(int idCartadental) {
        this.idCartadental = idCartadental;
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
     * @return the idCatalogo
     */
    public int getIdCatalogo() {
        return idCatalogo;
    }

    /**
     * @param idCatalogo the idCatalogo to set
     */
    public void setIdCatalogo(int idCatalogo) {
        this.idCatalogo = idCatalogo;
    }

    /**
     * @return the detalle
     */
    public int getDetalle() {
        return detalle;
    }

    /**
     * @param detalle the detalle to set
     */
    public void setDetalle(int detalle) {
        this.detalle = detalle;
    }

    @Override
    public String toString() {
        return "ProcedimientoDTO{" + "fechaProcCita=" + fechaProcCita + ", idProcPac=" + idProcPac + ", idCartadental=" + idCartadental + ", idCatalogo=" + idCatalogo + ", observacion=" + observacion + ", detalle=" + detalle + '}';
    }

 


    
}
