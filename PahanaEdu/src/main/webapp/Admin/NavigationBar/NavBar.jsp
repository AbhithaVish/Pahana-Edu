<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/19/2025
  Time: 3:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PahanaEdu Admin Dashboard</title>
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
    <aside id="sidebar" class="w-64 bg-white border-r p-6 fixed top-0 bottom-0 left-0 hidden md:flex flex-col z-40 overflow-y-auto">
        <div class="text-2xl font-bold text-green-600 mb-10">Pahana Edu Admin</div>
        <nav class="space-y-4 text-gray-700 flex-grow overflow-y-auto">
            <a href="${pageContext.request.contextPath}/Admin/AdminHome.jsp" class="block font-semibold text-green-600 hover:text-green-800">
                <i class='bx bx-home mr-2'></i> Dashboard
            </a>
            <a href="${pageContext.request.contextPath}/Admin/Products/add-product.jsp" class="block hover:text-green-800">
                <i class='bx bx-file mr-2'></i> Add Products
            </a>
            <a href="${pageContext.request.contextPath}/view-products" class="block hover:text-green-800">
                <i class='bx bx-file mr-2'></i> View Products
            </a>
            <a href="${pageContext.request.contextPath}/SalesReport" class="block hover:text-green-800">
                <i class='bx bx-cog mr-2'></i> Sales
            </a>
            <a href="${pageContext.request.contextPath}/Admin/help.jsp" class="block hover:text-green-800">
                <i class='bx bx-file mr-2'></i> Help
            </a>
            <a href="${pageContext.request.contextPath}login.jsp" class="block text-red-500 mt-10 hover:text-red-700">
                <i class='bx bx-log-out mr-2'></i> Logout
            </a>
        </nav>
        <!-- Footer pinned to bottom -->
        <footer class="text-center text-gray-500 text-sm py-6 border-t border-gray-800 mt-auto">
            © 2025 Pahana Edu. All Rights Reserved.
        </footer>
    </aside>
    </main>
</div>

<!-- JavaScript for Sidebar Toggle -->
<script>
    const toggle = document.getElementById('menu-toggle');
    const sidebar = document.getElementById('sidebar');

    toggle.addEventListener('click', () => {
        sidebar.classList.toggle('hidden');
    });
</script>

</body>
</html>

