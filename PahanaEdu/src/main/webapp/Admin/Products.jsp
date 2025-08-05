<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/19/2025
  Time: 10:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.Services.Product" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<html>
<head>
    <title>Product List</title>
</head>
<body>
<section>
    <div class="container">
        <h1 class="text-center">Product Add</h1>

        <form action="addProduct" method="post">
            <input type="text" name="ID" placeholder="ID" required />
            <input type="text" name="Name" placeholder="Name" required />
            <input type="number" name="Price" placeholder="Price" required />
            <input type="text" name="Description" placeholder="Description" required />
            <input type="number" name="Stock" placeholder="Stock" required />
            <button type="submit">Add</button>

            <c:if test="${status == 'success'}">
                <p style="color:green;">Product Added successful!</p>
            </c:if>
            <c:if test="${status == 'failed'}">
                <p style="color:red;">Product Adding failed. Please try again.</p>
            </c:if>
        </form>



        <div class="sign-up">
            <h6>Already have an account? <a href="login.jsp">Login here</a>.</h6>
        </div>
    </div>
</section>
</body>
</html>
