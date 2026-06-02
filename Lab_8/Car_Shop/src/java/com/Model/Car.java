package com.Model;

public class Car {

    protected int id;
    protected String brand;
    protected String model;
    protected int cylinder;
    protected int price;

    // 1. Default Constructor
    public Car() {
    }

    // 2. Parameterized Constructor (without ID - useful for auto-increment databases)
    public Car(String brand, String model, int cylinder, int price) {
        super();
        this.brand = brand;
        this.model = model;
        this.cylinder = cylinder;
        this.price = price;
    }

    // 3. Full Parameterized Constructor (with ID)
    public Car(int id, String brand, String model, int cylinder, int price) {
        super();
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.cylinder = cylinder;
        this.price = price;
    }

    // --- GETTERS AND SETTERS ---

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getCylinder() {
        return cylinder;
    }

    public void setCylinder(int cylinder) {
        this.cylinder = cylinder;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}