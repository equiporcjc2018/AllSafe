/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package allSafe.dto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import java.sql.SQLException;


/**
 *
 * @author cetecom
 */
public class Conexion {

    /**
     * metodo static que permite conectar la bd de datos
     *
     * @return conexion exitosa
     * @throws ConexionException asocia error
     *
     */
    public static Connection getConexion() throws ConexionException {
        // conexiones
        Connection con = null;
        //instancia logger


        String user = "root";
        String password = "avaras08";
        try {


            // se envía la cadena y los datos de usuario y password por separado
            Properties datos = new Properties();
            datos.put("user", user);
            datos.put("password", password);
            String url = "jdbc:mysql://localhost:3306/bdallsafe4";
            con = DriverManager.getConnection(url, datos);
            if (con != null) {

                System.out.println("Conexión: Conexión a mibase satisfacoria");
            }
        } catch (SQLException e) {

            System.out.println("Error en la conexión, verifique, su usuario y password o el nombre de la base a la que intenta conectarse");
            e.printStackTrace();
        }
        return con;
    }
}
