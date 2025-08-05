<%@ page import="com.example.persistence.model.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    // Get the logged-in username from session
    HttpSession userSession = request.getSession(false);
    String username = null;
    if (userSession != null) {
        username = (String) userSession.getAttribute("username");
    } else {
        response.sendRedirect("login.jsp"); // Redirect if session is invalid
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>POS Billing</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        function addItem() {
            const id = document.getElementById("productId").value;
            const qty = document.getElementById("quantity").value;

            if (!id || !qty) {
                alert("Enter Product ID and Quantity");
                return;
            }

            const form = document.createElement("form");
            form.method = "post";
            form.action = "add-to-cart";

            const idInput = document.createElement("input");
            idInput.type = "hidden";
            idInput.name = "id";
            idInput.value = id;

            const qtyInput = document.createElement("input");
            qtyInput.type = "hidden";
            qtyInput.name = "quantity";
            qtyInput.value = qty;

            form.appendChild(idInput);
            form.appendChild(qtyInput);
            document.body.appendChild(form);
            form.submit();
        }
    </script>
</head>
<body class="bg-gray-900 text-white min-h-screen p-6 font-sans">

<div class="max-w-5xl mx-auto">

    <!-- Header -->
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-3xl font-bold text-white">🧾 POS Billing System</h1>
        <div class="text-sm text-gray-300">
            Welcome !  <span class="font-semibold text-white"><%= username != null ? username : "Guest" %></span>
            <a href="${pageContext.request.contextPath}login.jsp" class="ml-4 text-red-400 hover:text-red-600">Logout</a>
        </div>
    </div>

    <!-- Action Buttons -->
    <div class="flex gap-4 mb-6">
        <a href="customers" class="bg-blue-600 hover:bg-blue-700 px-4 py-2 rounded text-white font-medium shadow">
            👥 Manage Customers
        </a>
    </div>

    <!-- Checkout -->
    <form method="post" action="checkout" class="bg-gray-800 mt-6 p-6 rounded space-y-4">
        <div class="grid grid-cols-2 gap-4">
            <input name="customerName" placeholder="Customer Name"
                   class="px-4 py-2 rounded bg-gray-700 border border-gray-600 focus:outline-none focus:ring">
            <input name="customerPhone" placeholder="Mobile Number"
                   class="px-4 py-2 rounded bg-gray-700 border border-gray-600 focus:outline-none focus:ring">
        </div>
        <button type="submit"
                class="w-full bg-indigo-600 hover:bg-indigo-700 px-4 py-2 rounded text-white font-semibold">
            ✅ Checkout & Print Bill
        </button>
    </form>

    <!-- Message Alerts -->
    <%
        String status = request.getParameter("status");
        String error = request.getParameter("error");
    %>
    <% if ("added".equals(status)) { %>
    <div class="bg-green-500 text-white p-3 rounded mb-4">✅ Product added to bill!</div>
    <% } else if ("notfound".equals(error)) { %>
    <div class="bg-red-500 text-white p-3 rounded mb-4">❌ Product not found! Please check the ID.</div>
    <% } else if ("invalid".equals(error)) { %>
    <div class="bg-yellow-400 text-black p-3 rounded mb-4">⚠️ Invalid input. Please check values.</div>
    <% } else if ("billed".equals(status)) { %>
    <div class="bg-blue-400 text-black p-3 rounded mb-4">🧾 Bill generated successfully!</div>
    <% } else if ("empty".equals(error)) { %>
    <div class="bg-red-600 text-white p-3 rounded mb-4">🛑 Cannot bill. The cart is empty.</div>
    <% } else if ("saving".equals(error)) { %>
    <div class="bg-red-600 text-white p-3 rounded mb-4">❌ Error saving the bill. Please try again.</div>
    <% } %>

    <!-- Add Product Form -->
    <div class="bg-gray-800 p-4 rounded mb-6 flex gap-4 items-center">
        <input type="number" id="productId" placeholder="Product ID"
               class="px-4 py-2 rounded bg-gray-700 border border-gray-600 focus:outline-none focus:ring w-1/3">
        <input type="number" id="quantity" placeholder="Qty" value="1" min="1"
               class="px-4 py-2 rounded bg-gray-700 border border-gray-600 focus:outline-none focus:ring w-1/4">
        <button onclick="addItem()" class="bg-green-600 hover:bg-green-700 px-5 py-2 rounded text-white font-semibold">
            ➕ Add Item
        </button>
    </div>

    <!-- Bill Table -->
    <div class="overflow-x-auto bg-gray-800 rounded">
        <table class="w-full table-auto text-left text-white">
            <thead class="bg-gray-700 text-sm uppercase">
            <tr>
                <th class="px-4 py-2">ID</th>
                <th class="px-4 py-2">Name</th>
                <th class="px-4 py-2">Price</th>
                <th class="px-4 py-2">Qty</th>
                <th class="px-4 py-2">Total</th>
            </tr>
            </thead>
            <tbody class="text-sm">
            <%
                List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
                double total = 0;
                if (cart != null && !cart.isEmpty()) {
                    for (CartItem item : cart) {
                        double rowTotal = item.getTotal();
                        total += rowTotal;
            %>
            <tr class="border-t border-gray-600">
                <td class="px-4 py-2"><%= item.getProduct().getId() %></td>
                <td class="px-4 py-2"><%= item.getProduct().getName() %></td>
                <td class="px-4 py-2">Rs. <%= String.format("%.2f", item.getProduct().getPrice()) %></td>
                <td class="px-4 py-2"><%= item.getQuantity() %></td>
                <td class="px-4 py-2">Rs. <%= String.format("%.2f", rowTotal) %></td>
            </tr>
            <% } } else { %>
            <tr>
                <td colspan="5" class="text-center px-4 py-4 text-gray-400">🛒 Cart is empty</td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <div class="text-right mt-4 text-xl font-bold">
        Total: Rs. <%= String.format("%.2f", total) %>
    </div>

</div>

</body>
</html>
