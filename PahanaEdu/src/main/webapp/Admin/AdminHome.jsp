<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/18/2025
  Time: 8:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <script src="https://cdn.tailwindcss.com"></script>--%>
</head>
<body class="bg-gray-50 font-sans">
<div class="flex min-h-screen">

<%--    <jsp:include page="NavigationBar/NavBar.jsp" />--%>

    <main class="flex-1 p-8 overflow-y-auto">

        <div class="flex justify-between items-center mb-8">
            <h1 class="text-2xl font-bold">Welcome Admin</h1>
            <div class="flex items-center gap-4">
                <%
                    String loggedInUser = (String) session.getAttribute("username");
                %>
                <span class="text-sm text-gray-600"><%= loggedInUser != null ? loggedInUser : "Admin" %></span>
                <div class="w-8 h-8 rounded-full bg-gray-300"></div>
            </div>
        </div>

        <!-- Cards-->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-white p-6 rounded-lg shadow">
                <h2 class="text-gray-500 text-sm mb-2">Total Users</h2>
                <p class="text-2xl font-semibold">1,254</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow">
                <h2 class="text-gray-500 text-sm mb-2">Monthly Sales</h2>
                <p class="text-2xl font-semibold">$24,390</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow">
                <h2 class="text-gray-500 text-sm mb-2">Active Sessions</h2>
                <p class="text-2xl font-semibold">82</p>
            </div>
        </div>

        <!-- Add Product Button -->
        <div class="mb-4">
            <a href="${pageContext.request.contextPath}/Admin/Products/add-product.jsp">
            <button class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">
                    Add Product
                </button>
            </a>
        </div>

        <!-- View Product Button -->
        <div class="mb-4">
            <a href="${pageContext.request.contextPath}/view-products">
                <button class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">
                    Product View
                </button>
            </a>
        </div>

        <!-- Placeholder for other sections like product list -->
    </main>
</div>
</body>
</html>

