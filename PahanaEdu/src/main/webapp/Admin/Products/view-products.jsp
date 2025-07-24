<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>View Products</title>
  <style>
    body { font-family: Arial, sans-serif; background-color: #f9f9f9; }
    table { width: 100%; border-collapse: collapse; background: #fff; }
    th, td { padding: 12px; border-bottom: 1px solid #ccc; text-align: left; }
    th { background-color: #f1f1f1; }
    .center { text-align: center; }
  </style>
</head>
<body>
<div class="p-8">
  <h1 class="text-2xl font-bold mb-6">Product View</h1>

  <table>
    <thead>
    <tr>
      <th>Name</th>
      <th>Description</th>
      <th>Price</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${products}">
      <tr>
        <td>${product.name}</td>
        <td>${product.description}</td>
        <td>$${product.price}</td>
      </tr>
    </c:forEach>

    <c:if test="${empty products}">
      <tr>
        <td colspan="3" class="center">No products found.</td>
      </tr>
    </c:if>
    </tbody>
  </table>

  <div class="mt-6 center">
    <a href="${pageContext.request.contextPath}/Admin/AdminHome.jsp" style="color: #007bff; text-decoration: none;">← Back to Dashboard</a>
  </div>
</div>
</body>
</html>
