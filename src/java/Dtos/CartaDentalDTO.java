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
        private int estado=0;
        
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

 
    /**
     * @return the estado
     */
    public int getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(int estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "CartaDentalDTO{" + "idCartaDental=" + idCartaDental + ", Descripcion=" + Descripcion + ", fechaProccita=" + fechaProccita + ", procedimientos=" + procedimientos + ", estado=" + estado + '}';
    }
    


    
}

