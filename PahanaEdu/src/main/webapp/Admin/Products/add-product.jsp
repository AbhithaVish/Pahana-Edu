<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/19/2025
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Product</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
</head>
<body class="bg-gray-50 font-sans">

<!-- Mobile Toggle Button -->
<div class="md:hidden p-4">
  <button id="menu-toggle" class="text-2xl text-gray-700 focus:outline-none">
    <i class='bx bx-menu'></i>
  </button>
</div>

<div class="flex min-h-screen">

  <jsp:include page="../NavigationBar/NavBar.jsp" />

  <!-- Main content -->
  <main class="flex-1 ml-0 md:ml-64 p-6">
    <div class="max-w-md mx-auto bg-white rounded-lg shadow-md p-8">
      <h2 class="text-2xl font-bold mb-6 text-center">Add New Product</h2>

      <form action="${pageContext.request.contextPath}/addProduct" method="post" class="space-y-4">
        <input type="text" name="name" placeholder="Product Name" required
               class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
        <input type="text" name="description" placeholder="Description" required
               class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
        <input type="number" name="price" placeholder="Price" step="0.01" required
               class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
        <button type="submit" class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700 transition">
          Add Product
        </button>

        <c:if test="${status == 'success'}">
          <p class="text-green-600 text-sm text-center mt-2">Product added successfully!</p>
        </c:if>
        <c:if test="${status == 'failed'}">
          <p class="text-red-600 text-sm text-center mt-2">Failed to add product. Try again.</p>
        </c:if>
      </form>

      <div class="mt-6 text-center">
        <a href="${pageContext.request.contextPath}/Admin/AdminHome.jsp" class="text-blue-500 hover:underline">← Back to Dashboard</a>
      </div>
    </div>
  </main>
</div>
</body>
</html>
