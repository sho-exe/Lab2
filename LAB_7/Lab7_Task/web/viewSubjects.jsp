<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lab.bean.StudentBean" %>
<%@ page import="com.lab.bean.SubjectBean" %>
<%@ page import="com.lab.dao.SubjectDAO" %>
<%@ page import="java.util.List" %>

<%
    // Check if the user is logged in based on your login servlet session setup
    StudentBean loggedUser = (StudentBean) session.getAttribute("loggedUser");
    if (loggedUser == null) {
        // Redirect back to login if session doesn't exist
        response.sendRedirect("login.html");
        return;
    }

    // Instantiate DAO and fetch registered subjects for this specific matric number
    SubjectDAO subjectDAO = new SubjectDAO();
    List<SubjectBean> subjectList = subjectDAO.getAllSubjectsByMatric(loggedUser.getMatricNo());
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>My Registered Subjects</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 40px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: left;
            }
            th {
                background-color: #f4f4f4;
            }
            tr:hover {
                background-color: #f9f9f9;
            }
            .welcome {
                font-size: 18px;
                margin-bottom: 20px;
            }
            .btn-delete {
                color: red;
                text-decoration: none;
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <div class="welcome">
            Welcome, <strong><%= loggedUser.getFullname()%></strong> (<%= loggedUser.getMatricNo()%>)
        </div>

        <h2>Your Registered Subjects</h2>

        <a href="registerSubject.jsp">+ Register New Subject</a> | 
        <a href="dashboard.jsp">Dashboard</a> |
        <a href="login.html">Logout</a> 


        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Subject Code</th>
                    <th>Subject Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% if (subjectList != null && !subjectList.isEmpty()) {
                    for (SubjectBean subject : subjectList) {%>
                <tr>
                    <td><%= subject.getId()%></td>
                    <td><%= subject.getSubject_code()%></td>
                    <td><%= subject.getSubject_name()%></td>
                    <td>
                        <a href="SubjectServlet?action=view&id=<%= subject.getId()%>">Edit</a> | 
                        <a href="SubjectServlet?action=delete&id=<%= subject.getId()%>" 
                           class="btn-delete" 
                           onclick="return confirm('Are you sure you want to drop this subject?');">Drop</a>
                    </td>
                </tr>
                <% }
                } else { %>
                <tr>
                    <td colspan="4" style="text-align: center; color: #777;">You haven't registered any subjects yet.</td>
                </tr>
                <% }%>
            </tbody>
        </table>

    </body>
</html>