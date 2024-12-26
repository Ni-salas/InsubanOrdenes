
package utilidades;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionBD {
    private static final String DATABASE_HOST = "jdbc:mysql://localhost:3306/insubanbd";
    private static final String DATABASE_USER = "root";
    private static final String DATABASE_PASSWORD = "";
    
    public Connection getConnection(){
        Connection connection = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DATABASE_HOST, DATABASE_USER, DATABASE_PASSWORD);
        } catch (Exception e){
            System.out.println("Algo salio mal. Error = "+ e.getMessage());
        }
        return connection;
    }
    
}
