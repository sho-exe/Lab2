<%-- 
    Document   : mainPage
    Created on : Apr 14, 2026, 12:28:03 PM
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
        <%@ include file="headerPage.jsp" %>

        <h1>Using JSP Include directive</h1>
        <p style="color: red; max-width:460px;">Java Server Page (JSP) is a technology for controlling the content or appearance of Web pages through the use of servlets, small programs that are specified in the Web page and run on the Web serve to modify the web page before it is sent to the user who requested it.</p>
        <%@ include file="footerPage.jsp" %>

    </body>
</html>
