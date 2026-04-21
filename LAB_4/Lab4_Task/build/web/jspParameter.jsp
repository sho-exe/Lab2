<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Using JSP Standard Action</title>
</head>
<body>
</body>
</html>

<%
String sCode = "CSE3023";
String sSubject = "Web-based Application Development";
String sCredit = "3(2+1)";
%>

<jsp:include page="subjectInfo.jsp" flush="true">
<jsp:param name="code" value="<%= sCode %>" />
<jsp:param name="subject" value="<%= sSubject %>" />
<jsp:param name="credit" value="<%= sCredit %>" />
</jsp:include>