<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 8/4/2025
  Time: 11:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.persistence.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Customer List</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-white min-h-screen font-sans p-6">

<div class="max-w-5xl mx-auto bg-gray-800 rounded-lg shadow-lg p-6">
  <!-- Header -->
  <div class="flex justify-between items-center mb-6">
    <a href="billing.jsp"
       class="bg-green-600 hover:bg-green-700 text-white font-semibold px-4 py-2 rounded shadow">
      📃 Cashier
    </a>
    <h2 class="text-2xl font-bold">📋 Registered Customers</h2>
    <a href="customer-register.jsp"
       class="bg-green-600 hover:bg-green-700 text-white font-semibold px-4 py-2 rounded shadow">
      ➕ Add Customer
    </a>
  </div>

  <%
    List<Customer> customers = (List<Customer>) request.getAttribute("customerList");
    if (customers != null && !customers.isEmpty()) {
  %>

  <!-- Customer Table -->
  <div class="overflow-x-auto">
    <table class="w-full table-auto text-sm text-left border border-gray-700">
      <thead class="bg-gray-700 text-xs uppercase">
      <tr>
        <th class="px-4 py-3 border border-gray-700">NIC</th>
        <th class="px-4 py-3 border border-gray-700">Name</th>
        <th class="px-4 py-3 border border-gray-700">Email</th>
        <th class="px-4 py-3 border border-gray-700">Phone</th>
        <th class="px-4 py-3 border border-gray-700">Edit</th>
        <th class="px-4 py-3 border border-gray-700">Delete</th>
      </tr>
      </thead>
      <tbody>
      <% for (Customer customer : customers) { %>
      <tr class="border-t border-gray-700 hover:bg-gray-700/50">
        <td class="px-4 py-2 border border-gray-700"><%= customer.getNic() %></td>
        <td class="px-4 py-2 border border-gray-700"><%= customer.getName() %></td>
        <td class="px-4 py-2 border border-gray-700"><%= customer.getEmail() %></td>
        <td class="px-4 py-2 border border-gray-700"><%= customer.getPhone() %></td>
        <td class="px-4 py-2 border border-gray-700">
          <a href="edit-customer?nic=<%= customer.getNic() %>" class="text-yellow-400 hover:underline">Edit</a> |
          <a href="delete-customer?nic=<%= customer.getNic() %>" class="text-red-500 hover:underline"
             onclick="return confirm('Are you sure you want to delete this customer?')">Delete</a>
        </td>
        <td class="px-4 py-2 border border-gray-700"></td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </div>

  <% } else { %>
  <!-- No Data Message -->
  <div class="text-center py-8 text-gray-400 text-lg">
    🚫 No customers found.
  </div>
  <% } %>
</div>

</body>
</html>
