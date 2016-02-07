package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by earthz on 2/5/16.
 */
public class DatabaseConnection {

    private static DatabaseConnection thisInstance = new DatabaseConnection();
    private static Connection connection;

    public static DatabaseConnection getInstance() {
        return thisInstance;
    }

    private DatabaseConnection() {
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            connection = DriverManager.getConnection("jdbc:mysql://database.it.kmitl.ac.th/it_14", "it_14", "7xdTD2Uv");
        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }
    }

    public Connection getConnection() {
        return connection;
    }
}
