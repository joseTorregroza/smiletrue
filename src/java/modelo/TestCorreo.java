/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import Controlador.Correo;

/**
 *
 * @author USUARIO
 */
public class TestCorreo {
    
     /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here

        if (Correo.sendMail("holaaaaa", " querido", "jmvargas19@misena.edu.co")) {

            System.out.println("envío Correcto");

        } else {
            System.out.println("envío Fallido");
        }

    }
    
}
