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
public class ProcedimientosCatalogosDTO {
        private int idCatalogo=0;
        private String procedimiento="";
        private int duracion=0;

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
     * @return the duracion
     */
    public int getDuracion() {
        return duracion;
    }

    /**
     * @param duracion the duracion to set
     */
    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    @Override
    public String toString() {
        return "ProcedimientoCatalogoDTO{" + "idCatalogo=" + idCatalogo
                + ", procedimiento=" + procedimiento + ", duracion=" + duracion + '}';
    }
 
    
}
