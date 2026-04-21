<%
// Retrieve form data
    String icno = request.getParameter("icno");
    String name = request.getParameter("name");
    String coverage = request.getParameter("coverage");
    String ncdStr = request.getParameter("ncd");
    double price = 0;
    double ncd = 0;
    try {
        price = Double.parseDouble(request.getParameter("price"));
        ncd = Double.parseDouble(ncdStr);
    } catch (Exception e) {
        price = 0;
        ncd = 0;
    }
// Business Logic
    double rate = 0;
    String coverageDisplay = "";
    if ("comprehensive".equals(coverage)) {
        rate = 0.05; // 5%
        coverageDisplay = "Comprehensive";
    } else {
        rate = 0.03; // 3%
        coverageDisplay = "Third Party";
    }
// Base insurance calculation
    double insurance = price * rate;
// Apply NCD discount
    double discount = insurance * ncd;
    double afterNCD = insurance - discount;
// Add 8% SST
    double sst = afterNCD * 0.08;
    double finalAmount = afterNCD + sst;
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
            <h1>Customer Discount Result</h1>
            <div class="card">
                <form >

                    <h2>Transaction Summary</h2>


                    <h3>IC No.:</h3>
                    <%= icno%>
                    <br/>

                    <h3>Name:</h3>
                    <%= name%>
                    <br/>

                    <h3>Market Price (RM)</h3>
                    <%= price%>
                    <br>

                    <h3>Coverage Type: </h3>
                    <%= coverageDisplay%>
                    <br>

                    <h3>NCD:</h3>
                    <%= ncd%> %
                    <br><br>


                    <hr>


                    <h3>Base Insurance:</h3>
                    RM<%= String.format("%.2f", insurance )%>
                    <br/>

                    <h3>NCD Discount:</h3>
                    RM<%= String.format("%.2f", discount )%>
                    <br/>

                    <h3>After NCD: </h3>
                    RM<%= String.format("%.2f", afterNCD )%>
                    <br>

                    <h3>SST (8%): </h3>
                    RM<%= String.format("%.2f", sst )%>
                    <br>

                    <h3 style="font-weight:bold">Final Insurance Amount: </h3>
                    RM<%= String.format("%.2f", finalAmount )%>
                    <br><br>








                    <input onclick="location.href ="";" type="button" value="Back" />


                </form> 

            </div>
        </div>

    </body>
</html>
