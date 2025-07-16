package com.example;

import com.example.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String itemName = req.getParameter("item");
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        try (Connection conn = DBUtil.getConnection()) {
            // Fetch item ID
            PreparedStatement ps1 = conn.prepareStatement("SELECT id FROM item WHERE name = ?");
            ps1.setString(1, itemName);
            ResultSet rs = ps1.executeQuery();

            if (rs.next()) {
                int itemId = rs.getInt("id");

                // Insert into cart table
                PreparedStatement ps2 = conn.prepareStatement("INSERT INTO cart (item_id, quantity) VALUES (?, ?)");
                ps2.setInt(1, itemId);
                ps2.setInt(2, quantity);
                ps2.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.sendRedirect("viewCart");
    }
}
