package com.example.servlet;

import com.example.dao.ProductDAO;
import com.example.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/viewProducts")
public class ViewProductsServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> productList = productDAO.getAllProducts();

        // Debug output
        System.out.println("Retrieved " + productList.size() + " products from database");
        for (Product p : productList) {
            System.out.println("Product: " + p.getId() + ", " + p.getName() + ", " + p.getDescription() + ", " + p.getPrice());
        }

        request.setAttribute("productList", productList);
        request.getRequestDispatcher("Admin/Products/view-products.jsp").forward(request, response);
    }
}