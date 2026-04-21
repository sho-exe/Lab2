<%!
// Define constant exchange rates
    final double USD = 0.25;
    final double EURO = 0.21;
    final double JPY = 40;
    final double SGD = 0.32;
// Method to calculate conversion

    private double calculateRate(String currency, int amount) {
        double currencyChange = 0.0;
        if (currency != null) {
            if (currency.equals("1")) {
                currencyChange = amount * USD;
            } else if (currency.equals("2")) {
                currencyChange = amount * EURO;
            } else if (currency.equals("3")) {
                currencyChange = amount * JPY;
            } else {
                currencyChange = amount * SGD;
            }
        }
        return currencyChange;
    }
%>

<%
    String currencyType = request.getParameter("currencyType");
    String amountRaw = request.getParameter("amount");
    int amount = 0;
    double total = 0;
    try {
        if (amountRaw != null) {
            amount = Integer.parseInt(amountRaw);
            total = calculateRate(currencyType, amount);
        }
    } catch (Exception e) {
        amount = 0;
    }
// Determine currency name for display
    String currencyName = "N/A";
    if ("1".equals(currencyType))
        currencyName = "USD";
    else if ("2".equals(currencyType))
        currencyName = "EURO";
    else if ("3".equals(currencyType))
        currencyName = "JPY";
    else if ("4".equals(currencyType))
        currencyName = "SGD";
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



                    <h3>Amount in Ringgit Malaysia (RM)</h3>
                    <%= amount%>
                    <br>

                    <h3>Converted to (<%= currencyName %>)</h3>
                    RM<%= String.format("%.2f",total)%>
                    <br><br>





                    <input onclick="location.href ="";" type="button" value="Back" />


                </form> 

            </div>
        </div>

    </body>
</html>
