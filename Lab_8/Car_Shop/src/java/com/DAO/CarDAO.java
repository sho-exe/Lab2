package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.Model.Car;

public class CarDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/carshop";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";
    
    private static final String INSERT_CAR_SQL = "INSERT INTO carPriceList (brand, model, cylinder, price) VALUES (?, ?, ?, ?);";
    private static final String SELECT_CAR_BY_ID = "SELECT car_id, brand, model, cylinder, price FROM carPriceList WHERE car_id = ?;";
    private static final String SELECT_ALL_CARS = "SELECT * FROM carPriceList;";
    private static final String DELETE_CAR_SQL = "DELETE FROM carPriceList WHERE car_id = ?;";
    private static final String UPDATE_CAR_SQL = "UPDATE carPriceList SET brand = ?, model = ?, cylinder = ?, price = ? WHERE car_id = ?;";

    public CarDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            // Note: Use "com.mysql.cj.jdbc.Driver" if you are using MySQL 8.x+
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // 1. Insert a new Car
    public void insertCar(Car car) throws SQLException {
        System.out.println(INSERT_CAR_SQL);
        try (Connection connection = getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CAR_SQL)) {
            preparedStatement.setString(1, car.getBrand());
            preparedStatement.setString(2, car.getModel());
            preparedStatement.setInt(3, car.getCylinder());
            preparedStatement.setInt(4, car.getPrice());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    // 2. Select a single Car by ID
    public Car selectCar(int id) {
        Car car = null;
        try (Connection connection = getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CAR_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String brand = rs.getString("brand");
                String model = rs.getString("model");
                int cylinder = rs.getInt("cylinder");
                int price = rs.getInt("price");
                car = new Car(id, brand, model, cylinder, price);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return car;
    }

    // 3. Select all Cars
    public List<Car> selectAllCars() {
        List<Car> cars = new ArrayList<>();
        try (Connection connection = getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CARS)) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("car_id");
                String brand = rs.getString("brand");
                String model = rs.getString("model");
                int cylinder = rs.getInt("cylinder");
                int price = rs.getInt("price");

                cars.add(new Car(id, brand, model, cylinder, price));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return cars;
    }

    // 4. Delete a Car
    public boolean deleteCar(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); 
             PreparedStatement statement = connection.prepareStatement(DELETE_CAR_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    // 5. Update a Car's information
    public boolean updateCar(Car car) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); 
             PreparedStatement statement = connection.prepareStatement(UPDATE_CAR_SQL)) {
            statement.setString(1, car.getBrand());
            statement.setString(2, car.getModel());
            statement.setInt(3, car.getCylinder());
            statement.setInt(4, car.getPrice());
            statement.setInt(5, car.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}