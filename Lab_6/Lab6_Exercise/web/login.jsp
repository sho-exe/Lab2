<!DOCTYPE html>
<html>
    <head><title>Login</title>
    
            <style>
            
            
            * {
                 margin: 8px;
                
            }
            fieldset {
                 max-width: 400px;
            }

        </style></head>
    <body>

        <fieldset style="max-width: 400px;">
            <legend><h2>System Login</h2></legend>
        <%
            String msg = request.getParameter("msg");
            if (msg != null) {
                out.println("<p style='color:red;'>" + msg + "</p>");
            }
        %>
        <form action="doLogin.jsp" method="post">
            Username: <input type="text" name="username" required><br>
            Password: <input type="password" name="password" required><br>
            <input type="submit" value="Login">

        </form>

        <a href="insertUser.html">Register User</a>
                </fieldset>

    </body>
</html>