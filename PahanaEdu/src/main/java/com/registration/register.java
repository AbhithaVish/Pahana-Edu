package com.registration;

import com.example.DBUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/signup")
public class register extends HttpServlet {
        private static final String NAME = "name";
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        RequestDispatcher dispatcher;

        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO login_tbl(name, username ,email, password) VALUES (?, ?,?, ?)");
            pstmt.setString(1, name);
            pstmt.setString(2, username);
            pstmt.setString(3, email);
            pstmt.setString(4, password);

            int rowCount = pstmt.executeUpdate();
            dispatcher = req.getRequestDispatcher("signup.jsp");

            if (rowCount > 0) {
                req.setAttribute("status", "success");
            } else {
                req.setAttribute("status", "failed");
            }

            dispatcher.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("status", "failed");
            dispatcher = req.getRequestDispatcher("signup.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
