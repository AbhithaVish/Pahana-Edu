package com.example.Business.user.controller;

import com.example.Business.user.dto.UserDTO;
import com.example.Business.user.service.LoginService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private final LoginService loginService;

    public LoginController() {
        this.loginService = new LoginService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            UserDTO user = loginService.authenticate(username, password);

            if (user != null) {
                // Create session for successful login
                HttpSession session = req.getSession();
                session.setAttribute("username", user.getUsername());
                session.setAttribute("loginTime", System.currentTimeMillis());
                session.setAttribute("userType", user.getUserType());

                // Set session timeout (30 minutes)
                session.setMaxInactiveInterval(30 * 60);

                // Redirect based on user type
                if ("admin".equals(user.getUserType())) {
                    resp.sendRedirect("Admin/AdminHome.jsp");
                } else {
                    resp.sendRedirect("Cashier/CashierHome.jsp");
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
            req.setAttribute("errorMessage", e.getMessage());
            RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
            dispatcher.forward(req, resp);
        }
    }
}