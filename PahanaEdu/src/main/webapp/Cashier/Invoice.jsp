<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 8/4/2025
  Time: 7:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.persistence.model.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<CartItem> cart = (List<CartItem>) session.getAttribute("lastInvoice");
  String customer = (String) session.getAttribute("customerName");
  String mobile = (String) session.getAttribute("customerPhone");
  double discount = session.getAttribute("discount") != null ? (double) session.getAttribute("discount") : 0.0;
  double serviceCharge = session.getAttribute("serviceCharge") != null ? (double) session.getAttribute("serviceCharge") : 0.0;
  double totalAmount = session.getAttribute("totalAmount") != null ? (double) session.getAttribute("totalAmount") : 0.0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Invoice - Pahana Edu</title>
  <style>
    body {
      background-color: #1a202c;
      color: white;
      font-family: Arial, sans-serif;
      padding: 20px;
      margin: 0;
    }
    .container {
      max-width: 800px;
      margin: 0 auto;
      background-color: #2d3748;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      padding: 24px;
    }
    @media print {
      body {
        background-color: white;
        color: black;
      }
      .container {
        background-color: white;
        box-shadow: none;
        padding: 0;
      }
      .no-print {
        display: none;
      }
    }
    .header {
      text-align: center;
      margin-bottom: 24px;
    }
    .header h1 {
      font-size: 24px;
      font-weight: bold;
    }
    .header p {
      font-size: 16px;
      margin-top: 8px;
    }
    .header span {
      font-weight: 500;
    }
    .table-container {
      overflow-x: auto;
      border-radius: 8px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      font-size: 14px;
    }
    th, td {
      padding: 8px;
      border: 1px solid #4a5568;
      text-align: left;
    }
    th {
      background-color: #4a5568;
      text-transform: uppercase;
      font-size: 12px;
    }
    @media print {
      th, td {
        border: 1px solid black;
      }
      th {
        background-color: #f7fafc;
        color: black;
      }
    }
    .totals {
      margin-top: 24px;
      text-align: right;
      font-size: 16px;
    }
    .totals p {
      margin: 4px 0;
    }
    .totals .font-bold {
      font-weight: bold;
      font-size: 20px;
      margin-top: 8px;
    }
    .buttons {
      margin-top: 32px;
      display: flex;
      justify-content: space-between;
    }
    .buttons button, .buttons a {
      padding: 10px 20px;
      border-radius: 4px;
      text-decoration: none;
      color: white;
      font-weight: 500;
      cursor: pointer;
    }
    .buttons button {
      background-color: #4c51bf;
    }
    .buttons button:hover {
      background-color: #5a67d8;
    }
    .buttons a {
      background-color: #4a5568;
    }
    .buttons a:hover {
      background-color: #718096;
    }
  </style>
</head>
<body>
<div class="container">
  <!-- Header -->
  <div class="header">
    <h1>🧾 Pahana Edu - Invoice</h1>
    <p>Customer: <span><%= customer != null ? customer : "Walk-in" %></span></p>
    <p>Mobile: <span><%= mobile != null ? mobile : "-" %></span></p>
  </div>

  <!-- Invoice Table -->
  <div class="table-container">
    <table>
      <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Qty</th>
        <th>Price</th>
        <th>Total</th>
      </tr>
      </thead>
      <tbody>
      <%
        double grandTotal = 0;
        if (cart != null) {
          for (CartItem item : cart) {
            double rowTotal = item.getTotal();
            grandTotal += rowTotal;
      %>
      <tr>
        <td><%= item.getProduct().getId() %></td>
        <td><%= item.getProduct().getName() %></td>
        <td><%= item.getQuantity() %></td>
        <td>Rs. <%= String.format("%.2f", item.getProduct().getPrice()) %></td>
        <td>Rs. <%= String.format("%.2f", rowTotal) %></td>
      </tr>
      <% } } %>
      </tbody>
    </table>
  </div>

  <!-- Totals -->
  <div class="totals">
    <p>Subtotal: <span>Rs. <%= String.format("%.2f", grandTotal) %></span></p>
    <p>Discount: <span>Rs. <%= String.format("%.2f", discount) %></span></p>
    <p>Service Charge: <span>Rs. <%= String.format("%.2f", serviceCharge) %></span></p>
    <p class="font-bold">Total: Rs. <%= String.format("%.2f", totalAmount) %></p>
  </div>

  <!-- Buttons -->
  <div class="buttons no-print">
    <button onclick="window.print()">🖨️ Print Invoice</button>
    <a href="billing.jsp">🔄 New Bill</a>
  </div>
</div>

<script>
  window.onload = function() {
    window.print();
  };
</script>
</body>
</html>