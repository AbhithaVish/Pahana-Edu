<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/31/2025
  Time: 7:14 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.model.CartItem" %>

<div class="w-1/3 p-4 bg-white shadow-lg rounded-l-xl">
    <h2 class="text-xl font-bold mb-4 border-b pb-2">Bill Summary</h2>

    <%
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        double total = 0;
        if (cart != null && !cart.isEmpty()) {
            for (CartItem item : cart) {
                total += item.getPrice() * item.getQuantity();
    %>
    <div class="flex justify-between items-center py-2 border-b">
        <div>
            <p class="font-semibold"><%= item.getName() %></p>
            <p class="text-sm text-gray-600">Qty: <%= item.getQuantity() %> x Rs.<%= item.getPrice() %></p>
        </div>
        <form action="UpdateCartServlet" method="post" class="flex items-center space-x-2">
            <input type="hidden" name="id" value="<%= item.getId() %>" />
            <button name="action" value="decrease" class="text-red-500 text-lg px-2">−</button>
            <button name="action" value="increase" class="text-green-500 text-lg px-2">+</button>
        </form>
    </div>
    <%
        }
    } else {
    %>
    <p class="text-gray-500 text-center">No items added yet.</p>
    <%
        }
    %>

    <div class="mt-4 border-t pt-4">
        <p class="font-semibold text-lg">Total: Rs. <%= String.format("%.2f", total) %></p>
        <div class="mt-4 flex justify-between">
            <form action="ClearCartServlet" method="post">
                <button class="bg-gray-200 hover:bg-gray-300 px-4 py-2 rounded">Clear</button>
            </form>
            <form action="CheckoutServlet" method="post">
                <button class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">Checkout</button>
            </form>
        </div>
    </div>
</div>




