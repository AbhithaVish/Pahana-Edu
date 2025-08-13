<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 8/7/2025
--%>
<%@ page import="com.example.persistence.model.Customer" %>
<%
  Customer customer = (Customer) request.getAttribute("customer");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Customer</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    .emoji-font {
      font-family: "Segoe UI Emoji", "Apple Color Emoji", "Noto Color Emoji", sans-serif;
    }
  </style>
</head>
<body class="bg-gray-950 text-white min-h-screen p-6">

<!-- Edit Form Card -->
<div class="w-full max-w-3xl mx-auto bg-gray-800 rounded-lg shadow p-8 pt-16 relative">

  <!-- Header inside the card (with emojis centered) -->
  <div class="absolute top-4 left-0 w-full flex justify-between items-center px-8 emoji-font z-10">
    <!-- Left button -->
    <a href="billing.jsp" class="bg-green-600 hover:bg-green-700 text-white font-semibold px-4 py-2 rounded shadow inline-flex items-center space-x-2">
      <img src="https://twemoji.maxcdn.com/v/latest/svg/1f4cb.svg" alt="📃" class="w-5 h-5 inline">
      <span>Cashier</span>
    </a>

    <!-- Centered title -->
    <h2 class="text-xl font-bold text-white absolute left-1/2 transform -translate-x-1/2">
      <span class="inline-flex items-center space-x-2">
        <img src="https://twemoji.maxcdn.com/v/latest/svg/1f4cb.svg" alt="📋" class="w-6 h-6 inline">
        <span>Edit Customer</span>
      </span>
    </h2>

    <!-- Right button -->
    <a href="customers" class="bg-green-600 hover:bg-green-700 text-white font-semibold px-4 py-2 rounded shadow inline-flex items-center space-x-2">
      <img src="https://twemoji.maxcdn.com/v/latest/svg/1f465.svg" alt="👥" class="w-5 h-5 inline">
      <span>View Customers</span>
    </a>
  </div>

  <!-- Form -->
  <form action="update-customer" method="post" class="space-y-4">
    <input class="w-full p-3 rounded bg-white text-black" type="hidden" name="nic" value="<%= customer.getNic() %>">
    <input class="w-full p-3 rounded bg-white text-black" name="name" value="<%= customer.getName() %>" placeholder="Name" required>
    <input class="w-full p-3 rounded bg-white text-black" name="email" value="<%= customer.getEmail() %>" placeholder="Email" required>
    <input class="w-full p-3 rounded bg-white text-black" name="phone" value="<%= customer.getPhone() %>" placeholder="Phone" required>
    <button type="submit" class="bg-blue-600 hover:bg-blue-700 px-4 py-2 rounded font-semibold">Update</button>
  </form>
</div>

</body>
</html>
