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
    </head>
    <body>
        <section>
            <div class="container">
                <h1 class="text-center">The</h1>

                <form action="signup" method="post">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" id="name" name="name" autocomplete="off" placeholder="Enter your name" />
                    </div>


                <form action="signup" method="post">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" autocomplete="off" placeholder="Enter your username" />
                    </div>

                    <form action="signup" method="post">
                        <div class="form-group">
                            <label for="email">Username</label>
                            <input type="email" id="email" name="email" autocomplete="off" placeholder="Enter your email" />
                        </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" autocomplete="off" placeholder="Enter your password" />
                    </div>

                    <div>
                        <input type="submit" value="Sign up" name="Sign up" class="btn" />
                    </div>
                </form>

                <div class="sign-up">
                    <h6>Already have an account? <a href="login.jsp">Login here</a>.</h6>
                </div>
            </div>
        </section>
    </body>
    </html>
