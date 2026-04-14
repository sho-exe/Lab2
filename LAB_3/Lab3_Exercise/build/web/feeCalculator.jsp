<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Activity Fee Calculator</title>
    </head>
    <body>
        <%@ include file="header.jsp" %>

    <center>
        <form method="post">
            <fieldset style="min-height: 400px">
                <legend>Activity Fee Calculator </legend>
                <label for="activity">Activity Number : </label>
                <input type="number" id="activity" name="activity" size="15"
                       placeholder="Number of Activities" required><br/>

                <p>
                    <input type="submit" id="btnSubmit" value="Submit">
                </p>


                <%
                    String result = request.getParameter("activity");
                    double total = (result != null) ? Integer.parseInt(result) * 10 : 0;
                %>
                <h1>Total Fee = RM <%= String.format("%.2f", total)%></h1>                
                <p>Note : Every Activity costs RM10.</p>

            </fieldset>
        </form>
        <%@ include file="footer.jsp" %>

    </center>

</body>
</html>
