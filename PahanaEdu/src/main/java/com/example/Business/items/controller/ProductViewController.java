package com.example.Business.items.controller;

import com.example.Business.items.dto.ProductDTO;
import com.example.Business.items.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/productView")
public class ProductViewController extends HttpServlet {

    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<ProductDTO> productList = productService.getAllProductViews();
        System.out.println("Fetched products: " + productList.size());

        for (ProductDTO dto : productList) {
            System.out.println(dto.getName() + " - " + dto.getDescription() + " - " + dto.getPrice());
        }
        req.setAttribute("products", productList);


        RequestDispatcher dispatcher = req.getRequestDispatcher("/Admin/Products/product-view.jsp");
        dispatcher.forward(req, resp);
    }

}
