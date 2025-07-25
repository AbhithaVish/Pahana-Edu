package com.example.Business.items.controller;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));

        HttpSession session = request.getSession();
        ArrayList<HashMap<String, Object>> cart = (ArrayList<HashMap<String, Object>>) session.getAttribute("cart");

        if (cart == null) cart = new ArrayList<>();

        HashMap<String, Object> item = new HashMap<>();
        item.put("id", id);
        item.put("name", name);
        item.put("price", price);

        cart.add(item);

        session.setAttribute("cart", cart);

        response.sendRedirect("ProductServlet");
    }
}
