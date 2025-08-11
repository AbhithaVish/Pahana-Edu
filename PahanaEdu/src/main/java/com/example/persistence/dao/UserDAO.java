package com.example.persistence.dao;

import com.example.persistence.model.User;
import com.example.util.DBConn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private static final String INSERT_USER_SQL =
            "INSERT INTO login_tbl(name, username, email, password) VALUES (?, ?, ?, ?)";

    public boolean saveUser(User user) throws SQLException {
        try (Connection conn = DBConn.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(INSERT_USER_SQL)) {

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getUsername());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPassword());

            return pstmt.executeUpdate() > 0;
        }
    }

    public List<User> getAllCashiers() throws SQLException {
        List<User> cashiers = new ArrayList<>();
        String sql = "SELECT id, name, email, username FROM login_tbl WHERE role = 'cashier'";

        try (Connection conn = DBConn.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                User cashier = new User();
                cashier.setId(rs.getInt("id"));
                cashier.setName(rs.getString("name"));
                cashier.setEmail(rs.getString("email"));
                cashier.setUsername(rs.getString("username"));
                cashiers.add(cashier);
            }
        }

        return cashiers;
    }
}
