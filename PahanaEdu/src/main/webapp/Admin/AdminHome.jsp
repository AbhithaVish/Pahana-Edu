<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.persistence.dao.CustomerDAO" %>
<%@ page import="com.example.persistence.dao.AddProductDAO" %>
<%@ page import="com.example.persistence.dao.SaleItemDAO" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">
<div class="flex min-h-screen">

    <jsp:include page="NavigationBar/NavBar.jsp" />

    <main class="flex-1 p-8 overflow-y-auto">

        <div class="flex justify-between items-center mb-8">
            <h1 class="text-2xl font-bold">Admin Dashboard</h1>
            <div class="flex items-center gap-4">
                <%
                    String loggedInUser = (String) session.getAttribute("username");
                %>
                <span class="text-sm text-gray-600"><%= loggedInUser != null ? loggedInUser : "Admin" %></span>
                <div class="w-8 h-8 rounded-full bg-gray-300"></div>
            </div>
        </div>

        <%
            int totalCustomers = CustomerDAO.getTotalCustomers();
            int totalProducts = AddProductDAO.getTotalProducts();
            double totalSales = SaleItemDAO.getTotalSalesAmount();

            String formattedSales = "LKR " + String.format("%,.2f", totalSales);
        %>

        <!-- Summary Cards -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-white p-6 rounded-lg shadow">
                <h2 class="text-gray-500 text-sm mb-2">Total Customers</h2>
                <p class="text-2xl font-semibold"><%= totalCustomers %></p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow">
                <h2 class="text-gray-500 text-sm mb-2">Total Products</h2>
                <p class="text-2xl font-semibold"><%= totalProducts %></p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow">
                <h2 class="text-gray-500 text-sm mb-2">Total Sales</h2>
                <p class="text-2xl font-semibold"><%= formattedSales %></p>
            </div>
        </div>

        <!-- Buttons -->
        <div class="flex gap-4 mb-6">
            <a href="${pageContext.request.contextPath}/Admin/Products/add-product.jsp">
                <button class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">
                    Add Product
                </button>
            </a>

            <a href="${pageContext.request.contextPath}/view-products">
                <button class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">
                    Product View
                </button>
            </a>
            <a href="${pageContext.request.contextPath}/SalesReport">
                <button class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700">
                    SalesReport
                </button>
            </a>
        </div>

        <!-- Sales Chart Placeholder -->
        <div class="bg-white p-6 rounded-lg shadow mb-8">
            <h2 class="text-xl font-semibold mb-4">Monthly Sales Overview</h2>
            <div class="h-64 bg-gray-200 flex items-center justify-center text-gray-500">
                Chart Coming Soon...
            </div>
        </div>

    </main>
</div>
</body>
</html>
