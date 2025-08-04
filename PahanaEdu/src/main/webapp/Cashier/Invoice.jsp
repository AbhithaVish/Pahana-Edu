<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 8/4/2025
  Time: 7:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<CartItem> cart = (List<CartItem>) session.getAttribute("lastInvoice");
  String customer = (String) session.getAttribute("customerName");
  String mobile = (String) session.getAttribute("customerPhone");
%>
<html>
<head>
  <title>Invoice</title>
  <style>
    body { font-family: Arial; padding: 20px; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
    h2, h3 { text-align: center; }
    .right { text-align: right; }
    .btn { margin-top: 20px; }
  </style>
</head>
<body>
<h2>Pahana Edu - Invoice</h2>
<h3>Customer: <%= customer != null ? customer : "Walk-in" %> | Mobile: <%= mobile != null ? mobile : "-" %></h3>

<table>
  <thead>
  <tr><th>ID</th><th>Name</th><th>Qty</th><th>Price</th><th>Total</th></tr>
  </thead>
  <tbody>
  <%
    double grandTotal = 0;
    if (cart != null) {
      for (CartItem item : cart) {
        double total = item.getTotal();
        grandTotal += total;
  %>
  <tr>
    <td><%= item.getProduct().getId() %></td>
    <td><%= item.getProduct().getName() %></td>
    <td><%= item.getQuantity() %></td>
    <td>Rs. <%= String.format("%.2f", item.getProduct().getPrice()) %></td>
    <td>Rs. <%= String.format("%.2f", total) %></td>
  </tr>
  <%  } } %>
  </tbody>
</table>
<%
  double discount = session.getAttribute("discount") != null ? (double) session.getAttribute("discount") : 0.0;
  double serviceCharge = session.getAttribute("serviceCharge") != null ? (double) session.getAttribute("serviceCharge") : 0.0;
  double totalAmount = session.getAttribute("totalAmount") != null ? (double) session.getAttribute("totalAmount") : 0.0;
%>

<h3 class="right">Subtotal: Rs. <%= String.format("%.2f", grandTotal) %></h3>
<h3 class="right">Discount: Rs. <%= String.format("%.2f", discount) %></h3>
<h3 class="right">Service Charge: Rs. <%= String.format("%.2f", serviceCharge) %></h3>
<h2 class="right">Total: Rs. <%= String.format("%.2f", totalAmount) %></h2>

<div class="btn right">
  <button onclick="window.print()">🖨️ Print</button>
  <a href="billing.jsp">🔙 New Bill</a>
</div>
</body>
</html>
