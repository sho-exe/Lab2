<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Committee Members</title>
        <style>
            table { width: 50%; border-collapse: collapse; margin-top: 20px; }
            th, td { padding: 10px; text-align: left; border: 1px solid #ccc; }
            th { background-color: #f4f4f4; }
        </style>
    </head>
    <body>
    <center>
        <%@ include file="header.jsp" %>

        <%

    // 1. Get the current list from the session
    ArrayList<String> studentList = (ArrayList<String>) session.getAttribute("myList");

    // 2. If the list doesn't exist yet, initialize it
    if (studentList == null) {
        studentList = new ArrayList<String>();
    }

%>

            

       

        <fieldset style="min-height: 400px">
            <legend>Committee Member Names</legend>
            <table>
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Name</th>
                        <th>Matric</th>
                        <th>Club</th>


                    </tr>
                </thead>
                <tbody>
                <%
                    // 4. Use a single loop to iterate through both lists by index
                    for (int i = 0; i < studentList.size(); i++) {
                        
                       String[] details = studentList.get(i).split(",");


                %>
                    <tr>
                        <td><%= (i + 1) %></td>
                        <td><%= details[0] %></td>
                        <td><%= details[1] %></td>
                        <td><%= details[2] %></td>


                    </tr>
                <% 
                    } 
                %>
                </tbody>
            </table>
        </fieldset>

        <%@ include file="footer.jsp" %>
    </center>
</body>
</html>