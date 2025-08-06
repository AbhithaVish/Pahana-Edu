<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/26/2025
  Time: 12:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%-- Created by IntelliJ IDEA. User: abhit Date: 7/26/2025 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.persistence.model.Products" %>
<%
  Products product = (Products) request.getAttribute("product");
  boolean isEdit = (product != null);
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title><%= isEdit ? "Edit Product" : "Add Product" %></title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f4f4f4;
      padding: 30px;
      margin: 0;
    }

    .form-container {
      width: 100%;
      max-width: none;
      background: white;
      padding: 20px;
      border-radius: 8px;
    }

    label {
      display: block;
      margin-top: 10px;
    }

    input, textarea {
      width: 100%;
      padding: 8px;
      margin-top: 5px;
      box-sizing: border-box;
    }

    button {
      margin-top: 20px;
      padding: 10px 20px;
      background: #007bff;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
  </style>
</head>
<body>
<jsp:include page="../NavigationBar/NavBar.jsp" />

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

    <label for="category">Category:</label>
    <input type="text" name="category" id="category" required value="<%= isEdit ? product.getCategory() : "" %>" />

    <label for="quantity">Quantity:</label>
    <input type="number" name="quantity" id="quantity" min="0" required value="<%= isEdit ? product.getQuantity() : "0" %>" />

    <label for="price">Price (USD):</label>
    <input type="number" name="price" id="price" step="0.01" required value="<%= isEdit ? product.getPrice() : "" %>" />

    <button type="submit"><%= isEdit ? "Update Product" : "Add Product" %></button>
  </form>

  <div style="margin-top: 20px;">
    <a href="${pageContext.request.contextPath}/view-products">← Back to Product List</a>
  </div>
</div>
</body>
</html>
