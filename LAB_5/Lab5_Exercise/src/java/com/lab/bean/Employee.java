package com.lab.bean;

/**
 *
 * @author sho
 */
public class Employee {

    private String empId;
    private String name;
    private String department;
    private double basicSalary;

    public Employee() {

    }
    
    public Employee(String empId, String name, String department, double basicSalary) {
        this.empId = empId;
        this.name = name;
        this.department = department;
        this.basicSalary = basicSalary;
    }

    public void setEmpId(String empId) {
        this.empId = empId;
    }

    public String getEmpId() {
        return empId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getDepartment() {
        return department;
    }

    public void setBasicSalary(double basicSalary) {
        this.basicSalary = basicSalary;
    }

    public Double getBasicSalary() {
        return basicSalary;
    }

}
