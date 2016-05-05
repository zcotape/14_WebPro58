package database;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import java.sql.Connection;

public class DatabaseConnection {

    private static DatabaseConnection thisInstance = new DatabaseConnection();
    private static Connection connection;

    private DatabaseConnection() {
        try {
            MysqlDataSource dataSource = new MysqlDataSource();
            dataSource.setUser("it_14");
            dataSource.setPassword("7xdTD2Uv");
            dataSource.setUrl("jdbc:mysql://database.it.kmitl.ac.th:3306/it_14?autoReconnect=true&characterEncoding=UTF-8");

            connection = dataSource.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
    }

    public static DatabaseConnection getInstance() {
        return thisInstance;
    }

    public Connection getConnection() {
        return connection;
    }
}
