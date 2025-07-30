package com.example.servlet;

import com.example.persistence.dao.ProductDAO;
import com.example.persistence.model.Product;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/billing")
public class BillingServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Product> productList = productDAO.getAllProductViews();
            request.setAttribute("productList", productList);
        } catch (SQLException e) {
            e.printStackTrace(); // Log error properly in real app
            request.setAttribute("productList", null);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/Cashier/Billing.jsp");
        dispatcher.forward(request, response);
    }
}
