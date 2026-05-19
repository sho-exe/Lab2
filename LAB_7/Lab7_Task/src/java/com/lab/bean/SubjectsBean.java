package com.lab.bean;

import java.io.Serializable;

public class SubjectsBean implements Serializable {
    
    private int id;
    private String subjectName;
    private String subjectCode;
    private int creditHour;

    public SubjectsBean() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getSubjectName() { return subjectName; }
    public void setSubjectName(String subjectName) { this.subjectName = subjectName; }

    public String getSubjectCode() { return subjectCode; }
    public void setSubjectCode(String subjectCode) { this.subjectCode = subjectCode; }

    public int getCreditHour() { return creditHour; }
    public void setCreditHour(int creditHour) { this.creditHour = creditHour; }
}