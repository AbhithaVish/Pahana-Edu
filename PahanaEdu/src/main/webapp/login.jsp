<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/12/2025
  Time: 8:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
<%--    <link rel="stylesheet" href="style.css">--%>
</head>
<body>
  <section>
    <div class="container">
        <h1 class="text-center">The</h1>
        <form action="login" method="post">
            <div class="form-group">
              <label for="username">Username</label>
              <input type="text" id="username" name="username" autocomplete="off" placeholder="Enter your username" />
            </div>

            <div class="form-group">
              <label for="password">Password</label>
              <input type="password" id="password" name="password" autocomplete="off" placeholder="Enter your password" />
            </div>

            <div>
              <input type="submit" value="Sign in" name="login" class="btn" />
            </div>
        </form>

        <div class="sign-up">
          <h6>Don't have an account? <a href="signup.jsp">Sign up here</a>.</h6>
        </div>
    </div>
  </section>
</body>
</html>
