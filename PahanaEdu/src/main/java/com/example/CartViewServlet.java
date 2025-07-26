package com.example;

import com.example.util.DBConn;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/view-cart")
public class CartViewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (Connection conn = DBConn.getConnection("view-cart")) {
            PreparedStatement ps = conn.prepareStatement("SELECT id, item_id, quantity FROM cart");
            ResultSet rs = ps.executeQuery();

            List<Cart> cartList = new ArrayList<>();
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setId(rs.getInt("id"));
                cart.setItemId(rs.getInt("item_id"));
                cart.setQuantity(rs.getInt("quantity"));
                cartList.add(cart);
            }

            req.setAttribute("cartList", cartList);
            req.getRequestDispatcher("/Admin/Products/Cartindex.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("AdminHome.jsp?error=server");
        }
    }
}
