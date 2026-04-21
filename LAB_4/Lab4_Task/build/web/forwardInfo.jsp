<%
    String name = request.getParameter("uname");
    String email = request.getParameter("email");
    String nationality = request.getParameter("nationality");
    String background = request.getParameter("background");
%>



<html>
    <head>
        <title>JSP Implicit Objects</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <div class="container">
            <h1>Using jsp:forward to display user info</h1>
            <div class="card">
                <form >

                    <h2>Forwarded Info</h2>


                    <p>Name: <%= name%></p>
                    <p>Email: <%= email%></p>
                    <p>Nationality: <%= nationality%></p>
                    <p>Background: <%= background%></p>





                    <input onclick="location.href ="";" type="button" value="Back" />


                </form> 

            </div>
        </div>

    </body>
</html>
