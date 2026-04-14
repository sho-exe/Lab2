import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateServlet extends HttpServlet {

    //UpdateServlet doGet() Method:Display Form for Editing Record // Paparkan borang dengan data sedia ada
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306 / CSE3023", "root", "admin2128");
            String sql = "SELECT * FROM users WHERE id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(id));
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                String currentRole = rs.getString("roles");
                out.println("<h2>Update User</h2>");
                out.println("<form action='UpdateServlet' method='POST'>");
                out.println("<input type='hidden' name='id' value='"
                        + rs.getInt("id") + "'>");
                out.println("Username: <input type='text' name='username'value ='" + rs.getString("username") + "'  required><br><br>");

                out.println("Password: <input type='text' name='password' value ='" + rs.getString("password") + "'required><br><br>");
                out.println("Role: <select name='roles'>");
                out.println("<option value='Admin' " + (currentRole.equals("Admin") ? "selected" : "") + ">Admin</option>");
                out.println("<option value='Staff' " + (currentRole.equals("Staff") ? "selected" : "") + ">Staff</option>");
                out.println("<option value='Student' " + (currentRole.equals("Student") ? "selected" : "") + ">Student</option >");
                out.println("</select><br><br>");
                out.println("<input type='submit' value='Update User'>");
                out.println("</form>");
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //UpdateServlet.doPost() Method: Save Edited Record to Database
// Proses dan simpan data yang telah dikemaskini
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String roles = request.getParameter("roles");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306 / CSE3023", "root", "admin");
            String sql = "UPDATE users SET username=?, password=?, roles=? WHERE id =  ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, roles);
            pstmt.setInt(4, Integer.parseInt(id));
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            response.sendRedirect("ViewServlet");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
