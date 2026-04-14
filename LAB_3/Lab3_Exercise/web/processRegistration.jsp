<%-- 
    Document   : memberRegister
    Author     : sho
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lab 3 - Task 1</title>
    </head>
    <body>
    <center>

        <%@ include file="header.jsp" %>

        <fieldset style="min-height: 400px">
            <%
                String name = null;
                String matric = null;
                String club = null;

//                use request.getParameter() method to retrieve data from the form in memberRegister.jsp
                name = request.getParameter("name");
                matric = request.getParameter("matric");
                club = request.getParameter("club");

                // 1. Get the current list from the session
                ArrayList<String> studentList = (ArrayList<String>) session.getAttribute("myList");

                // 2. If the list doesn't exist yet, initialize it
                if (studentList == null) {
                    studentList = new ArrayList<String>();
                }

                // 4. Add the item if the user actually submitted the form
                if (name != null && !name.trim().isEmpty()) {
                    studentList.add(name + "," + matric + "," + club);
                }

                // 5. Save the updated list back into the session
                session.setAttribute("myList", studentList);


            %>
            <!-- display the output -->
            <h1>Thank you for registering Club!</h1>
            <p>This is your details:</p>
            <p>Student Name : <%= name%></p>
            <p>Matric Number : <%= matric%></p>
            <p>Selected Club : <%= club%></p>

            <a style="font-weight: bold; font-size: 30px;"href="memberDirectory.jsp">Check Commitee Members</a>

        </fieldset>
        <%@ include file="footer.jsp" %>
    </center>
</body>
</html>
