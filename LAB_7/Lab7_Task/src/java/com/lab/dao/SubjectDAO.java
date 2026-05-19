package com.lab.dao;

import com.lab.bean.SubjectBean;
import com.lab.bean.SubjectsBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SubjectDAO {

    // Database configurations central location
    private final String dbUrl = "jdbc:mysql://localhost:3306/lab7_db";
    private final String dbUser = "root";
    private final String dbPassword = "";
    private final String dbDriver = "com.mysql.cj.jdbc.Driver";

    private Connection getConnection() throws Exception {
        Class.forName(dbDriver);
        return DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    }

    // --- ADD SUBJECT (ID removed for Auto-Increment) ---
    public boolean addSubject(SubjectBean subject) {
        String sql = "INSERT INTO registered_subjects (matric_no, subject_name, subject_code) VALUES (?, ?, ?)";
        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, subject.getMatric_no());
            pstmt.setString(2, subject.getSubject_name());
            pstmt.setString(3, subject.getSubject_code());
            
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // --- UPDATE SUBJECT ---
    public boolean updateSubject(SubjectBean subject) {
        String sql = "UPDATE registered_subjects SET matric_no = ?, subject_name = ?, subject_code = ? WHERE id = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, subject.getMatric_no());
            pstmt.setString(2, subject.getSubject_name());
            pstmt.setString(3, subject.getSubject_code());
            pstmt.setString(4, subject.getId());
            
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // --- GET SUBJECT BY ID ---
    public SubjectBean getSubjectById(String id) {
        SubjectBean subject = null;
        String sql = "SELECT * FROM registered_subjects WHERE id = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    subject = new SubjectBean();
                    subject.setId(rs.getString("id"));
                    subject.setMatric_no(rs.getString("matric_no"));
                    subject.setSubject_name(rs.getString("subject_name"));
                    subject.setSubject_code(rs.getString("subject_code"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return subject;
    }

    // --- FETCH ALL SUBJECTS FOR A SPECIFIC MATRIC NUMBER ---
    public List<SubjectBean> getAllSubjectsByMatric(String matricNo) {
        List<SubjectBean> list = new ArrayList<>();
        String sql = "SELECT * FROM registered_subjects WHERE matric_no = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, matricNo);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    SubjectBean subject = new SubjectBean();
                    subject.setId(rs.getString("id"));
                    subject.setMatric_no(rs.getString("matric_no"));
                    subject.setSubject_name(rs.getString("subject_name"));
                    subject.setSubject_code(rs.getString("subject_code"));
                    list.add(subject);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // --- DELETE SUBJECT ---
    public boolean deleteSubject(String id) {
        String sql = "DELETE FROM registered_subjects WHERE id = ?";
        try (Connection conn = getConnection(); 
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, id);
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // --- FETCH MASTER LIST OF ALL AVAILABLE SUBJECTS FOR DROPDOWN ---
    public List<SubjectsBean> getAllSubjects() {
        List<SubjectsBean> subjects = new ArrayList<>();
        String query = "SELECT * FROM subjects";
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                SubjectsBean sb = new SubjectsBean();
                sb.setId(rs.getInt("id"));
                sb.setSubjectName(rs.getString("subject_name"));
                sb.setSubjectCode(rs.getString("subject_code"));
                sb.setCreditHour(rs.getInt("credit_hour"));
                subjects.add(sb);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return subjects;
    }
}