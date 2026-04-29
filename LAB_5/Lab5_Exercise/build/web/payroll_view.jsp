<%-- 
    Document   : payroll_view
    Created on : Apr 29, 2026, 2:26:52 PM
    Author     : sho
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            
            body {
                font-family: Arial, sans-serif;
                padding: 30px;
            }

            h1 {
                color: #333;
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            }

            thead {
                background-color: #4a90d9;
                color: white;
            }

            th, td {
                padding: 12px 16px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

         
        </style>
    </head>
    <body>
        <h1>Payroll View</h1>
        <table border="1" cellpadding="8" cellspacing="0">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Employee ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Basic Salary (RM)</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="emp" items="${employeeList}" varStatus="loop">
                    <tr>
                        <td>${loop.count}</td>
                        <td>${emp.empId}</td>
                        <td>${emp.name}</td>
                        <td>${emp.department}</td>
                        <td>${emp.basicSalary}</td>
                        <td>
                            <c:choose>
                                <c:when test="${emp.basicSalary >= 3000}">
                                    Senior
                                </c:when>
                                <c:otherwise>
                                    Junior
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
