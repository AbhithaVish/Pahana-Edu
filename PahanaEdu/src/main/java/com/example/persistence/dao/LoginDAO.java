package com.example.persistence.dao;

import com.example.Business.user.dto.UserDTO;
import com.example.util.DBConn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {

    public UserDTO authenticateUser(String username, String password) throws SQLException {
        String query = "SELECT username, profile FROM login_tbl WHERE username = ? AND password = ?";

        try (Connection conn = DBConn.getInstance().getConnection("login");
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    UserDTO user = new UserDTO();
                    user.setUsername(rs.getString("username"));
                    user.setUserType(rs.getString("profile")); // assuming profile stores user type
                    return user;
                }
            }
        }

        return null; // Login failed
    }
}
