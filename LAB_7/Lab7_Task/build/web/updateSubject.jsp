<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.bean.SubjectBean" %>
<%
    // Retrieve the subject data set by the Servlet's "view" action
    SubjectBean subject = (SubjectBean) session.getAttribute("currentSubject");
    
    if (subject == null) {
        // Fallback safety if someone navigates directly to this page without clicking edit
        response.sendRedirect("subjectList.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Subject Details</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"] { width: 300px; padding: 8px; border: 1px solid #ccc; border-radius: 4px; }
        input[readonly] { background-color: #e9ecef; color: #495057; cursor: not-allowed; }
        button { padding: 10px 15px; background-color: #007bff; color: white; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background-color: #0056b3; }
        .back-link { display: inline-block; margin-top: 15px; text-decoration: none; color: #6c757d; }
        .back-link:hover { text-decoration: underline; }
    </style>
</head>
<body>

    <h2>Modify Subject Records</h2>

    <form action="SubjectServlet" method="POST">
        <!-- Action state handling -->
        <input type="hidden" name="action" value="update">
        
        <!-- Pass the unique DB identifier along behind the scenes -->
        <input type="hidden" name="id" value="<%= subject.getId() %>">

        <div class="form-group">
            <label>Student Matric No:</label>
            <!-- Keeping this read-only protects relational link identity integrity -->
            <input type="text" name="matric_no" value="<%= subject.getMatric_no() %>" readonly>
        </div>
        
        <div class="form-group">
            <label for="subject_code">Subject Code:</label>
            <input type="text" id="subject_code" name="subject_code" value="<%= subject.getSubject_code() %>" required>
        </div>

        <div class="form-group">
            <label for="subject_name">Subject Name:</label>
            <input type="text" id="subject_name" name="subject_name" value="<%= subject.getSubject_name() %>" required>
        </div>
        
        <div>
            <button type="submit">Save Updates</button>
        </div>
    </form>

    <a href="subjectList.jsp" class="back-link">← Cancel and Return</a>

</body>
</html>