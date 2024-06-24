package core;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Db {

    // Singleton Desing Pattern
    private static Db instance = null;  // Singleton instance
    private Connection connection = null;  // Database connection object
    private final String DB_URL = "jdbc:postgresql://localhost:5432/turizmAcentesi";  // Database URL
    private final String DB_USER = "postgres";  // Database user
    private final String DB_PASS = "yakup660";  // Database password

    // Private constructor to prevent instantiation
    private Db(){
        try {
            this.connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);  // Establish database connection
        } catch (SQLException e) {
            e.printStackTrace();  // Print stack trace in case of exception
        }
    }

    // Returns the database connection
    public Connection getConnection() {
        return connection;
    }

    // Returns the Singleton instance of the Db class, creating it if necessary
    public static Connection getInstance() {
        try {
            if (instance == null || instance.getConnection().isClosed()) {
                instance = new Db();  // Create new instance if it doesn't exist or the connection is closed
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());  // Print exception message
        }

        return instance.getConnection();  // Return the connection
    }
}