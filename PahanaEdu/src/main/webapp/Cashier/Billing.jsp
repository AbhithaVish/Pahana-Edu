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

        <h2 class="text-lg font-semibold mb-4">Available Products</h2>

        <div class="overflow-x-auto">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price (Rs)</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<Product> productList = (List<Product>) request.getAttribute("productList");
                    if (productList != null && !productList.isEmpty()) {
                        for (Product p : productList) {
                %>
                <tr>
                    <td><%= p.getId() %></td>
                    <td><%= p.getName() %></td>
                    <td><%= p.getDescription() %></td>
                    <td>Rs. <%= String.format("%.2f", p.getPrice()) %></td>
                    <td>
                        <form method="post" action="<%= request.getContextPath() %>/AddToCartServlet">
                            <input type="hidden" name="id" value="<%= p.getId() %>">
                            <input type="hidden" name="name" value="<%= p.getName() %>">
                            <input type="hidden" name="price" value="<%= p.getPrice() %>">
                            <button type="submit" class="btn btn-add-cart">Add to Cart</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="5" style="text-align:center;">No products found.</td>
                </tr>
                <% } %>
                </tbody>
            </table>

        </div>
    </main>

<%--    <jsp:include page="CartSummary.jsp" />--%>
</div>
</body>
</html>
