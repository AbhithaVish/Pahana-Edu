package com.example.servlet;

import com.example.util.DBConn;
import com.example.persistence.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/signup2")
public class RegisterServlet extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(RegisterServlet.class.getName());
//model
    private static final String PARAM_NAME = "name";
    private static final String PARAM_EMAIL = "email";
    private static final String PARAM_USERNAME  = "username";
    private static final String PARAM_PASSWORD = "password";
//dao
    private static final String INSERT_USER_SQL =
            "INSERT INTO login_tbl(name, username, email, password) VALUES (?, ?, ?, ?)";
//--------
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = request.getParameter(PARAM_NAME);
        String email = request.getParameter(PARAM_EMAIL);
        String username = request.getParameter(PARAM_USERNAME);
        String password = request.getParameter(PARAM_PASSWORD);

        User user = new User(name, email, username, password);
        RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");

        try (Connection conn = DBConn.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(INSERT_USER_SQL)) {

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getUsername());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPassword());

            int rowCount = pstmt.executeUpdate();
            request.setAttribute("status", rowCount > 0 ? "success" : "failed");

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error during registration", e);
            request.setAttribute("status", "failed");
        }

        dispatcher.forward(request, resp);
    }
}