<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/26/2025
  Time: 9:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Product" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Product List</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f8f9fa;
      padding: 30px;
    }
    h2 {
      text-align: center;
      margin-bottom: 30px;
    }
    .btn {
      padding: 6px 12px;
      border: none;
      border-radius: 4px;
      text-decoration: none;
      font-size: 14px;
      color: #fff;
      cursor: pointer;
      margin-right: 5px;
    }
    .btn-add { background-color: #28a745; }
    .btn-edit { background-color: #007bff; }
    .btn-delete { background-color: #dc3545; }
    table {
      width: 100%;
      border-collapse: collapse;
      background: #fff;
    }
    th, td {
      padding: 12px;
      border: 1px solid #dee2e6;
      text-align: left;
    }
    th {
      background-color: #f1f1f1;
    }
    .actions {
      display: flex;
    }
  </style>
</head>
<body>

<h2>Product List</h2>

<div style="margin-bottom: 20px;">
  <a href="Admin/Products/ProductForm.jsp" class="btn btn-add">+ Add New Product</a>
</div>

<table>
  <thead>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Description</th>
    <th>Price (USD)</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <%
    List<Product> productList = (List<Product>) request.getAttribute("productList");
    if (productList != null && !productList.isEmpty()) {
      for (Product p : productList) {
  %>
  <tr>
    <td><%= p.getId() %></td>
    <td><%= p.getName() %></td>
    <td><%= p.getDescription() %></td>
    <td>$<%= String.format("%.2f", p.getPrice()) %></td>
    <td class="actions">
      <a href="<%= request.getContextPath() %>/edit-product?id=<%= p.getId() %>" class="btn btn-edit">Edit</a>
      <a href="<%= request.getContextPath() %>/delete-product?id=<%= p.getId() %>"
         class="btn btn-delete"
         onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
    </td>
  </tr>
  <%
    }
  } else {
  %>
  <tr>
    <td colspan="5" style="text-align:center;">No products available.</td>
  </tr>
  <% } %>
  </tbody>
</table>

<div style="margin-top: 30px;">
  <a href="<%= request.getContextPath() %>/Admin/AdminHome.jsp">← Back to Dashboard</a>
</div>

</body>
</html>
