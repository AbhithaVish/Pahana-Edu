package com.example.Business.customer.controller;

import com.example.persistence.model.Customer;
import com.example.util.DBConn;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/customers")
public class CustomerListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        try (Connection conn = DBConn.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM customers");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer c = new Customer();
                c.setNic(rs.getString("nic"));
                c.setName(rs.getString("name"));
                c.setEmail(rs.getString("email"));
                c.setPhone(rs.getString("phone"));
                customerList.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("CustomerList.jsp").forward(request, response);
    }
}
