
<%
    String bmiValStr = request.getParameter("bmiValue");
    String category = request.getParameter("bmiCategory");

    if (bmiValStr == null) {
        bmiValStr = "0.0";
    }

    if (category == null) {
        category = "Unknown";
    }

    double bmi = Double.parseDouble(bmiValStr);
%>

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

                <h2>Your BMI Result</h2>

                <p>Your calculated BMI is: <strong><%= String.format("%.2f", bmi)%></strong></p>
                <p>Health Category: <strong><%= category%></strong></p>

                <a class="btn-back" href="bmiCalculator.jsp">Calculate Again</a>

            </div>
        </div>
        <%@include file="footer.jsp" %>

    </body>
</html>
