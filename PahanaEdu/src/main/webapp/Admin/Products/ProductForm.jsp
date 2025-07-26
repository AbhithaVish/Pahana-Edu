<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/26/2025
  Time: 12:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.Product" %>
<%
  Product product = (Product) request.getAttribute("product");
  boolean isEdit = (product != null);
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title><%= isEdit ? "Edit Product" : "Add Product" %></title>
  <style>
    body { font-family: Arial, sans-serif; background: #f4f4f4; padding: 30px; }
    .form-container {
      max-width: 500px;
      margin: auto;
      background: white;
      padding: 20px;
      border-radius: 8px;
    }
    label { display: block; margin-top: 10px; }
    input, textarea {
      width: 100%; padding: 8px; margin-top: 5px; box-sizing: border-box;
    }
    button {
      margin-top: 20px; padding: 10px 20px;
      background: #007bff; color: white; border: none;
      border-radius: 4px; cursor: pointer;
    }
  </style>
</head>
<body>

<div class="form-container">
  <h2><%= isEdit ? "Edit Product" : "Add New Product" %></h2>

  <form method="post" action="<%= isEdit ? request.getContextPath() + "/edit-product" : request.getContextPath() + "/add-product" %>">
    <% if (isEdit) { %>
    <input type="hidden" name="id" value="<%= product.getId() %>" />
    <% } %>

    <label for="name">Name:</label>
    <input type="text" name="name" id="name" required value="<%= isEdit ? product.getName() : "" %>" />

    <label for="description">Description:</label>
    <textarea name="description" id="description" rows="3" required><%= isEdit ? product.getDescription() : "" %></textarea>

    <label for="price">Price (USD):</label>
    <input type="number" name="price" id="price" step="0.01" required value="<%= isEdit ? product.getPrice() : "" %>" />

    <button type="submit"><%= isEdit ? "Update Product" : "Add Product" %></button>
  </form>

  <div style="margin-top: 20px;">
    <a href="${pageContext.request.contextPath}/view-products">
  </div>
</div>

</body>
</html>
