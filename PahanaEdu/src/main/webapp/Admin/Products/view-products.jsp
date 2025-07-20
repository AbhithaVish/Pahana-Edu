<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/19/2025
  Time: 10:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>View Products</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
  <link rel="icon" type="image/png" href="../../img/logo.jpg">
</head>
<body class="bg-gray-50 font-sans">

<!-- Mobile Toggle -->
<div class="md:hidden p-4">
  <button id="menu-toggle" class="text-2xl text-gray-700 focus:outline-none">
    <i class='bx bx-menu'></i>
  </button>
</div>

<!-- Main layout -->
<div class="flex min-h-screen">

  <!-- Sidebar Include -->
  <aside id="sidebar" class="w-64 bg-white border-r p-6 hidden md:block fixed md:static md:translate-x-0 transition-transform duration-300 ease-in-out z-40 h-screen">
    <jsp:include page="../NavigationBar/NavBar.jsp" />
  </aside>

  <!-- Page Content -->
  <main class="flex-1 ml-0 md:ml-64 p-6">

    <h1 class="text-3xl font-bold text-center text-green-700 mb-6">Product List</h1>

    <div class="overflow-x-auto bg-white shadow-md rounded-lg">
      <table class="min-w-full text-sm text-left text-gray-700 border border-gray-200">
        <thead class="bg-green-100 text-gray-800 uppercase text-xs">
        <tr>
          <th scope="col" class="px-6 py-3 border-b">ID</th>
          <th scope="col" class="px-6 py-3 border-b">Name</th>
          <th scope="col" class="px-6 py-3 border-b">Description</th>
          <th scope="col" class="px-6 py-3 border-b">Price (LKR)</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${productList}">
          <tr class="bg-white hover:bg-gray-50 border-t">
            <td class="px-6 py-4">${product.id}</td>
            <td class="px-6 py-4">${product.name}</td>
            <td class="px-6 py-4">${product.description}</td>
            <td class="px-6 py-4">${product.price}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>

    <div class="mt-6 text-center">
      <a href="../../admin-dashboard.jsp">
        <button class="bg-green-600 text-white px-6 py-2 rounded hover:bg-green-700 transition">Back to Dashboard</button>
      </a>
    </div>

  </main>
</div>

</body>
</html>
