<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.persistence.model.Product" %>

<html>
<head>
    <title>Billing</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-green-50 font-sans">
<div class="flex min-h-screen">

    <jsp:include page="NavigationBar/NavBar.jsp" />

    <main class="flex-1 p-6">
        <div class="flex justify-between items-center mb-6">
            <input type="text" placeholder="Search books..." class="w-1/3 p-2 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-green-400" />
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

        <h2 class="text-lg font-semibold mb-4">Available Products</h2>

        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            <%
                List<Product> productList = (List<Product>) request.getAttribute("productList");
                if (productList != null && !productList.isEmpty()) {
                    for (Product p : productList) {
            %>
            <div class="bg-gray-900 text-white p-4 rounded-xl shadow hover:shadow-lg transition duration-200">
                <h3 class="text-lg font-bold mb-1"><%= p.getName() %></h3>
                <p class="text-sm text-gray-400 mb-2">Rs. <%= String.format("%.2f", p.getPrice()) %></p>

                <form method="post" action="<%= request.getContextPath() %>/AddToCartServlet">
                    <input type="hidden" name="id" value="<%= p.getId() %>">
                    <input type="hidden" name="name" value="<%= p.getName() %>">
                    <input type="hidden" name="price" value="<%= p.getPrice() %>">

                    <div class="flex items-center justify-between mt-4">
                        <div class="flex items-center space-x-2 bg-gray-800 px-3 py-1 rounded-full">
                            <button type="button" class="text-xl font-bold text-yellow-400">−</button>
                            <span class="text-white">0</span>
                            <button type="button" class="text-xl font-bold text-yellow-400">+</button>
                        </div>
                        <button type="submit" class="bg-green-500 hover:bg-green-600 px-3 py-1 rounded-full text-white flex items-center">
                            <svg class="w-5 h-5 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path d="M3 3h2l.4 2M7 13h14l-1.5 8H6L4 6H2" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                            Add
                        </button>
                    </div>
                </form>
            </div>
            <%
                }
            } else {
            %>
            <p class="text-center text-gray-500 col-span-full">No products found.</p>
            <% } %>
        </div>


    </main>

    <%--    <jsp:include page="CartSummary.jsp" />--%>
</div>
</body>
</html>
