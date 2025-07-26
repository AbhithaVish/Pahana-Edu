package com.example.Business.items.controller;

import com.example.Business.items.dto.ProductDTO;
import com.example.Business.items.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/editProduct")
public class EditProductController extends HttpServlet {

    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        ProductDTO product = productService.getProductById(id);
        req.setAttribute("product", product);
        req.getRequestDispatcher("/Admin/Products/add-product.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));

        ProductDTO dto = new ProductDTO(name, description, price);
        boolean success = productService.updateProduct(dto, id);

        req.setAttribute("status", success ? "success" : "failed");
        resp.sendRedirect("viewProducts");
    }
}
