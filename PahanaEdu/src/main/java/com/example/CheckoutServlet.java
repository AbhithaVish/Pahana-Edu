package com.example;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        String customer = request.getParameter("customerName");
        String phone = request.getParameter("customerPhone");
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("billing.jsp?error=empty");
            return;
        }

        // Save for invoice
        session.setAttribute("lastInvoice", cart);
        session.setAttribute("customerName", customer);
        session.setAttribute("customerPhone", phone);

        // Clear current cart
        session.removeAttribute("cart");

        response.sendRedirect("Invoice.jsp");
    }
}
