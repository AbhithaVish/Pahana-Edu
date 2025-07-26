package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/add-product")
public class ProductAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Product p = new Product();
            p.setName(req.getParameter("name"));
            p.setDescription(req.getParameter("description"));
            p.setPrice(Double.parseDouble(req.getParameter("price")));

            ProductDAO dao = new ProductDAO();
            dao.insertProduct(p);
            resp.sendRedirect("products");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("AdminHome.jsp?error=add");
        }
    }
}
