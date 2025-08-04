<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 8/4/2025
  Time: 10:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Customer Registration</title>
  <style>
    body { font-family: Arial; background: #f0f0f0; padding: 30px; }
    .form-container {
      background: #fff; padding: 20px; border-radius: 8px;
      max-width: 400px; margin: auto; box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    input, button {
      width: 100%; padding: 10px; margin: 10px 0;
      border: 1px solid #ccc; border-radius: 4px;
    }
    .message { padding: 10px; text-align: center; font-weight: bold; }
    .success { color: green; }
    .error { color: red; }
  </style>
</head>
<body>

<div class="form-container">
  <h2>Register Customer</h2>

  <%
    String msg = request.getParameter("msg");
    String error = request.getParameter("error");
    if ("success".equals(msg)) {
  %>
  <div class="message success">✅ Customer registered successfully!</div>
  <% } else if (error != null) { %>
  <div class="message error">❌ <%= error %></div>
  <% } %>

  <form method="post" action="register-customer">
    <input type="text" name="nic" placeholder="NIC Number" required>
    <input type="text" name="name" placeholder="Full Name" required>
    <input type="email" name="email" placeholder="Email Address" required>
    <input type="text" name="phone" placeholder="Phone Number" required>
    <button type="submit">Register</button>
  </form>
</div>

</body>
</html>
