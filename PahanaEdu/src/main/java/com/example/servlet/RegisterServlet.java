package com.example.servlet;

import com.example.util.DBUtil;
import com.example.model.User;
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

    private static final String PARAM_NAME = "name";
    private static final String PARAM_EMAIL = "email";
    private static final String PARAM_USERNAME  = "username";
    private static final String PARAM_PASSWORD = "password";

    private static final String INSERT_USER_SQL =
            "INSERT INTO login_tbl(name, username, email, password) VALUES (?, ?, ?, ?)";


    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter(PARAM_NAME);
        String email = req.getParameter(PARAM_EMAIL);
        String username = req.getParameter(PARAM_USERNAME);
        String password = req.getParameter(PARAM_PASSWORD);

        User user = new User(name, email, username, password);
        RequestDispatcher dispatcher = req.getRequestDispatcher("signup.jsp");

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(INSERT_USER_SQL)) {

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getUsername());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPassword());

            int rowCount = pstmt.executeUpdate();
            req.setAttribute("status", rowCount > 0 ? "success" : "failed");

        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error during registration", e);
            req.setAttribute("status", "failed");
        }

        dispatcher.forward(req, resp);
    }
}