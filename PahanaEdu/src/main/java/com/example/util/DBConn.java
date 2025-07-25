package com.example.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
    private static final String URL = "jdbc:mysql://localhost:3306/pahana_edu";
    private static final String USER = "root";
    private static final String PASS = ""; // Use your actual password if set

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection(String login) throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }

    public static DBConn getInstance() {
        return null;
    }
}

