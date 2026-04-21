<%
// Fixed price
    final double price = 10.0;
// Retrieve form data
    String cust_no = request.getParameter("customerCode");
    String cust_type = request.getParameter("customerType");
    int quantity = 0;
    try {
        quantity = Integer.parseInt(request.getParameter("quantity"));
    } catch (Exception e) {
        quantity = 0;
    }

// Business logic
    double total = 0;
    String message = "";
    if (cust_type.equals("1") && quantity > 100) {
        message = "You're entitled to 10% discount";
        total = quantity * price * 0.9;
    } else if (cust_type.equals("2") && quantity > 100) {
        message = "You're entitled to 25% discount";
        total = quantity * price * 0.75;
    } else {
        message = "You're not entitled to any discount";
        total = quantity * price;
    }
// Display customer type
    String custTypeDisplay = cust_type.equals("1")
            ? "Normal Customer" : "Privilege Customer";
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


                    <h3>Customer Code</h3>
                    <%= cust_no%>
                    <br/>

                    <h3>Quantity</h3>
                    <%= quantity%>
                    <br/>

                    <h3>Customer Type</h3>
                    <%= cust_type%>
                    <br>
                    
                    <h3>Status</h3>
                    <%= message%>
                    <br>
                    
                    <h3>Total Amount</h3>
                    RM<%= total%>
                    <br><br>





                    <input onclick="location.href="";" type="button" value="Back" />


                </form> 

            </div>
        </div>

    </body>
</html>
