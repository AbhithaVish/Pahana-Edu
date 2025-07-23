package com.example.persistence.dao;
import com.example.Business.items.dto.ProductDTO;
import com.example.util.DBConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProductDAO {
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO products (name, description, price) VALUES (?, ?, ?)";

    public boolean addProduct(ProductDTO product) throws SQLException {
        try (Connection conn = DBConn.getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT_PRODUCT_SQL)) {
            stmt.setString(1, product.getName());
            stmt.setString(2, product.getDescription());
            stmt.setDouble(3, product.getPrice());
            int rows = stmt.executeUpdate();
            return rows > 0;
        }
    }
}
