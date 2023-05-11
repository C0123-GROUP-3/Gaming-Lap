package repository.order.impl;

import model.Customer;
import repository.BaseRepository;
import repository.order.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String GET_LIST_ORDER = "SELECT * FROM customer;";


    public List<Customer> getAllCustomer() {
        List<Customer> customerList = new ArrayList();
        Connection connection = BaseRepository.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM customer;");
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String phone = resultSet.getString("phone");
                String address = resultSet.getString("address");
                String email = resultSet.getString("email");
                String create_time = resultSet.getString("create_time");
                String update_time = resultSet.getString("update_time");
                Customer customer = new Customer(id, name, phone, address, email, create_time, update_time);
                customerList.add(customer);
            }
        } catch (SQLException var13) {
            var13.printStackTrace();
        }

        return customerList;
    }
}
