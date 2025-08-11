<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 8/4/2025
  Time: 7:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.example.persistence.model.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<CartItem> cart = (List<CartItem>) session.getAttribute("lastInvoice");
  String customer = (String) session.getAttribute("customerName");
  String mobile = (String) session.getAttribute("customerPhone");
  double discount = session.getAttribute("discount") != null ? (double) session.getAttribute("discount") : 0.0;
  double serviceCharge = session.getAttribute("serviceCharge") != null ? (double) session.getAttribute("serviceCharge") : 0.0;
  double totalAmount = session.getAttribute("totalAmount") != null ? (double) session.getAttribute("totalAmount") : 0.0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Invoice - Pahana Edu</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-white font-sans p-8">

<div class="max-w-4xl mx-auto bg-gray-800 rounded shadow p-6 print:bg-white print:text-black print:shadow-none print:p-0">
  <!-- Header -->
  <div class="text-center mb-6">
    <h1 class="text-3xl font-bold">🧾 Pahana Edu - Invoice</h1>
    <p class="text-lg mt-2">Customer: <span class="font-medium"><%= customer != null ? customer : "Walk-in" %></span></p>
    <p class="text-lg">Mobile: <span class="font-medium"><%= mobile != null ? mobile : "-" %></span></p>
  </div>

  <!-- Invoice Table -->
  <div class="overflow-x-auto rounded">
    <table class="w-full table-auto border border-gray-700 text-sm print:border-black print:text-black">
      <thead class="bg-gray-700 uppercase text-xs print:bg-gray-100 print:text-black">
      <tr>
        <th class="px-4 py-2 border border-gray-700 print:border-black">ID</th>
        <th class="px-4 py-2 border border-gray-700 print:border-black">Name</th>
        <th class="px-4 py-2 border border-gray-700 print:border-black">Qty</th>
        <th class="px-4 py-2 border border-gray-700 print:border-black">Price</th>
        <th class="px-4 py-2 border border-gray-700 print:border-black">Total</th>
      </tr>
      </thead>
      <tbody>
      <%
        double grandTotal = 0;
        if (cart != null) {
          for (CartItem item : cart) {
            double rowTotal = item.getTotal();
            grandTotal += rowTotal;
      %>
      <tr class="border-t border-gray-700 print:border-black">
        <td class="px-4 py-2 border border-gray-700 print:border-black"><%= item.getProduct().getId() %></td>
        <td class="px-4 py-2 border border-gray-700 print:border-black"><%= item.getProduct().getName() %></td>
        <td class="px-4 py-2 border border-gray-700 print:border-black"><%= item.getQuantity() %></td>
        <td class="px-4 py-2 border border-gray-700 print:border-black">Rs. <%= String.format("%.2f", item.getProduct().getPrice()) %></td>
        <td class="px-4 py-2 border border-gray-700 print:border-black">Rs. <%= String.format("%.2f", rowTotal) %></td>
      </tr>
      <%  } } %>
      </tbody>
    </table>
  </div>

  <!-- Totals -->
  <div class="mt-6 space-y-1 text-right text-lg print:text-black">
    <p>Subtotal: <span class="font-semibold">Rs. <%= String.format("%.2f", grandTotal) %></span></p>
    <p>Discount: <span class="font-semibold text-yellow-400 print:text-black">Rs. <%= String.format("%.2f", discount) %></span></p>
    <p>Service Charge: <span class="font-semibold text-green-400 print:text-black">Rs. <%= String.format("%.2f", serviceCharge) %></span></p>
    <p class="text-2xl mt-2 font-bold">Total: Rs. <%= String.format("%.2f", totalAmount) %></p>
  </div>

  <!-- Buttons -->
  <div class="mt-8 flex justify-between print:hidden">
    <button onclick="window.print()" class="bg-indigo-600 hover:bg-indigo-700 text-white px-5 py-2 rounded shadow">
      🖨️ Print Invoice
    </button>
    <a href="billing.jsp" class="bg-gray-600 hover:bg-gray-700 text-white px-5 py-2 rounded shadow">
      🔄 New Bill
    </a>
  </div>
</div>

</body>
</html>

