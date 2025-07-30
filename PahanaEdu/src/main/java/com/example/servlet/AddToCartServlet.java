package com.example.servlet;

import com.example.model.Cart;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));

        // Create a cart item (you can use your existing Cart model or create a new one)
        Cart item = new Cart(id, name, 1, price); // quantity = 1 by default

        // Get or create the cart list in session
        HttpSession session = request.getSession();
        List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
        if (cartList == null) {
            cartList = new ArrayList<>();
        }

        // Check if product already in cart, increment quantity
        boolean exists = false;
        for (Cart c : cartList) {
            if (c.getId() == id) {
                c.setQuantity(c.getQuantity() + 1);
                exists = true;
                break;
            }
        }

        if (!exists) {
            cartList.add(item);
        }

        // Save back to session
        session.setAttribute("cartList", cartList);

        // Redirect back to billing page
        response.sendRedirect("billing");
    }
}
