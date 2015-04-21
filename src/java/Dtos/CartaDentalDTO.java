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
public class CartaDentalDTO {
        private int idCartaDental=0;
        private String Descripcion="";
        private String fechaProccita="";
        private String procedimientos="";
        private int detalle=0;
        private String observacion="";
    
        
    public CartaDentalDTO() {
        
    }
    /**
     * @return the idCartaDental
     */
        public CartaDentalDTO(int id, String des, String fecha,String proc) {
        this.idCartaDental = id;
        this.Descripcion = des;
        this.fechaProccita = fecha;
        this.procedimientos = proc;
     
        }
        
        
    public int getIdCartaDental() {
        return idCartaDental;
    }

    /**
     * @param idCartaDental the idCartaDental to set
     */
    public void setIdCartaDental(int idCartaDental) {
        this.idCartaDental = idCartaDental;
    }

    /**
     * @return the Descripcion
     */
    public String getDescripcion() {
        return Descripcion;
    }

    /**
     * @param Descripcion the Descripcion to set
     */
    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }


    /**
     * @return the fechaProccita
     */
    public String getFechaProccita() {
        return fechaProccita;
    }

    /**
     * @param fechaProccita the fechaProccita to set
     */
    public void setFechaProccita(String fechaProccita) {
        this.fechaProccita = fechaProccita;
    }

    /**
     * @return the procedimientos
     */
    public String getProcedimientos() {
        return procedimientos;
    }

    /**
     * @param procedimientos the procedimientos to set
     */
    public void setProcedimientos(String procedimientos) {
        this.procedimientos = procedimientos;
    }


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
        return "CartaDentalDTO{" + "idCartaDental=" + idCartaDental + ", Descripcion=" + Descripcion + ", fechaProccita=" + fechaProccita + ", procedimientos=" + procedimientos + ", detalle=" + detalle + ", observacion=" + observacion + '}';
    }

 


 

  
    


    
}

