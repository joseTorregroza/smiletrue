/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

/**
 *
 * @author Administrador
 */
public class MyException extends Exception{
    private static final long serialVersionUID = 1L;

    public MyException(String msg){
        super(msg);
    }
}