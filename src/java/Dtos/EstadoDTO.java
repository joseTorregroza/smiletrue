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
public class EstadoDTO {
    
        private int idEstado =0;
        private String descripcion="";

    
    public EstadoDTO() {
        
    }

    public EstadoDTO(int i, String estado) {
        this.idEstado=i;
        this.descripcion= estado;
        
    }

      
        
   
    /**
     * @return the idEstado
     */
    public int getIdEstado() {
        return idEstado;
    }

    /**
     * @param idEstado the idEstado to set
     */
    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }

    /**
     * @return the Descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the Descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    } 

    @Override
    public String toString() {
        return "EstadoDTO{" + "idEstado=" + idEstado + ", descripcion=" + descripcion + '}';
    }
    
}
