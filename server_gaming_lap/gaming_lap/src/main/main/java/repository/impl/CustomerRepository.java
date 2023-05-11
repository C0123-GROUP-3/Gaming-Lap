package repository.impl;

import model.Customer;
import repository.ICustomerRepository;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String SELECT_FORM = "SELECT * FROM customer;";
    private static final String DELETE_CUSTOMER = "CALL delete_customer(?,?);;";
    private static final String INSERT_INTO = "INSERT INTO customer(name,phone,address,email) VALUES(?,?,?,?);";
    private static final String EDIT_CUSTOMER = "UPDATE customer SET name=?,phone=?,address=?,email=?,update_time=? WHERE id=?;";
    private static final String SEARCH_CUSTOMER = "SELECT * FROM customer  WHERE name LIKE ? AND phone LIKE ?;";


    @Override
    public List<Customer> getAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FORM);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String email = resultSet.getString("email");
                String create_time=resultSet.getString("create_time");
                String update_time=resultSet.getString("update_time");
                Customer customer = new Customer(id, name, phone, address, email,create_time,update_time);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public boolean saveCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getPhone());
            preparedStatement.setString(3, customer.getAddress());
            preparedStatement.setString(4, customer.getEmail());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    @Override
    public boolean deleteCustomer(int deleteId) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_CUSTOMER);
            callableStatement.setInt(1, deleteId);
            callableStatement.setInt(2,deleteId);
            return callableStatement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean editCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT_CUSTOMER);
            preparedStatement.setString(1, customer.getName());
            preparedStatement.setString(2, customer.getPhone());
            preparedStatement.setString(3, customer.getAddress());
            preparedStatement.setString(4, customer.getEmail());
            preparedStatement.setString(5, LocalDateTime.now().toString()) ;
            preparedStatement.setInt(6, customer.getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Customer> searchCustomer(String name, String phone) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CUSTOMER);
            preparedStatement.setString(1, '%' + name + '%');
            preparedStatement.setString(2, '%' + phone + '%');
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nameCustomer = resultSet.getString("name");
                String phoneNumber = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String email = resultSet.getString("email");
                Customer customer = new Customer(id, nameCustomer, phoneNumber, address, email);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerList;
    }
}
