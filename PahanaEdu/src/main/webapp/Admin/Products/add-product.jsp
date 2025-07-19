<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/19/2025
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add Product</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
<div class="w-full max-w-md bg-white rounded-lg shadow-md p-8">
  <h2 class="text-2xl font-bold mb-6 text-center">Add New Product</h2>

  <form action="${pageContext.request.contextPath}/addProduct" method="post" class="space-y-4">
    <input type="text" name="name" placeholder="Product Name" required
           class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
    <input type="text" name="description" placeholder="Description" required
           class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
    <input type="number" name="price" placeholder="Price" step="0.01" required
           class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
    <button type="submit" action="addProduct"
            class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700 transition">
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
    <a href="Admin/AdminHome.jsp" class="text-blue-500 hover:underline">← Back to Dashboard</a>
  </div>
</div>
</body>
</html>
