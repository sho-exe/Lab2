<%@page import="java.util.ArrayList"%>




<html>
    <head>
        <title>JSP Implicit Objects</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>

        <%@ include file="header.jsp" %>
        <div class="container" >


            <h1>Health Information: BMI Categories</h1>

            <div class="card">
            <p>Below are the standard weight status categories associated with BMI ranges:</p>


            <table border="1" style="width:100%; border-collapse: collapse; text-align: left;">
                <thead style="background-color: #f2f2f2;">
                    <tr>
                        <th style="padding: 10px;">BMI Range</th>
                        <th style="padding: 10px;">Category</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<String[]> categories = new ArrayList<>();
                        categories.add(new String[]{"Below 18.5", "Underweight"});
                        categories.add(new String[]{"18.5 - 25.0", "Normal"});
                        categories.add(new String[]{"Above 25.0", "Overweight"});

                        for (String[] row : categories) {
                    %>
                    <tr>
                        <td style="padding: 10px;"><%= row[0]%></td>
                        <td style="padding: 10px;"><%= row[1]%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

            <div style="margin-top: 20px; ">
                <a class="btn-back" href="bmiCalculator.jsp">Return to Calculator</a>
            </div>
</div>
        </div>

        <%@ include file="footer.jsp" %>
    </body>
</html>