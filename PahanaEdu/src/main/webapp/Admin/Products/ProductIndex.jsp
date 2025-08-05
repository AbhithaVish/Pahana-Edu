<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/26/2025
  Time: 9:40 AM
  To change this template use File | Settings | File Templates.
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.persistence.model.Products" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Product Management - Pahana Edu</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>

  <!-- Boxicons -->
  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

  <!-- Favicon -->
  <link rel="icon" type="image/png" href="../../img/logo.jpg">
</head>
<body class="bg-gray-100 font-sans">

<!-- Mobile Toggle -->
<div class="md:hidden p-4">
  <button id="menu-toggle" class="text-2xl text-gray-700 focus:outline-none">
    <i class='bx bx-menu'></i>
  </button>
</div>

<div class="flex min-h-screen">

  <!-- Sidebar -->
  <jsp:include page="../NavigationBar/NavBar.jsp" />

  <!-- Main Content -->
  <main class="flex-1 ml-0 md:ml-64 p-6">
    <div class="flex justify-between items-center mb-6">
      <h1 class="text-3xl font-bold text-green-700">Product List</h1>
      <a href="Admin/Products/ProductForm.jsp"
         class="inline-flex items-center bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 shadow text-sm">
        <i class='bx bx-plus mr-2'></i> Add New Product
      </a>
    </div>

    <!-- Product Table -->
    <div class="bg-white shadow-md rounded-lg overflow-x-auto">
      <table class="min-w-full">
        <thead class="bg-gray-200 text-gray-700 text-sm">
        <tr>
          <th class="text-left px-6 py-3 font-medium">ID</th>
          <th class="text-left px-6 py-3 font-medium">Name</th>
          <th class="text-left px-6 py-3 font-medium">Description</th>
          <th class="text-left px-6 py-3 font-medium">Price (USD)</th>
          <th class="text-left px-6 py-3 font-medium">Actions</th>
        </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200 text-sm">
        <%
          List<Products> productList = (List<Products>) request.getAttribute("productList");
          if (productList != null && !productList.isEmpty()) {
            for (Products p : productList) {
        %>
        <tr>
          <td class="px-6 py-4"><%= p.getId() %></td>
          <td class="px-6 py-4 font-medium text-gray-900"><%= p.getName() %></td>
          <td class="px-6 py-4 text-gray-700"><%= p.getDescription() %></td>
          <td class="px-6 py-4">$<%= String.format("%.2f", p.getPrice()) %></td>
          <td class="px-6 py-4">
            <div class="flex gap-2">
              <a href="<%= request.getContextPath() %>/edit-product?id=<%= p.getId() %>"
                 class="bg-blue-600 text-white px-3 py-1.5 rounded hover:bg-blue-700 text-xs">
                Edit
              </a>
              <a href="<%= request.getContextPath() %>/delete-product?id=<%= p.getId() %>"
                 onclick="return confirm('Are you sure you want to delete this product?');"
                 class="bg-red-600 text-white px-3 py-1.5 rounded hover:bg-red-700 text-xs">
                Delete
              </a>
            </div>
          </td>
        </tr>
        <%
          }
        } else {
        %>
        <tr>
          <td colspan="5" class="text-center px-6 py-4 text-gray-500">No products available.</td>
        </tr>
        <% } %>
        </tbody>
      </table>
    </div>

    <!-- Back to Dashboard -->
    <div class="mt-6">
      <a href="<%= request.getContextPath() %>/Admin/AdminHome.jsp"
         class="text-blue-600 hover:underline flex items-center gap-1 text-sm">
        <i class='bx bx-arrow-back'></i> Back to Dashboard
      </a>
    </div>
  </main>
</div>

<!-- JS for Toggle -->
<script>
  const toggle = document.getElementById('menu-toggle');
  const sidebar = document.getElementById('sidebar');
  toggle.addEventListener('click', () => {
    sidebar.classList.toggle('hidden');
  });
</script>

</body>
</html>