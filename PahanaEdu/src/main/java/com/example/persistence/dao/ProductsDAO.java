package com.example.persistence.dao;

import com.example.persistence.model.Products;
import com.example.util.DBConn;
import java.sql.*;
import java.util.*;

public class ProductsDAO {
    public List<Products> getAllProducts() throws SQLException {
        List<Products> list = new ArrayList<>();
        try (Connection conn = DBConn.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM products");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Products p = new Products();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                list.add(p);
            }
        }
        return list;
    }

    public Products getProductById(int id) throws SQLException {
        try (Connection conn = DBConn.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM products WHERE id = ?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Products p = new Products();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                return p;
            }
        }
        return null;
    }

    public void insertProduct(Products p) throws SQLException {
        try (Connection conn = DBConn.getConnection();
             PreparedStatement ps = conn.prepareStatement("INSERT INTO products (name, description, price) VALUES (?, ?, ?)")) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.executeUpdate();
        }
    }

    public void updateProduct(Products p) throws SQLException {
        try (Connection conn = DBConn.getConnection();
             PreparedStatement ps = conn.prepareStatement("UPDATE products SET name=?, description=?, price=? WHERE id=?")) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setInt(4, p.getId());
            ps.executeUpdate();
        }
    }

    public void deleteProduct(int id) throws SQLException {
        try (Connection conn = DBConn.getConnection();
             PreparedStatement ps = conn.prepareStatement("DELETE FROM products WHERE id = ?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
