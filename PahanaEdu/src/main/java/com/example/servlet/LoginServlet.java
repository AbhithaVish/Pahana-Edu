package com.example.servlet;

import com.example.util.DBUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final String SELECT_USER_SQL =
            "SELECT * FROM login_tbl WHERE username = ? AND password = ?";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SELECT_USER_SQL)) {

            pstmt.setString(1, username);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                if ("admin".equals(username) && "admin123".equals(password)) {
                    // Admin login
                    RequestDispatcher dispatcher = req.getRequestDispatcher("Admin/AdminHome.jsp");
                    dispatcher.forward(req, resp);
                } else {
                    // Other users (e.g., cashier)
                    RequestDispatcher dispatcher = req.getRequestDispatcher("Cashier/CashierHome.jsp");
                    dispatcher.forward(req, resp);
                }
            } else {
                // Login failed
                req.setAttribute("status", "failed");
                RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
                dispatcher.forward(req, resp);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("status", "error");
            RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
