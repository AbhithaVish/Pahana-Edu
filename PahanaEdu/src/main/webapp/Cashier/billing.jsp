<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bookshop Sales Report</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">

<div class="container mx-auto px-4 py-6">
    <h1 class="text-3xl font-bold mb-6 text-gray-800">📊 Bookshop Sales Report</h1>

    <div class="bg-white p-4 rounded-lg shadow">
        <table class="min-w-full border-collapse border border-gray-300">
            <thead>
                <tr class="bg-gray-200">
                    <th class="border border-gray-300 px-4 py-2 text-left">Invoice ID</th>
                    <th class="border border-gray-300 px-4 py-2 text-left">Date</th>
                    <th class="border border-gray-300 px-4 py-2 text-left">Customer</th>
                    <th class="border border-gray-300 px-4 py-2 text-left">Total Amount (LKR)</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="sale" items="${salesList}">
                    <tr class="hover:bg-gray-100">
                        <td class="border border-gray-300 px-4 py-2">${sale.invoiceId}</td>
                        <td class="border border-gray-300 px-4 py-2">${sale.saleDate}</td>
                        <td class="border border-gray-300 px-4 py-2">${sale.customerName}</td>
                        <td class="border border-gray-300 px-4 py-2 text-right">
                            <fmt:formatNumber value="${sale.totalAmount}" type="currency" currencySymbol="LKR " groupingUsed="true"/>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty salesList}">
                    <tr>
                        <td colspan="4" class="text-center py-4 text-gray-500">No sales found</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
