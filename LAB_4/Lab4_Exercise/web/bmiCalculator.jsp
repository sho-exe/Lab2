
<html>
    <head>
        <title>JSP Implicit Objects</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="container">
            <h1> BMI Calculator</h1>
            <div class="card">
                <form action="processBMI.jsp">

                    <fieldset>
                        <legend>BMI Calculator</legend>   

                        <label for="weight">Weight (kg)</label>
                        <input type="number" id="weight" name="weight" size="15"
                               placeholder="E.g. 0.0kg" step=".01" required><br/>

                        <label for="height">Height (m)</label>
                        <input type="number" id="height" name="height" size="15"
                               placeholder="E.g. 0.0m" step=".01" required><br/>
                        <p>
                            <input class="btn-back" type="submit" id="btnSubmit" value="Submit">
                            <input class="btn" type="reset" id="btnCancel" value="Cancel">
                        </p>
                    </fieldset>
                </form> 

            </div>
        </div>
        <%@include file="footer.jsp" %>

    </body>
</html>
