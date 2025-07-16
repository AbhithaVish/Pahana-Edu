package com.example;

import com.example.util.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/viewCart")
public class ViewCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        out.println("<html><body><h2>Cart Summary</h2><ul>");
        int total = 0;

        try (Connection conn = DBUtil.getConnection()) {
            String query = """
                SELECT i.name, i.price, c.quantity 
                FROM cart c 
                JOIN item i ON c.item_id = i.id
            """;

            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                int price = rs.getInt("price");
                int qty = rs.getInt("quantity");
                int itemTotal = price * qty;

                total += itemTotal;
                out.printf("<li>%s x %d = $%d</li>", name, qty, itemTotal);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        out.printf("</ul><h3>Total: $%d</h3>", total);
        out.println("<br><a href='index.html'>Back</a></body></html>");
    }
}
