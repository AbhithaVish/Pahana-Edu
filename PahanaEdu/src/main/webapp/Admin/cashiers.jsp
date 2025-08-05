<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 8/5/2025
  Time: 9:28 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.persistence.model.User" %>

<!DOCTYPE html>
<html>
<head>
  <title>Cashier List</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-10 font-sans">

<div class="max-w-4xl mx-auto bg-white p-6 rounded shadow">
  <jsp:include page="NavigationBar/NavBar.jsp" />
  <h1 class="text-2xl font-bold mb-6">Cashiers</h1>

  <c:if test="${not empty error}">
    <p class="text-red-500 mb-4">${error}</p>
  </c:if>

  <table class="w-full table-auto border-collapse">
    <thead>
    <tr class="bg-gray-200 text-left">
      <th class="p-2">ID</th>
      <th class="p-2">Name</th>
      <th class="p-2">Email</th>
      <th class="p-2">Username</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="cashier" items="${cashiers}">
      <tr class="border-t">
        <td class="p-2"><c:out value="${cashier.id}" /></td>
        <td class="p-2"><c:out value="${cashier.name}" /></td>
        <td class="p-2"><c:out value="${cashier.email}" /></td>
        <td class="p-2"><c:out value="${cashier.username}" /></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>
