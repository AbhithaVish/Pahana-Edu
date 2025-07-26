<%@ page import="com.example.Business.items.dto.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
  System.out.println("=== JSP Debug Info ===");
  List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
  System.out.println("Products attribute: " + products);
  if (products != null) {
    System.out.println("Products size: " + products.size());
  } else {
    System.out.println("Products is null!");
  }
  System.out.println("Error attribute: " + request.getAttribute("error"));
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>View Products - Debug</title>
  <style>
    body { font-family: Arial, sans-serif; background-color: #f9f9f9; margin: 20px; }
    .debug { background: #ffffcc; padding: 10px; margin: 10px 0; border: 1px solid #ccc; }
    table { width: 100%; border-collapse: collapse; background: #fff; margin: 20px 0; }
    th, td { padding: 12px; border: 1px solid #ccc; text-align: left; }
    th { background-color: #f1f1f1; }
    .center { text-align: center; }
    .error { color: red; background: #ffe6e6; padding: 10px; margin: 10px 0; }
  </style>
</head>
<body>
<h1>Product View - Debug Mode</h1>
<div class="debug">
  <h3>Debug Information:</h3>
  <p><strong>Products attribute exists:</strong> ${products != null ? 'Yes' : 'No'}</p>
  <p><strong>Products size:</strong> ${products != null ? products.size() : 'N/A'}</p>
  <p><strong>Error message:</strong> ${error != null ? error : 'None'}</p>
</div>

<c:if test="${not empty error}">
  <div class="error">
    <strong>Error:</strong> ${error}
  </div>
</c:if>

<h2>Products Table</h2>
<table>
  <thead>
  <tr>
    <th>Name</th>
    <th>Description</th>
    <th>Price</th>
  </tr>
  </thead>
  <tbody>
  <c:choose>
    <c:when test="${empty products}">
      <tr>
        <td colspan="3" class="center">
          <strong>No products found or products list is empty</strong>
        </td>
      </tr>
    </c:when>
    <c:otherwise>
      <c:forEach var="product" items="${products}" varStatus="status">
        <tr>
          <td>${product.name}</td>
          <td>${product.description}</td>
          <td>$${product.price}</td>
        </tr>
      </c:forEach>
    </c:otherwise>
  </c:choose>
  </tbody>
</table>

<div style="margin-top: 20px;">
  <a href="${pageContext.request.contextPath}/Admin/AdminHome.jsp">← Back to Dashboard</a>
</div>
</body>
</html>