package com.example.persistence.dao;

import com.example.persistence.model.Product;
import com.example.util.DBConn;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
//SQL QUERIES - DATA ACCESS OBJECT
    public List<Product> getAllProducts() throws SQLException {
        List<Product> productList = new ArrayList<>();

        String sql = "SELECT * FROM products"; // Adjust table name if needed

        try (Connection conn = DBConn.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price")
                );
                productList.add(product);
            }
        }

        return productList;
    }

    public Product getProductById(int id) throws SQLException {
        Product product = null;
        String sql = "SELECT * FROM products WHERE id = ?";

        try (Connection conn = DBConn.getInstance().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    product = new Product(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("description"),
                            rs.getDouble("price")
                    );
                }
            }
        }

        return product;
    }

}
