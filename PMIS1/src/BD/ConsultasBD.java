/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BD;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author franco
 */
public class ConsultasBD {
    private Connection Conn;
    private ResultSet Rs;// Contenedor
    private ResultSetMetaData Mtd;// Esquema de la BD
    private String[] Nmbrecolumnas;
    private String Consulta,Error;

public ConsultasBD(Connection c, String query){
this.Conn=c;
this.Consulta= query;
try{
Statement st = Conn.createStatement();//declaramos una consulta
Rs= st.executeQuery(Consulta); //ejecutamos la consulta declarada
Error = null;
}catch(SQLException Ex){
Error=Ex.getMessage();//string para saber que error hubo
}
}

public String getError(){
    return this.Error;
}

public String getConsulta(){
return this.Consulta;
}

public ResultSet getResultado(){
return this.Rs;
}

public String [] getNombresColumnas(){

try{

	int numColumnas = Mtd.getColumnCount();

	this.Nmbrecolumnas = new String [numColumnas];

		for (int i=0; i<numColumnas;i++){

			this.Nmbrecolumnas[i] = Mtd.getColumnLabel(i+1);// La posicion en la que inicia el RS es en 1


		}

}	catch (SQLException ex){
                Logger.getLogger(ConsultasBD.class.getName()).log(Level.SEVERE,null,ex);

	}

return Nmbrecolumnas;

}
}


