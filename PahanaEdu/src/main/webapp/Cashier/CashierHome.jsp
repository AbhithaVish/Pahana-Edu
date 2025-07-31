<%--<%@ page import="com.example.persistence.model.CashierProduct" %>--%>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/18/2025
  Time: 8:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
<%--    List<com.example.persistence.model.CashierProduct> CashierProduct = (List<CashierProduct>) request.getAttribute("productView");--%>
<%--%>--%>
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

    <jsp:include page="NavigationBar/NavBar.jsp" />

<%--    <aside class="w-60 bg-white p-6 border-r">--%>
<%--        <div class="text-2xl font-bold text-green-600 mb-10">Pahana Edu</div>--%>
<%--        <%--%>
<%--            String loggedInUser = (String) session.getAttribute("username");--%>
<%--        %>--%>
<%--        <span class="text-sm text-gray-600"><%= loggedInUser != null ? loggedInUser : "Cashier" %></span>--%>

<%--        <nav class="space-y-4 text-gray-700">--%>
<%--            <a href="#" class="block font-semibold">Books</a>--%>
<%--            <a href="#" class="block">Orders</a>--%>
<%--            <a href="#" class="block">Sales History</a>--%>
<%--            <a href="#" class="block">Invoices</a>--%>
<%--            <a href="#" class="block">Settings</a>--%>
<%--            <a href="#" class="block text-red-500 mt-10">Logout</a>--%>
<%--        </nav>--%>
<%--    </aside>--%>

    <main class="flex-1 p-6">
        <div class="flex justify-between items-center mb-6">
            <input type="text" placeholder="Search books..." class="w-1/3 p-2 border rounded-lg" />
            <div class="flex items-center gap-4">
                <span class="text-sm text-gray-600">
                    <%
                        String loggedInUser = (String) session.getAttribute("username");
                    %>
                <span class="text-sm text-gray-600"><%= loggedInUser != null ? loggedInUser : "Cashiers" %></span>
                </span>
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

        <h2 class="text-lg font-semibold mb-4">Available Products</h2>
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white rounded shadow">
                <thead class="bg-green-200 text-gray-700">
                <tr>
                    <th class="text-left py-2 px-4">ID</th>
                    <th class="text-left py-2 px-4">Name</th>
                    <th class="text-left py-2 px-4">Description</th>
                    <th class="text-left py-2 px-4">Price (Rs)</th>
                    <th class="text-left py-2 px-4">Action</th>
                </tr>
                </thead>
<%--                <tbody>--%>
<%--                <% if (CashierProduct != null && !CashierProduct.isEmpty()) {--%>
<%--                    for (com.example.persistence.model.CashierProduct product : CashierProduct) { %>--%>
<%--                <tr class="border-t">--%>
<%--                    <td class="py-2 px-4"><%= product.getId() %></td>--%>
<%--                    <td class="py-2 px-4"><%= product.getName() %></td>--%>
<%--                    <td class="py-2 px-4"><%= product.getDescription() %></td>--%>
<%--                    <td class="py-2 px-4"><%= product.getPrice() %></td>--%>
<%--                    <td class="py-2 px-4">--%>
<%--                        <form method="post" action="AddToCartServlet">--%>
<%--                            <input type="hidden" name="id" value="<%= product.getId() %>">--%>
<%--                            <input type="hidden" name="name" value="<%= product.getName() %>">--%>
<%--                            <input type="hidden" name="price" value="<%= product.getPrice() %>">--%>
<%--                            <button type="submit" class="bg-green-500 text-white px-3 py-1 rounded hover:bg-green-600">Add</button>--%>
<%--                        </form>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <%  }--%>
<%--                } else { %>--%>
<%--                <tr>--%>
<%--                    <td colspan="5" class="text-center py-4 text-gray-500">No products found.</td>--%>
<%--                </tr>--%>
<%--                <% } %>--%>
<%--                </tbody>--%>
            </table>
        </div>


    </main>

<%--    <aside class="w-96 bg-white border-l p-6">--%>
<%--        <div class="mb-4">--%>
<%--            <h3 class="text-md font-semibold">Cart Summary</h3>--%>
<%--            <p class="text-sm text-gray-600">Customer: Michael Fernando</p>--%>
<%--            <p class="text-xs text-gray-400">Mobile: +94 77 123 4567</p>--%>
<%--        </div>--%>

<%--        <div class="mb-4">--%>
<%--            <div class="flex items-center justify-between gap-2">--%>
<%--                <span class="text-xs bg-gray-200 rounded-full px-3 py-1">Walk-In</span>--%>
<%--                <span class="text-xs bg-gray-100 rounded-full px-3 py-1">Phone Order</span>--%>
<%--                <span class="text-xs bg-gray-100 rounded-full px-3 py-1">Online</span>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="space-y-4 max-h-64 overflow-y-auto mb-6">--%>
<%--            <div>--%>
<%--                <p class="text-sm text-gray-600">Category: Fiction</p>--%>
<%--                <div class="flex justify-between">--%>
<%--                    <span>The Great Gatsby</span>--%>
<%--                    <span>Rs. 1,200.00</span>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <p class="text-sm text-gray-600">Category: Academic</p>--%>
<%--                <div class="flex justify-between">--%>
<%--                    <span>Mathematics Grade 11</span>--%>
<%--                    <span>Rs. 950.00</span>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <p class="text-sm text-gray-600">Category: Children</p>--%>
<%--                <div class="flex justify-between">--%>
<%--                    <span>My First ABC</span>--%>
<%--                    <span>Rs. 650.00</span>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="space-y-2 text-sm mb-6">--%>
<%--            <div class="flex justify-between">--%>
<%--                <span>Subtotal</span>--%>
<%--                <span>Rs. 2,800.00</span>--%>
<%--            </div>--%>
<%--            <div class="flex justify-between">--%>
<%--                <span>Discount</span>--%>
<%--                <span>-Rs. 200.00</span>--%>
<%--            </div>--%>
<%--            <div class="flex justify-between">--%>
<%--                <span>Service Charge</span>--%>
<%--                <span>Rs. 0.00</span>--%>
<%--            </div>--%>
<%--            <div class="flex justify-between font-semibold">--%>
<%--                <span>Total</span>--%>
<%--                <span>Rs. 2,600.00</span>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="flex justify-between gap-2">--%>
<%--            <button class="bg-yellow-500 text-white w-1/2 py-2 rounded hover:bg-yellow-600">Print</button>--%>
<%--            <button class="bg-red-500 text-white w-1/2 py-2 rounded hover:bg-red-600">Cancel</button>--%>
<%--        </div>--%>
<%--        <button class="mt-4 w-full bg-green-600 text-white py-2 rounded hover:bg-green-700">--%>
<%--            Charge Rs. 2,600.00--%>
<%--        </button>--%>
<%--    </aside>--%>
</div>
</body>
</html>
