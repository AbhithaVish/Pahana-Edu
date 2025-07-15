package com.registration;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class login extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");//get data from the input and save it in the variable
        String password = req.getParameter("password");//request parameter

        PrintWriter out = resp.getWriter();
        out.println(username);
        out.println(password);


//        try (Connection conn = DBUtil.getConnection()) {
//
//
//           PreparedStatement pst = conn.prepareStatement("insert into login_tbl("name, username, email, password")")
//            // Fetch item ID
//            PreparedStatement ps1 = conn.prepareStatement("SELECT id FROM item WHERE name = ?");
//            ps1.setString(1, itemName);
//            ResultSet rs = ps1.executeQuery();
//
//            if (rs.next()) {
//                int itemId = rs.getInt("id");
//
//                // Insert into cart table
//                PreparedStatement ps2 = conn.prepareStatement("INSERT INTO cart (item_id, quantity) VALUES (?, ?)");
//                ps2.setInt(1, itemId);
//                ps2.setInt(2, quantity);
//                ps2.executeUpdate();
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

    }
}

