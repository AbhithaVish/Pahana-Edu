package com.example.servlet;

import com.example.model.Product;
import com.example.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/addProduct")
public class AddProductServlet extends HttpServlet {

    private static final String INSERT_PRODUCT_SQL =
            "INSERT INTO products (name, description, price) VALUES (?, ?, ?)";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String desc = request.getParameter("description");
        String priceStr = request.getParameter("price");

        try {
            double price = Double.parseDouble(priceStr);
            Product product = new Product(name, desc, price);

            try (Connection conn = DBUtil.getConnection();
                 PreparedStatement stmt = conn.prepareStatement(INSERT_PRODUCT_SQL)) {

                stmt.setString(1, product.getName());
                stmt.setString(2, product.getDescription());
                stmt.setDouble(3, product.getPrice());

                int rows = stmt.executeUpdate();
                request.setAttribute("status", rows > 0 ? "success" : "failed");

            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("status", "failed");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("status", "failed");
        }

        request.getRequestDispatcher("Admin/Products/add-product.jsp").forward(request, response);
    }
}
