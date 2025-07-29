package com.example;

import com.example.util.DBConn;
import java.sql.*;
import java.util.*;

public class ProductDAO {
    public List<Product> getAllProducts() throws SQLException {
        List<Product> list = new ArrayList<>();
        try (Connection conn = DBConn.getConnection("getAll");
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM products");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                list.add(p);
            }
        }
        return list;
    }

    public Product getProductById(int id) throws SQLException {
        try (Connection conn = DBConn.getConnection("getById");
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM products WHERE id = ?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                return p;
            }
        }
        return null;
    }

    public void insertProduct(Product p) throws SQLException {
        try (Connection conn = DBConn.getConnection("insert");
             PreparedStatement ps = conn.prepareStatement("INSERT INTO products (name, description, price) VALUES (?, ?, ?)")) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.executeUpdate();
        }
    }

    public void updateProduct(Product p) throws SQLException {
        try (Connection conn = DBConn.getConnection("update");
             PreparedStatement ps = conn.prepareStatement("UPDATE products SET name=?, description=?, price=? WHERE id=?")) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setInt(4, p.getId());
            ps.executeUpdate();
        }
    }

    public void deleteProduct(int id) throws SQLException {
        try (Connection conn = DBConn.getConnection("delete");
             PreparedStatement ps = conn.prepareStatement("DELETE FROM products WHERE id = ?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
