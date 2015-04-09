/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Dtos;

/**
 *
 * @author Usuario
 */
public class ReporteServicioDTO {
    private int Cantidad=0;
    private String Descripcion="";

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

 
    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
      @Override
    public String toString() {
        return "ReporteServicioDTO{" + "Cantidad=" + Cantidad + ", Descripcion=" + Descripcion + '}';
    }
    
    
    
}
