<%@page import="com.lab.bean.StudentBean"%>
<%@page import="com.lab.dao.SubjectDAO"%>
<%@page import="com.lab.bean.SubjectsBean"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register New Subject</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], select { width: 316px; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        button { padding: 10px 15px; background-color: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background-color: #218838; }
        .back-link { display: inline-block; margin-top: 15px; text-decoration: none; color: #007bff; }
        input[readonly] { background-color: #e9ecef; color: #495057; cursor: not-allowed; }
    </style>
</head>
<body>
    <%
        StudentBean user = (StudentBean) session.getAttribute("loggedUser");
        if (user == null) {
            response.sendRedirect("login.html");
            return;
        }

        // Fetch master list of available subjects from database table
        SubjectDAO subjectDAO = new SubjectDAO();
        List<SubjectsBean> masterSubjectList = subjectDAO.getAllSubjects();
    %>
    <h2>Register New Subject</h2>

    <form action="SubjectServlet" method="POST" onsubmit="setSubjectDetails()">
        <!-- Hidden parameter to tell SubjectServlet to run the "add" logic -->
        <input type="hidden" name="action" value="add">
        
        <!-- Hidden inputs populate via JavaScript to keep SubjectServlet processing intact -->
        <input type="hidden" id="subject_name" name="subject_name">
        <input type="hidden" id="subject_code" name="subject_code">

        <div class="form-group">
            <label for="matric_no">Student Matric No:</label>
            <input type="text" id="matric_no" name="matric_no" value="<%=user.getMatricNo()%>" readonly>
        </div>
        
        <div class="form-group">
            <label for="subject_dropdown">Select Subject:</label>
            <select id="subject_dropdown" required>
                <option value="" disabled selected>-- Choose a Subject --</option>
                <% 
                    if (masterSubjectList != null && !masterSubjectList.isEmpty()) {
                        for (SubjectsBean subject : masterSubjectList) {
                %>
                    <option value="<%= subject.getSubjectCode() %>" data-name="<%= subject.getSubjectName() %>">
                        <%= subject.getSubjectCode() %> - <%= subject.getSubjectName() %> (<%= subject.getCreditHour() %> Credits)
                    </option>
                <% 
                        }
                    } else {
                %>
                    <option value="" disabled>No subjects available in database</option>
                <% 
                    }
                %>
            </select>
        </div>
        
        <div>
            <button type="submit">Add Subject</button>
        </div>
    </form>

    <a href="viewSubjects.jsp" class="back-link">Back to Subject List</a>

    <script>
        function setSubjectDetails() {
            var dropdown = document.getElementById("subject_dropdown");
            var selectedOption = dropdown.options[dropdown.selectedIndex];
            
            // Grab values from the custom data-attributes of the selected option
            var code = selectedOption.value;
            var name = selectedOption.getAttribute("data-name");
            
            // Map them to hidden form parameters before submitting
            document.getElementById("subject_code").value = code;
            document.getElementById("subject_name").value = name;
        }
    </script>
</body>
</html>