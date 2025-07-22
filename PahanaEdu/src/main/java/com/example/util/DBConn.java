package com.example.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
    // Default connection (optional)
    private static final String URL = "jdbc:mysql://localhost:3306/jakartaee";
    private static final String LOGIN_DB_URL = "jdbc:mysql://localhost:3306/jakartaee";
    private static final String PRODUCT_DB_URL = "jdbc:mysql://localhost:3306/your_product_db"; // Change as needed
    // ✔ Define this
    private static final String USER = "root";
    private static final String PASSWORD = ""; // Set your actual DB password if applicable

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
    }

    private static DBConn instance;

    private DBConn() {
        // Private constructor for singleton
    }

    public static DBConn getInstance() {
        if (instance == null) {
            instance = new DBConn();
        }
        return instance;
    }

    public Connection getConnection(String database) throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "login".equals(database) ? LOGIN_DB_URL : PRODUCT_DB_URL;
            return DriverManager.getConnection(url, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
    }
}
