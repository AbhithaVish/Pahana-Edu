<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 8/4/2025
  Time: 11:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Customer List</title>
  <style>
    body { font-family: Arial; padding: 30px; background-color: #f4f4f4; }
    .container {
      max-width: 800px; margin: auto; background: white;
      padding: 20px; border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    th, td {
      padding: 12px; text-align: left; border-bottom: 1px solid #ddd;
    }
    h2 { text-align: center; }
    .add-btn {
      float: right; margin-bottom: 10px;
      background: green; color: white;
      border: none; padding: 10px 15px;
      border-radius: 5px; text-decoration: none;
    }
    .add-btn:hover { background: darkgreen; }
  </style>
</head>
<body>

<div class="container">
  <h2>📋 Registered Customers</h2>
  <a href="customer-register.jsp" class="add-btn">➕ Add Customer</a>

  <%
    List<Customer> customers = (List<Customer>) request.getAttribute("customerList");
    if (customers != null && !customers.isEmpty()) {
  %>
  <table>
    <thead>
    <tr><th>NIC</th><th>Name</th><th>Email</th><th>Phone</th></tr>
    </thead>
    <tbody>
    <% for (Customer customer : customers) { %>
    <tr>
      <td><%= customer.getNic() %></td>
      <td><%= customer.getName() %></td>
      <td><%= customer.getEmail() %></td>
      <td><%= customer.getPhone() %></td>
    </tr>
    <% } %>
    </tbody>
  </table>
  <% } else { %>
  <p>No customers found.</p>
  <% } %>
</div>

</body>
</html>
