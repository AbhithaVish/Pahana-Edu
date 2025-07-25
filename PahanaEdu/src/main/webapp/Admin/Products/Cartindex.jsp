<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Cart" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart Data</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f0f0f0; padding: 20px; }
        table { width: 100%; border-collapse: collapse; background: #fff; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: left; }
        th { background-color: #f1f1f1; }
    </style>
</head>
<body>

<h2>Cart Table</h2>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Item ID</th>
        <th>Quantity</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Cart> cartList = (List<Cart>) request.getAttribute("cartList");
        if (cartList != null && !cartList.isEmpty()) {
            for (Cart cart : cartList) {
    %>
    <tr>
        <td><%= cart.getId() %></td>
        <td><%= cart.getItemId() %></td>
        <td><%= cart.getQuantity() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="3">No cart records found.</td>
    </tr>
    <% } %>
    </tbody>
</table>

<div style="margin-top: 20px;">
    <a href="${pageContext.request.contextPath}/Admin/AdminHome.jsp">← Back to Dashboard</a>
</div>

</body>
</html>
