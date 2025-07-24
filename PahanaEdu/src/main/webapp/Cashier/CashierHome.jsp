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
    <title>Cashier Dashboard - Pahana Edu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-green-50 font-sans">
<div class="flex min-h-screen">

    <aside class="w-60 bg-white p-6 border-r">
        <div class="text-2xl font-bold text-green-600 mb-10">Pahana Edu</div>
        <%
            String loggedInUser = (String) session.getAttribute("username");
        %>
        <span class="text-sm text-gray-600"><%= loggedInUser != null ? loggedInUser : "Cashier" %></span>

        <nav class="space-y-4 text-gray-700">
            <a href="#" class="block font-semibold">Books</a>
            <a href="#" class="block">Orders</a>
            <a href="#" class="block">Sales History</a>
            <a href="#" class="block">Invoices</a>
            <a href="#" class="block">Settings</a>
            <a href="#" class="block text-red-500 mt-10">Logout</a>
        </nav>
    </aside>

    <main class="flex-1 p-6">
        <div class="flex justify-between items-center mb-6">
            <input type="text" placeholder="Search books..." class="w-1/3 p-2 border rounded-lg" />
            <div class="flex items-center gap-4">
                <span class="text-sm text-gray-600">Cashier</span>
                <div class="w-8 h-8 rounded-full bg-gray-300"></div>
            </div>
        </div>

        <div class="flex gap-4 mb-6">
            <button class="bg-green-100 text-green-600 px-4 py-2 rounded-full">Fiction</button>
            <button class="bg-gray-100 px-4 py-2 rounded-full">Non-fiction</button>
            <button class="bg-gray-100 px-4 py-2 rounded-full">Comics</button>
            <button class="bg-gray-100 px-4 py-2 rounded-full">Children</button>
            <button class="bg-gray-100 px-4 py-2 rounded-full">Academic</button>
            <button class="bg-gray-100 px-4 py-2 rounded-full">Magazines</button>
        </div>

        <h2 class="text-lg font-semibold mb-4">Featured Books</h2>
        <div class="grid grid-cols-4 gap-6">
            <div class="bg-white p-4 rounded-xl shadow">
                <img src="https://via.placeholder.com/100x140?text=Book" class="mx-auto mb-4" alt="Book 1">
                <h3 class="text-center text-sm font-medium mb-2">Learn Java in 24 Hours</h3>
                <button class="w-full bg-green-500 hover:bg-green-600 text-white py-1 rounded">ADD</button>
            </div>
            <div class="bg-white p-4 rounded-xl shadow">
                <img src="https://via.placeholder.com/100x140?text=Book" class="mx-auto mb-4" alt="Book 2">
                <h3 class="text-center text-sm font-medium mb-2">Python for Beginners</h3>
                <button class="w-full bg-green-500 hover:bg-green-600 text-white py-1 rounded">ADD</button>
            </div>
            <div class="bg-white p-4 rounded-xl shadow">
                <img src="https://via.placeholder.com/100x140?text=Book" class="mx-auto mb-4" alt="Book 3">
                <h3 class="text-center text-sm font-medium mb-2">Digital Marketing 101</h3>
                <button class="w-full bg-green-500 hover:bg-green-600 text-white py-1 rounded">ADD</button>
            </div>
            <div class="bg-white p-4 rounded-xl shadow">
                <img src="https://via.placeholder.com/100x140?text=Book" class="mx-auto mb-4" alt="Book 4">
                <h3 class="text-center text-sm font-medium mb-2">Children’s Stories Vol. 1</h3>
                <button class="w-full bg-green-500 hover:bg-green-600 text-white py-1 rounded">ADD</button>
            </div>
        </div>
    </main>

    <aside class="w-96 bg-white border-l p-6">
        <div class="mb-4">
            <h3 class="text-md font-semibold">Cart Summary</h3>
            <p class="text-sm text-gray-600">Customer: Michael Fernando</p>
            <p class="text-xs text-gray-400">Mobile: +94 77 123 4567</p>
        </div>

        <div class="mb-4">
            <div class="flex items-center justify-between gap-2">
                <span class="text-xs bg-gray-200 rounded-full px-3 py-1">Walk-In</span>
                <span class="text-xs bg-gray-100 rounded-full px-3 py-1">Phone Order</span>
                <span class="text-xs bg-gray-100 rounded-full px-3 py-1">Online</span>
            </div>
        </div>

        <div class="space-y-4 max-h-64 overflow-y-auto mb-6">
            <div>
                <p class="text-sm text-gray-600">Category: Fiction</p>
                <div class="flex justify-between">
                    <span>The Great Gatsby</span>
                    <span>Rs. 1,200.00</span>
                </div>
            </div>
            <div>
                <p class="text-sm text-gray-600">Category: Academic</p>
                <div class="flex justify-between">
                    <span>Mathematics Grade 11</span>
                    <span>Rs. 950.00</span>
                </div>
            </div>
            <div>
                <p class="text-sm text-gray-600">Category: Children</p>
                <div class="flex justify-between">
                    <span>My First ABC</span>
                    <span>Rs. 650.00</span>
                </div>
            </div>
        </div>

        <div class="space-y-2 text-sm mb-6">
            <div class="flex justify-between">
                <span>Subtotal</span>
                <span>Rs. 2,800.00</span>
            </div>
            <div class="flex justify-between">
                <span>Discount</span>
                <span>-Rs. 200.00</span>
            </div>
            <div class="flex justify-between">
                <span>Service Charge</span>
                <span>Rs. 0.00</span>
            </div>
            <div class="flex justify-between font-semibold">
                <span>Total</span>
                <span>Rs. 2,600.00</span>
            </div>
        </div>

        <div class="flex justify-between gap-2">
            <button class="bg-yellow-500 text-white w-1/2 py-2 rounded hover:bg-yellow-600">Print</button>
            <button class="bg-red-500 text-white w-1/2 py-2 rounded hover:bg-red-600">Cancel</button>
        </div>
        <button class="mt-4 w-full bg-green-600 text-white py-2 rounded hover:bg-green-700">
            Charge Rs. 2,600.00
        </button>
    </aside>
</div>
</body>
</html>
