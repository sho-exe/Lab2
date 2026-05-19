package com.lab.controller;

import com.lab.bean.SubjectBean;
import com.lab.dao.SubjectDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SubjectServlet extends HttpServlet {

    private SubjectDAO subjectDAO = new SubjectDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            SubjectBean newSubject = new SubjectBean();
            // Removed setId because the database handles this via auto-increment
            newSubject.setMatric_no(request.getParameter("matric_no"));
            newSubject.setSubject_name(request.getParameter("subject_name"));
            newSubject.setSubject_code(request.getParameter("subject_code"));

            boolean isSuccess = subjectDAO.addSubject(newSubject);

            if (isSuccess) {
                response.sendRedirect("viewSubjects.jsp");
            } else {
                response.getWriter().println("Failed to add subject! <a href='addSubject.html'>Try Again</a>");
            }

        } else if ("update".equals(action)) {
            SubjectBean updatedSubject = new SubjectBean();
            // Kept here because the database needs the ID to know which row to update
            updatedSubject.setId(request.getParameter("id"));
            updatedSubject.setMatric_no(request.getParameter("matric_no"));
            updatedSubject.setSubject_name(request.getParameter("subject_name"));
            updatedSubject.setSubject_code(request.getParameter("subject_code"));

            boolean isSuccess = subjectDAO.updateSubject(updatedSubject);

            if (isSuccess) {
                response.sendRedirect("viewSubjects.jsp");
            } else {
                response.getWriter().println("Failed to update subject!");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String subjectId = request.getParameter("id");

        if ("delete".equals(action)) {
            if (subjectId != null && !subjectId.trim().isEmpty()) {
                subjectDAO.deleteSubject(subjectId);
            }
            response.sendRedirect("viewSubjects.jsp");
            
        } else if ("view".equals(action)) {
            if (subjectId != null && !subjectId.trim().isEmpty()) {
                SubjectBean subject = subjectDAO.getSubjectById(subjectId);
                HttpSession session = request.getSession();
                session.setAttribute("currentSubject", subject);
                response.sendRedirect("updateSubject.jsp");
            } else {
                response.sendRedirect("viewSubjects.jsp");
            }
        }
    }
}