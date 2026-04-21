<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Subject Information</title>
                <link rel="stylesheet" href="style.css"/>

    </head>
    <body>
        <div class="container">
            <h1>Using jsp:include and jsp:param to display information on JSP page</h1>
            <div class="card">
                <form >

                    <h2>Calling subjectInfo.jsp Page</h2>


                    <p>Code: <%= request.getParameter("code")%></p>
                    <p>Subject: <%= request.getParameter("subject")%></p>
                    <p>Credit: <%= request.getParameter("credit")%></p>



                    <input onclick="location.href ="";" type="button" value="Back" />


                </form> 

            </div>
        </div>


    </body>
</html>


