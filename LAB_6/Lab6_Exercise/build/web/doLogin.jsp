<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSE3023", "root", "");
        
        PreparedStatement ps = con.prepareStatement("SELECT * FROM userprofile WHERE BINARY username=? AND BINARY password=?");
        ps.setString(1, username);
        ps.setString(2, password);
        
        ResultSet rs = ps.executeQuery();   
        if(rs.next()) {
            // Success: Store user details in session
            session.setAttribute("user", username);
            session.setAttribute("fname", rs.getString("firstname"));
            session.setAttribute("lname", rs.getString("lastname"));
            response.sendRedirect("main.jsp");
        } else {
            // Failure
            response.sendRedirect("login.jsp?msg=Invalid username or password..!");
        }
        con.close();
    } catch(Exception e) {
        response.sendRedirect("login.jsp?msg=Database Error: " + e.getMessage());
    }
%>