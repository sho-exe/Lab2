<%-- 
    Document   : memberRegister
    Author     : sho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 3 - Task 1</title>
    </head>
    <body>
        <h2>Perform Car Loan Calculation</h2>

        <fieldset>
            <%
                //define variables..
                String loanAmount = null;
                String period = null;
                double totalLoan = 0.0;
                
                double interestRate = 0.045; // 4.5% annual
                
                
//                use request.getParameter() method to retrieve data from the form in memberRegister.jsp
                loanAmount = request.getParameter("loanAmount");
                period = request.getParameter("period");
                
                totalLoan = Double.parseDouble(loanAmount) + (Double.parseDouble(loanAmount) * interestRate * Integer.parseInt(period));


%>
            <!-- display the output -->
            <h1>Detail of Car Loan</h1>
            <p> Loan Request : RM <%= loanAmount%></p>
            <p>Period of Payment : <%= period%> years</p>            
            <p>Total Loan (+ Interest) : RM <%= totalLoan%> </p>

        </fieldset>

    </body>
</html>
