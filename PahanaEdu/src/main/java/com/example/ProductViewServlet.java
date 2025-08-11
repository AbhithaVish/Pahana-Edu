package com.example;

import com.example.util.DBConn;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/view-products") // Changed from "/products" to "/view-products"
public class ProductViewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ProductDAO dao = new ProductDAO();
            List<Product> products = dao.getAllProducts();
            req.setAttribute("productList", products);
            req.getRequestDispatcher("/Admin/Products/ProductIndex.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("AdminHome.jsp?error=view");
        }
    }
}
