package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private static String URL = "jdbc:mysql://localhost:3306/gaming_lap";
    private static String USER = "root";
    private static String PASS = "@Dinh123";
    public static Connection getConnectDB(){
       Connection connection =null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(URL, USER, PASS);
            } catch (ClassNotFoundException | SQLException e) {
               e.printStackTrace();
            }
        return connection;
    }
}
