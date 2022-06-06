/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BD;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {

    private Connection conexion = null;
    private String error = null;
    private static Conexion Instance=null;
    String url = "jdbc:postgresql://localhost:5432/PMIS1";
    String usuario = "postgres";
    String clave = "basededatos";
    
    private Conexion() throws ClassNotFoundException, SQLException{
        try{
        Class.forName("org.postgresql.Driver");
            //Acá se hace el new de la instancia
        conexion = DriverManager.getConnection(url, usuario, clave);
         } catch (ClassNotFoundException | SQLException ex) {

            error = ex.getMessage();
        }
    }

    private static Conexion createInstance()throws SQLException, ClassNotFoundException {

        if (Instance == null){
        Instance = new Conexion();            
        }  
        return Instance;        
    }

    public static Conexion getInstance() throws SQLException, ClassNotFoundException{
        if(Instance==null)createInstance();
            return Instance;
    }

    public Connection getConexion() {
        return conexion;
    }
  
    public String getError() {
        return error;
    }


    public void Cerrar() throws SQLException{
        try {

            conexion.close();
        } catch (SQLException ex) {

            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}




















/**
 *
 
public class Conexion {
    Connection conn = null;
    String url = "jdbc:postgresql://localhost:5432/PMIS1";
    String usuario = "postgres";
    String clave = "basededatos";
   
    public void Conectar(){
    try{   
    Class.forName("org.postgresql.Driver");
    conn = DriverManager.getConnection(url, usuario, clave);
    System.out.println("Conexion exitosa");   
    }catch(Exception e){
    System.out.println("Conexion fallida"); 
    }
    }
    
    public void Cerrar(){
        try{
            conn.close();
            System.out.println("Desconexion exitosa"); 
        }catch(Exception e){
            System.out.println("Desconexion fallida"); 
        }
    }
    
}*/
