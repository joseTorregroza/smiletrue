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
public class AgendaMedicoDTO {
    
    private long idOdontologo=0;
    private String nombre="";
    private String apellido="";
    private String idPaciente="";
    private String procedimiento="";
    private String Fecha="";
    private String horario="";
    private String Descripcion="";

    public AgendaMedicoDTO() {
    }

    public AgendaMedicoDTO(long  idO, String nombre, String apellido, String idPaciente, String Fecha, String horario, String Descripcion) {
       this.idOdontologo=  idO;
       this.nombre= nombre;
       this.apellido= apellido;
       this.idPaciente= idPaciente;
       this.procedimiento= procedimiento;
       this.Fecha=Fecha;
       this.horario= horario;
       this.Descripcion=Descripcion;
        
    }

    @Override
    public String toString() {
        return "AgendaMedicoDTO{" + "idOdontologo=" + idOdontologo + ", nombre=" + nombre + ", apellido=" + apellido + ", idPaciente=" + idPaciente + ", procedimiento=" + procedimiento + ", Fecha=" + Fecha + ", horario=" + horario + ", Descripcion=" + Descripcion + '}';
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
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @param apellido the apellido to set
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * @return the idPaciente
     */
    public String getIdPaciente() {
        return idPaciente;
    }

    /**
     * @param idPaciente the idPaciente to set
     */
    public void setIdPaciente(String idPaciente) {
        this.idPaciente = idPaciente;
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
     * @return the Fecha
     */
    public String getFecha() {
        return Fecha;
    }

    /**
     * @param Fecha the Fecha to set
     */
    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
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

}