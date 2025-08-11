package com.example;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String idStr = request.getParameter("id");
        String qtyStr = request.getParameter("quantity");

        // Validate input
        if (idStr == null || qtyStr == null || idStr.isEmpty() || qtyStr.isEmpty()) {
            response.sendRedirect("billing.jsp?error=invalid");
            return;
        }

        int productId, quantity;
        try {
            productId = Integer.parseInt(idStr);
            quantity = Integer.parseInt(qtyStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("billing.jsp?error=invalid");
            return;
        }

        ProductDAO dao = new ProductDAO();
        Product product;
        try {
            product = dao.getProductById(productId);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("billing.jsp?error=notfound");
            return;
        }

        if (product == null) {
            response.sendRedirect("billing.jsp?error=notfound");
            return;
        }

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean found = false;
        for (CartItem item : cart) {
            if (item.getProduct().getId() == productId) {
                item.setQuantity(item.getQuantity() + quantity);
                found = true;
                break;
            }
        }

        if (!found) {
            cart.add(new CartItem(product, quantity));
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("billing.jsp?status=added");
    }
}
