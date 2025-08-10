<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 8/6/2025
  Time: 9:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Bookshop Sales Report</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    #last-updated { font-style: italic; color: #666; }
  </style>
  <script>
    function updateTable() {
      fetch('${pageContext.request.contextPath}/SalesReport?ajax=true')
              .then(response => response.text())
              .then(html => {
                document.querySelector('#sales-tbody').innerHTML = html;
                document.getElementById('last-updated').textContent =
                        'Last updated: ' + new Date().toLocaleString();
              })
              .catch(error => console.error('Error refreshing data:', error));
    }
    setInterval(updateTable, 30000);
  </script>
</head>
<body class="bg-gray-100 font-sans">



<!-- Flex layout with sidebar -->
<div class="flex">
  <jsp:include page="NavigationBar/NavBar.jsp" />
  <!-- Apply left margin so content doesn't go under sidebar -->
  <div class="ml-4 w-full p-6">
    <h1 class="text-2xl font-semibold text-gray-800 mb-4">Bookshop Sales Report</h1>
    <div id="last-updated" class="text-right mb-4">Last updated: <%= new java.util.Date().toString() %></div>

    <div class="overflow-x-auto">
      <table class="min-w-full bg-white border border-gray-300 rounded shadow">
        <thead class="bg-gray-100">
        <tr>
          <th class="px-4 py-2 border">ID</th>
          <th class="px-4 py-2 border">Customer Name</th>
          <th class="px-4 py-2 border">Customer Phone</th>
          <th class="px-4 py-2 border">Total Amount ($)</th>
          <th class="px-4 py-2 border">Discount ($)</th>
          <th class="px-4 py-2 border">Service Charge ($)</th>
          <th class="px-4 py-2 border">Created At</th>
        </tr>
        </thead>
        <tbody id="sales-tbody">
        <c:forEach var="sale" items="${salesList}">
          <tr class="hover:bg-gray-50">
            <td class="px-4 py-2 border">${sale.id}</td>
            <td class="px-4 py-2 border">${sale.customerName}</td>
            <td class="px-4 py-2 border">${sale.customerPhone}</td>
            <td class="px-4 py-2 border">${sale.totalAmount}</td>
            <td class="px-4 py-2 border">${sale.discount}</td>
            <td class="px-4 py-2 border">${sale.serviceCharge}</td>
            <td class="px-4 py-2 border">${sale.createdAt}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>

</body>
</html>
