<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/19/2025
  Time: 10:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>View Products</title>
  <link rel="stylesheet" href="view_products.css">

</head>
<body>

<jsp:include page="../NavigationBar/NavBar.jsp" />

<div class="main_container">

  <div class="title">
    <h1>Product List</h1>
    <br><br>
  </div>

  <!-- Optional search bar -->
  <div class="search-bar">
    <label for="search">Search</label>
    <input type="text" id="search" class="search-select" placeholder="Product Name">
  </div>

  <!-- Product table -->

  <c:forEach var="product" items="${productList}">
    <tr>
      <td data-cell="ID">${product.id}</td>
      <td data-cell="Name">${product.name}</td>
      <td data-cell="Description">${product.description}</td>
      <td data-cell="Price">${product.price}</td>
    </tr>
  </c:forEach>


<%--  <div class="title" style="text-align: center; margin-top: 30px;">--%>
<%--    <a href="../../admin-dashboard.jsp">--%>
<%--      <button class="view-link">Back to Dashboard</button>--%>
<%--    </a>--%>
<%--  </div>--%>

</div>

<script>
  // Simple search functionality
  document.getElementById("search").addEventListener("input", function () {
    const searchQuery = this.value.toLowerCase();
    const rows = document.querySelectorAll("#product-tbody tr");
    rows.forEach(row => {
      const name = row.querySelector("td[data-cell='Name']").textContent.toLowerCase();
      row.style.display = name.includes(searchQuery) ? "" : "none";
    });
  });
</script>

</body>
</html>