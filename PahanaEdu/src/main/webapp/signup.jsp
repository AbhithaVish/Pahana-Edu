<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/12/2025
  Time: 8:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign up Form</title>
<%--    <link rel="stylesheet" href="style.css">--%>
</head>
<body>
<section>
    <div class="container">
        <h1 class="text-center">Pahana Edu</h1>

        <form action="signup2" method="post">
            <input type="text" name="name" placeholder="Name" required />
            <input type="email" name="email" placeholder="Email" required />
            <input type="text" name="username" placeholder="Username" required />
            <input type="password" name="password" placeholder="Password" required />
            <button type="submit">Sign Up</button>

            <c:if test="${status == 'success'}">
                <p style="color:green;">Registration successful!</p>
            </c:if>
            <c:if test="${status == 'failed'}">
                <p style="color:red;">Registration failed. Please try again.</p>
            </c:if>
        </form>



        <div class="sign-up">
            <h6>Already have an account? <a href="login.jsp">Login here</a>.</h6>
        </div>
    </div>
</section>
</body>
</html>