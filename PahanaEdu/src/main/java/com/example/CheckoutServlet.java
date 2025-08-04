package com.example;

import com.example.util.DBConn;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.List;
@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("billing.jsp?error=empty");
            return;
        }

        String customer = request.getParameter("customerName");
        String phone = request.getParameter("customerPhone");
        double discount = parseDoubleOrZero(request.getParameter("discount"));
        double serviceCharge = parseDoubleOrZero(request.getParameter("serviceCharge"));

        double total = cart.stream().mapToDouble(CartItem::getTotal).sum();
        double grandTotal = total - discount + serviceCharge;

        try (Connection conn = DBConn.getConnection()) {
            conn.setAutoCommit(false);

            // Insert into sales
            String insertSale = "INSERT INTO sales (customer_name, customer_phone, total_amount, discount, service_charge) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(insertSale, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, customer);
            ps.setString(2, phone);
            ps.setDouble(3, grandTotal);
            ps.setDouble(4, discount);
            ps.setDouble(5, serviceCharge);
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            int saleId = 0;
            if (rs.next()) {
                saleId = rs.getInt(1);
            }

            // Insert line items
            String insertItem = "INSERT INTO sale_items (sale_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
            PreparedStatement itemPs = conn.prepareStatement(insertItem);

            for (CartItem item : cart) {
                itemPs.setInt(1, saleId);
                itemPs.setInt(2, item.getProduct().getId());
                itemPs.setInt(3, item.getQuantity());
                itemPs.setDouble(4, item.getProduct().getPrice());
                itemPs.addBatch();
            }

            itemPs.executeBatch();
            conn.commit();

            // Save invoice for printing
            session.setAttribute("lastInvoice", cart);
            session.setAttribute("customerName", customer);
            session.setAttribute("customerPhone", phone);
            session.setAttribute("discount", discount);
            session.setAttribute("serviceCharge", serviceCharge);
            session.setAttribute("totalAmount", grandTotal);

            session.removeAttribute("cart");
            response.sendRedirect("Invoice.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("billing.jsp?error=db");
        }
    }

    private double parseDoubleOrZero(String val) {
        try {
            return val != null ? Double.parseDouble(val) : 0.0;
        } catch (NumberFormatException e) {
            return 0.0;
        }
    }
}
