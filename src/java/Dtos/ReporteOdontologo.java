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
public class ReporteOdontologo {
    
    private  String Odontologo="";
    private String NombreProcedimiento="";
    private int Cantidad=0;
    private String Periodo ="";
    private int NumPacientes=0;

    @Override
    public String toString() {
        return "ReporteOdontologo{" + "Odontologo=" + Odontologo + ", NombreProcedimiento=" + NombreProcedimiento + ", Cantidad=" + Cantidad + ", Periodo=" + Periodo + ", NumPacientes=" + NumPacientes + '}';
    }

    public String getOdontologo() {
        return Odontologo;
    }

    public void setOdontologo(String Odontologo) {
        this.Odontologo = Odontologo;
    }

    public String getNombreProcedimiento() {
        return NombreProcedimiento;
    }

    public void setNombreProcedimiento(String NombreProcedimiento) {
        this.NombreProcedimiento = NombreProcedimiento;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public String getPeriodo() {
        return Periodo;
    }

    public void setPeriodo(String Periodo) {
        this.Periodo = Periodo;
    }

    public int getNumPacientes() {
        return NumPacientes;
    }

    public void setNumPacientes(int NumPacientes) {
        this.NumPacientes = NumPacientes;
    }
    
}
