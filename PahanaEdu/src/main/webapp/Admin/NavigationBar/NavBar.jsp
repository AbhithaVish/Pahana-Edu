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

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Boxicons for icons -->
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">

    <!-- Favicon -->
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
            <a href="AdminHome.jsp" class="block font-semibold text-green-600 hover:text-green-800">
                <i class='bx bx-home mr-2'></i> Dashboard
            </a>
            <a href="#" class="block hover:text-green-800">
                <i class='bx bx-user mr-2'></i> Cashier
            </a>
            <a href="Admin/Products/add-product.jsp" class="block hover:text-green-800">
                <i class='bx bx-file mr-2'></i> Products
            </a>
            <a href="#" class="block hover:text-green-800">
                <i class='bx bx-cog mr-2'></i> Settings
            </a>
            <a href="login.jsp" class="block text-red-500 mt-10 hover:text-red-700">
                <i class='bx bx-log-out mr-2'></i> Logout
            </a>
        </nav>
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

