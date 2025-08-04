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
        .message {
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 4px;
            font-weight: bold;
            text-align: center;
        }
        .success { background-color: #d4edda; color: #155724; }
        .error { background-color: #f8d7da; color: #721c24; }
        .warning { background-color: #fff3cd; color: #856404; }
        .info { background-color: #d1ecf1; color: #0c5460; }
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

<%
    String status = request.getParameter("status");
    String error = request.getParameter("error");
%>

<% if ("added".equals(status)) { %>
<div class="message success">✅ Product added to bill!</div>
<% } else if ("notfound".equals(error)) { %>
<div class="message error">❌ Product not found! Please check the ID.</div>
<% } else if ("invalid".equals(error)) { %>
<div class="message warning">⚠️ Invalid input. Please check values.</div>
<% } else if ("billed".equals(status)) { %>
<div class="message info">🧾 Bill generated successfully!</div>
<% } else if ("empty".equals(error)) { %>
<div class="message error">🛑 Cannot bill. The cart is empty.</div>
<% } else if ("saving".equals(error)) { %>
<div class="message error">❌ Error saving the bill. Please try again.</div>
<% } %>

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
        if (cart != null && !cart.isEmpty()) {
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
