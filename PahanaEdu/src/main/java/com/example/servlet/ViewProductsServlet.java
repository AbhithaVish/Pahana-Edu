package com.example.servlet;

import com.example.model.Product;
import com.example.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/viewProducts")
public class ViewProductsServlet extends HttpServlet {

    private static final String SELECT_ALL_PRODUCTS = "SELECT * FROM products";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> productList = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_PRODUCTS);
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

        } catch (SQLException e) {
            e.printStackTrace(); // You can log this properly in production
        }

        request.setAttribute("productList", productList);
        request.getRequestDispatcher("Admin/Products/view-products.jsp").forward(request, response);
    }
}
