package net;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    
    // Define Instance for make connection
    private static DatabaseConnection Instance = new DatabaseConnection();
    
    public static DatabaseConnection getInstance() {
        return Instance;
    }
    
    private static Connection connection;
    
    private DatabaseConnection() {
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            connection = DriverManager.getConnection("jdbc:mysql://database.it.kmitl.ac.th/it_14", "it_14", "7xdTD2Uv");
        } catch (SQLException e) {
               e.printStackTrace();
        }
    }
    
    public Connection getConnection() {
        return connection;
    }
}
