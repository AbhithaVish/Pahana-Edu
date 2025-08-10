<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/26/2025
  Time: 9:40 AM
  To change this template use File | Settings | File Templates.
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
--%><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.persistence.model.Products" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Product Management - Pahana Edu</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
  <link rel="icon" type="image/png" href="../../img/logo.jpg">
</head>
<body class="bg-gray-50 font-sans">

<!-- Mobile Toggle Button -->
<div class="md:hidden p-4">
  <button id="menu-toggle" class="text-2xl text-gray-700 focus:outline-none">
    <i class='bx bx-menu'></i>
  </button>
</div>

<div class="flex min-h-screen">
  <!-- Sidebar -->
  <aside id="sidebar" class="w-64 bg-white border-r p-6 hidden md:block fixed md:static md:translate-x-0 transition-transform duration-300 ease-in-out z-40 h-screen">
    <div class="text-2xl font-bold text-green-600 mb-10">Pahana Edu Admin</div>
    <nav class="space-y-4 text-gray-700">
      <a href="${pageContext.request.contextPath}/Admin/AdminHome.jsp" class="block font-semibold text-green-600 hover:text-green-800">
        <i class='bx bx-home mr-2'></i> Dashboard
      </a>
      <a href="${pageContext.request.contextPath}/Admin/Products/add-product.jsp" class="block hover:text-green-800">
        <i class='bx bx-file mr-2'></i> Add Products
      </a>
      <a href="${pageContext.request.contextPath}/view-products" class="block hover:text-green-800">
        <i class='bx bx-file mr-2'></i> View Products
      </a>
      <a href="#" class="block hover:text-green-800">
        <i class='bx bx-cog mr-2'></i> Sales
      </a>
      <a href="login.jsp" class="block text-red-500 mt-10 hover:text-red-700">
        <i class='bx bx-log-out mr-2'></i> Logout
      </a>
    </nav>
  </aside>

  <!-- Main Content -->
  <main class="flex-1 ml-0 md:ml-4 p-6">
    <div class="flex justify-between items-center mb-6">
      <h1 class="text-3xl font-bold text-green-700">Product List</h1>
      <a href="${pageContext.request.contextPath}/Admin/Products/add-product.jsp"
         class="inline-flex items-center bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 shadow text-sm">
        <i class='bx bx-plus mr-2'></i> Add New Product
      </a>
    </div>

    <!-- Product Grid -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
      <%
        List<Products> productList = (List<Products>) request.getAttribute("productList");
        if (productList != null && !productList.isEmpty()) {
          for (Products p : productList) {
      %>
      <div class="bg-white rounded-xl shadow-md p-4 hover:shadow-lg transition duration-200">
        <div class="flex justify-between items-center mb-2">
          <h2 class="text-lg font-semibold text-gray-800"><%= p.getName() %></h2>
          <span class="text-sm bg-green-100 text-green-700 px-2 py-1 rounded-full"><%= p.getCategory() %></span>
        </div>
        <p class="text-gray-500 text-sm mb-2"><%= p.getDescription() %></p>
        <p class="text-gray-700 font-bold text-lg mb-2">$<%= String.format("%.2f", p.getPrice()) %></p>
        <p class="text-sm text-gray-600 mb-4">Qty: <%= p.getQuantity() %></p>

        <div class="flex justify-between">
          <a href="<%= request.getContextPath() %>/edit-product?id=<%= p.getId() %>"
             class="bg-blue-600 text-white px-3 py-1.5 rounded hover:bg-blue-700 text-xs">Edit</a>
          <a href="<%= request.getContextPath() %>/delete-product?id=<%= p.getId() %>"
             onclick="return confirm('Are you sure you want to delete this product?');"
             class="bg-red-600 text-white px-3 py-1.5 rounded hover:bg-red-700 text-xs">Delete</a>
        </div>
      </div>
      <%
        }
      } else {
      %>
      <div class="col-span-full text-center text-gray-500 text-lg">
        No products available.
      </div>
      <% } %>
    </div>

    <!-- Back Button -->
    <div class="mt-6">
      <a href="${pageContext.request.contextPath}/Admin/AdminHome.jsp"
         class="text-blue-600 hover:underline flex items-center gap-1 text-sm">
        <i class='bx bx-arrow-back'></i> Back to Dashboard
      </a>
    </div>
  </main>
</div>

<!-- Sidebar toggle script -->
<script>
  const toggle = document.getElementById('menu-toggle');
  const sidebar = document.getElementById('sidebar');
  toggle.addEventListener('click', () => {
    sidebar.classList.toggle('hidden');
  });
</script>

</body>
</html>
