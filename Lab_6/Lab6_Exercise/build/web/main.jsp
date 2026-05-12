<!DOCTYPE html>
<html>
    <head><title>Dashboard</title>
    
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
            <legend><h2>Welcome to the System</h2></legend>

            <%
                if (session.getAttribute("user") == null) {
                    response.sendRedirect("login.jsp");
                } else {
            %>
            <p><strong>Username:</strong> <%= session.getAttribute("user")%></p>
            <p><strong>First Name:</strong> <%= session.getAttribute("fname")%></p>
            <p><strong>Last Name:</strong> <%= session.getAttribute("lname")%></p>
            <br>
            <a href="login.jsp">Logout</a>
        </fieldset>

        <% }%>
    </body>
</html>