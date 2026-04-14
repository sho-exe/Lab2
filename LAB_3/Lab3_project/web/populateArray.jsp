<%-- 
    Document   : populateArray
    Created on : Apr 14, 2026, 11:57:00 AM
    Author     : sho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            int[][] salesData = {
                {2500, 2100, 2200}, // Salesman 1
                {2000, 1900, 2400}, // Salesman 2
                {1800, 2200, 2450} // Salesman 3
            };

            String[] months = {"Jan", "Feb", "Mar"};
        %>

        <table border="1">
            <thead>
                <tr>
                    <th>Salesman</th>
                        <% for (String month : months) {%>
                    <th><%= month%></th>
                        <% } %>
                </tr>
            </thead>
            <tbody>
                <%
                    // 2. Loop through the array to populate the HTML table
                    for (int i = 0; i < salesData.length; i++) {
                %>
                <tr>
                    <td><strong>Salesman <%= (i + 1)%></strong></td>
                    <% for (int j = 0; j < salesData[i].length; j++) {%>
                    <td><%= String.format("%, d", salesData[i][j])%></td>
                    <% } %>
                </tr>
                <% }%>
            </tbody>
        </table>

    </body>
</html>
