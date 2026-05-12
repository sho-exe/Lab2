<%@ page import="java.sql.*" %>
<jsp:useBean id="newUser" class="com.lab.model.User" scope="page" />
<jsp:setProperty name="newUser" property="*" />

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Change driver based on your DB
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSE3023", "root", "");
        
        PreparedStatement ps = con.prepareStatement("INSERT INTO userprofile VALUES (?, ?, ?, ?)");
        ps.setString(1, newUser.getUsername());
        ps.setString(2, newUser.getPassword());
        ps.setString(3, newUser.getFirstname());
        ps.setString(4, newUser.getLastname());
        
        int i = ps.executeUpdate();
        if(i > 0) {
            out.print("Registration Successful! <a href='login.jsp'>Login here</a>");
        }
        con.close();
    } catch(Exception e) {
        out.print("Error: " + e.getMessage());
    }
%>