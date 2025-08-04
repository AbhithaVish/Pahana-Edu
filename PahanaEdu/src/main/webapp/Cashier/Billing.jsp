<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 8/4/2025
  Time: 6:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>POS Billing</title>
    <style>
        body { font-family: Arial; padding: 20px; background: #f0f0f0; }
        input, button { padding: 8px; margin: 4px; }
        table { width: 100%; border-collapse: collapse; background: white; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #ccc; }
    </style>
    <script>
        function addItem() {
            const id = document.getElementById("productId").value;
            const qty = document.getElementById("quantity").value;

            if (!id || !qty) {
                alert("Enter Product ID and Quantity");
                return;
            }

            const form = document.createElement("form");
            form.method = "post";
            form.action = "add-to-cart";

            const idInput = document.createElement("input");
            idInput.type = "hidden";
            idInput.name = "id";
            idInput.value = id;

            const qtyInput = document.createElement("input");
            qtyInput.type = "hidden";
            qtyInput.name = "quantity";
            qtyInput.value = qty;

            form.appendChild(idInput);
            form.appendChild(qtyInput);
            document.body.appendChild(form);
            form.submit();
        }
    </script>
</head>
<body>

<h2>Cashier POS - Billing</h2>

<!-- Product Entry -->
<div>
    <input type="number" id="productId" placeholder="Enter Product ID">
    <input type="number" id="quantity" placeholder="Quantity" value="1" min="1">
    <button onclick="addItem()">Add</button>
</div>

<!-- Bill Area -->
<table>
    <thead>
    <tr><th>ID</th><th>Name</th><th>Price</th><th>Qty</th><th>Total</th></tr>
    </thead>
    <tbody>
    <%
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        double total = 0;
        if (cart != null) {
            for (CartItem item : cart) {
                double rowTotal = item.getTotal();
                total += rowTotal;
    %>
    <tr>
        <td><%= item.getProduct().getId() %></td>
        <td><%= item.getProduct().getName() %></td>
        <td>Rs. <%= String.format("%.2f", item.getProduct().getPrice()) %></td>
        <td><%= item.getQuantity() %></td>
        <td>Rs. <%= String.format("%.2f", rowTotal) %></td>
    </tr>
    <% } } else { %>
    <tr><td colspan="5">Cart is empty</td></tr>
    <% } %>
    </tbody>
</table>

<h3>Total: Rs. <%= String.format("%.2f", total) %></h3>

<!-- Checkout Form -->
<form method="post" action="checkout">
    <input name="customerName" placeholder="Customer Name">
    <input name="customerPhone" placeholder="Mobile Number">
    <button type="submit">✅ Checkout & Print</button>
</form>

</body>
</html>
