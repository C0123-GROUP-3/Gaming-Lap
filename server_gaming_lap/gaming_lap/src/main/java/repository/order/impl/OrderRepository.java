package repository.order.impl;

import model.Customer;
import model.Order;
import model.Product;
import repository.BaseRepository;
import repository.order.IOrderRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderRepository implements IOrderRepository {
    private static final String GET_LIST_ORDER = "SELECT od.id_order AS id,c.id AS c_id, c.`name` AS c_name,c.phone AS c_phone, o.create_time AS create_time, o.update_time AS update_time,SUM(p.price*od.quantity_product) AS total_price FROM `order` AS o INNER JOIN order_detail AS od ON o.id = od.id_order INNER JOIN  product AS p ON od.id_product = p.id INNER JOIN customer AS c ON o.id_customer = c.id GROUP BY od.id_order ORDER BY o.id;";
    private static final String DELETE = "CALL delete_order(?); ";
    private static final String GET_LIST_CUSTOMER = "SELECT id, `name`, phone FROM customer;";
    private static final String GET_LIST_PRODUCT = "SELECT id, name, price FROM product;";
    private static final String GET_LIST_ORDER_ORDER_BY_DATE = "SELECT o.*, c.id AS c_id,c.`name` AS c_name, c.phone AS c_phone, p.id AS p_id, p.name AS p_name FROM `order` AS o\nLEFT JOIN customer AS c ON o.id_customer = c.id\nLEFT JOIN product AS p ON o.id_product = p.id\nORDER BY o.order_date;";
    private static final String INSERT_ORDER = "INSERT INTO `order` (order_date,id_customer,id_product,total_price) VALUES (?,?,?,?);";


    public List<Order> getAllOrder() {
        List<Order> orderList = new ArrayList();
        Connection connection = BaseRepository.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT od.id_order AS id,c.id AS c_id, c.`name` AS c_name,c.phone AS c_phone, o.create_time AS create_time, o.update_time AS update_time,SUM(p.price*od.quantity_product) AS total_price FROM `order` AS o INNER JOIN order_detail AS od ON o.id = od.id_order INNER JOIN  product AS p ON od.id_product = p.id INNER JOIN customer AS c ON o.id_customer = c.id GROUP BY od.id_order ORDER BY o.id;");
            ResultSet resultSet = preparedStatement.executeQuery();

            while(resultSet.next()) {
                String id = resultSet.getString("id");
                String createAt = resultSet.getString("create_time");
                String updateAt = resultSet.getString("update_time");
                String totalPrice = resultSet.getString("total_price");
                int customerId = Integer.parseInt(resultSet.getString("c_id"));
                String customerName = resultSet.getString("c_name");
                String phone = resultSet.getString("c_phone");
                Customer customer = new Customer(customerId, customerName, phone);
                orderList.add(new Order(id, customer, createAt, updateAt, totalPrice));
            }
        } catch (SQLException var13) {
            var13.printStackTrace();
        }

        return orderList;
    }

    public List<Order> getAllOrderOrderByDate() {
        List<Order> orderList = new ArrayList();
        Connection connection = BaseRepository.getConnection();
        return orderList;
    }

    public List<Customer> getCustomerList() {
        List<Customer> customerList = new ArrayList();
        Connection connection = BaseRepository.getConnection();
        return customerList;
    }

    public List<Product> getProductList() {
        List<Product> productList = new ArrayList();
        Connection connection = BaseRepository.getConnection();
        return productList;
    }

    public boolean deleteOrder(int id) {
        Connection connection = BaseRepository.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("CALL delete_order(?); ");
            preparedStatement.setInt(1, id);
            boolean check = preparedStatement.executeUpdate() > 0;
            return check;
        } catch (SQLException var5) {
            throw new RuntimeException(var5);
        }
    }

    public boolean saveOrder(Order order) {
        return false;
    }
}
