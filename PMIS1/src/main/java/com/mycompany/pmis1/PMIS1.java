/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */

package com.mycompany.pmis1;

import BD.Conexion;

/**
 *
 */
public class PMIS1 {

    public static void main(String[] args) {
         Conexion con  = new Conexion();
          con.Conectar();
          con.Cerrar();
    }
}
