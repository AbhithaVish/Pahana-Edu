package com.example;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/fetch-product")
public class FetchProductByIdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int productId = Integer.parseInt(req.getParameter("id"));
        ProductDAO dao = new ProductDAO();
        Product product = null;

        try {
            product = dao.getProductById(productId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.setContentType("application/json");
        if (product != null) {
            resp.getWriter().write(new Gson().toJson(product));
        } else {
            resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
            resp.getWriter().write("{\"error\":\"Product not found\"}");
        }
    }
}
