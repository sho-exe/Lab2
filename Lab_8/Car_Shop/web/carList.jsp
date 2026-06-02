<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Car Management Application</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                <div>
                    <a href="${pageContext.request.contextPath}/" class="navbar-brand"> Car Store Management App </a>
                </div>
                <ul class="navbar-nav">
                    <li><a href="${pageContext.request.contextPath}/list" class="nav-link">Inventory</a></li>
                </ul>
            </nav>
        </header>
        <br>
        <div class="row">
            <div class="container">
                <h3 class="text-center">List of Cars in Inventory</h3>
                <hr>
                <div class="container text-left">
                    <a href="${pageContext.request.contextPath}/new" class="btn btn-success">Add New Car</a>
                </div>
                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Brand</th>
                            <th>Model</th>
                            <th>Cylinders</th>
                            <th>Price (RM)</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="car" items="${listCar}">
                            <tr>
                                <td><c:out value="${car.id}" /></td>
                                <td><c:out value="${car.brand}" /></td>
                                <td><c:out value="${car.model}" /></td>
                                <td><c:out value="${car.cylinder}" /></td>
                                <td>
                                    <fmt:formatNumber value="${car.price}" type="number" minFractionDigits="2" maxFractionDigits="2" />
                                </td>                        <td>
                                    <a href="edit?id=<c:out value='${car.id}' />" class="btn btn-sm btn-primary">Edit</a>
                                    &nbsp;&nbsp;
                                    <a href="delete?id=<c:out value='${car.id}' />" class="btn btn-sm btn-danger" 
                                       onclick="return confirm('Are you sure you want to delete this car?');">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>