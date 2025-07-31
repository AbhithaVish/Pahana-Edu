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
            <aside class="w-60 bg-white p-6 border-r">
                <div class="text-2xl font-bold text-green-600 mb-10">Pahana Edu</div>
<%--                <%--%>
<%--                    String loggedInUser = (String) session.getAttribute("username");--%>
<%--                %>--%>
<%--                <span class="text-sm text-gray-600"><%= loggedInUser != null ? loggedInUser : "Cashiers" %></span>--%>

                <nav class="space-y-4 text-gray-700">
                    <a href="CashierHome" class="block font-semibold">Dashboard</a>
                    <a href="${pageContext.request.contextPath}/billing" class="block">Billing</a>
                    <a href="#" class="block">Sales History</a>
                    <a href="#" class="block">Invoices</a>
                    <a href="#" class="block">Settings</a>
                    <a href="#" class="block text-red-500 mt-10">Logout</a>
                </nav>
            </aside>
                </main>
        </div>

<script>
    const toggle = document.getElementById('menu-toggle');
    const sidebar = document.getElementById('sidebar');

    toggle.addEventListener('click', () => {
        sidebar.classList.toggle('hidden');
    });
</script>

</body>
</html>

