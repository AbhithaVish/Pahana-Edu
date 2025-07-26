package com.example.persistence.dao;

import com.example.Business.items.dto.ProductDTO;
import com.example.persistence.model.Product;
import com.example.util.DBConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO products (name, description, price) VALUES (?, ?, ?)";
    private static final String SELECT_ALL_PRODUCTS = "SELECT id, name, description, price FROM products";

    public boolean addProduct(ProductDTO product) throws SQLException {
        try (Connection conn = DBConn.getConnection("login");
             PreparedStatement stmt = conn.prepareStatement(INSERT_PRODUCT_SQL)) {
            
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setDouble(3, product.getPrice());
            
            int rows = stmt.executeUpdate();
            return rows > 0;
        }
    }

    public List<Product> getAllProductViews() throws SQLException {
        List<Product> products = new ArrayList<>();

        try (Connection conn = DBConn.getConnection("login");
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_PRODUCTS);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price")
                );
                products.add(product);
            }
        }

        return products;
    }

    public Product getProductById(int id) throws SQLException {
        try (Connection conn = DBConn.getConnection("getById");
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM products WHERE id = ?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("description"),
                        rs.getDouble("price")
                );
            }
        }
        return null;
    }

    public boolean updateProduct(Product product) throws SQLException {
        try (Connection conn = DBConn.getConnection("update");
             PreparedStatement ps = conn.prepareStatement("UPDATE products SET name=?, description=?, price=? WHERE id=?")) {
            ps.setString(1, product.getName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean deleteProduct(int id) throws SQLException {
        try (Connection conn = DBConn.getConnection("delete");
             PreparedStatement ps = conn.prepareStatement("DELETE FROM products WHERE id = ?")) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

}