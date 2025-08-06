<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 8/6/2025
  Time: 9:50 PM
  To change this template use File | Settings | File Templates.
--%><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Bookshop Sales Report</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 20px; }
    h1 { text-align: center; color: #333; }
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
    th { background-color: #f2f2f2; }
    tr:nth-child(even) { background-color: #f9f9f9; }
    #last-updated { text-align: right; font-style: italic; color: #666; }
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

    setInterval(updateTable, 30000); // auto-refresh every 30 sec
  </script>
</head>
<body>
<h1>Bookshop Sales Report</h1>
<div id="last-updated">Last updated: <%= new java.util.Date().toString() %></div>

<table>
  <thead>
  <tr>
    <th>ID</th>
    <th>Customer Name</th>
    <th>Customer Phone</th>
    <th>Total Amount ($)</th>
    <th>Discount ($)</th>
    <th>Service Charge ($)</th>
    <th>Created At</th>
  </tr>
  </thead>
  <tbody id="sales-tbody">
  <c:forEach var="sale" items="${salesList}">
    <tr>
      <td>${sale.id}</td>
      <td>${sale.customerName}</td>
      <td>${sale.customerPhone}</td>
      <td>${sale.totalAmount}</td>
      <td>${sale.discount}</td>
      <td>${sale.serviceCharge}</td>
      <td>${sale.createdAt}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
