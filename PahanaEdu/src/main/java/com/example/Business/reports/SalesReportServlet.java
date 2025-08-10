package com.example.Business.reports;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SalesReport")
public class SalesReportServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/pahana_edu";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Sale> salesList = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("SELECT id, customer_name, customer_phone, total_amount, discount, service_charge, created_at FROM sales");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                salesList.add(new Sale(
                        rs.getInt("id"),
                        rs.getString("customer_name"),
                        rs.getString("customer_phone"),
                        rs.getDouble("total_amount"),
                        rs.getDouble("discount"),
                        rs.getDouble("service_charge"),
                        rs.getString("created_at")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error: " + e.getMessage());
        }

        // Handle AJAX request
        if ("true".equals(request.getParameter("ajax"))) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            for (Sale sale : salesList) {
                out.println("<tr>");
                out.println("<td>" + sale.getId() + "</td>");
                out.println("<td>" + sale.getCustomerName() + "</td>");
                out.println("<td>" + sale.getCustomerPhone() + "</td>");
                out.println("<td>" + sale.getTotalAmount() + "</td>");
                out.println("<td>" + sale.getDiscount() + "</td>");
                out.println("<td>" + sale.getServiceCharge() + "</td>");
                out.println("<td>" + sale.getCreatedAt() + "</td>");
                out.println("</tr>");
            }
        } else {
            request.setAttribute("salesList", salesList);
            request.getRequestDispatcher("Admin/SalesReport.jsp").forward(request, response);
        }
    }

    // Inner class to hold sale data
    public static class Sale {
        private int id;
        private String customerName;
        private String customerPhone;
        private double totalAmount;
        private double discount;
        private double serviceCharge;
        private String createdAt;

        public Sale(int id, String customerName, String customerPhone, double totalAmount,
                    double discount, double serviceCharge, String createdAt) {
            this.id = id;
            this.customerName = customerName;
            this.customerPhone = customerPhone;
            this.totalAmount = totalAmount;
            this.discount = discount;
            this.serviceCharge = serviceCharge;
            this.createdAt = createdAt;
        }

        public int getId() { return id; }
        public String getCustomerName() { return customerName; }
        public String getCustomerPhone() { return customerPhone; }
        public double getTotalAmount() { return totalAmount; }
        public double getDiscount() { return discount; }
        public double getServiceCharge() { return serviceCharge; }
        public String getCreatedAt() { return createdAt; }
    }
}
