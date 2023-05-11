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
    private static final String GET_CUSTOMER_BY_ID = "SELECT id, `name` AS name, phone FROM customer WHERE id = ?;";
    private static final String GET_LIST_PRODUCT = "SELECT id, name, price FROM product;";
    private static final String GET_LIST_ORDER_ORDER_BY_DATE = "SELECT o.*, c.id AS c_id,c.`name` AS c_name, c.phone AS c_phone, p.id AS p_id, p.name AS p_name FROM `order` AS o\nLEFT JOIN customer AS c ON o.id_customer = c.id\nLEFT JOIN product AS p ON o.id_product = p.id\nORDER BY o.order_date;";
    private static final String INSERT_ORDER = "INSERT INTO `order`(id_customer) VALUES (?);";
    private static final String INSERT_ORDER_DETAIL = "INSERT INTO order_detail (id_order,id_product,quantity_product) VALUES (?,?,?);";
    private static final String GET_ORDER = "SELECT id FROM `order` ORDER BY id DESC LIMIT 1;";


    public List<Order> getAllOrder() {
        List<Order> orderList = new ArrayList();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_LIST_ORDER);
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
        } catch (SQLException e) {
            e.printStackTrace();
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
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_LIST_PRODUCT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int productId = Integer.parseInt(resultSet.getString("id"));
                String productName = resultSet.getString("name");
                double price = Double.parseDouble(resultSet.getString("price"));
                productList.add(new Product(productId,productName,price));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return productList;
    }

    @Override
    public List<Customer> getCustomerById(int id) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(GET_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int customerId = Integer.parseInt(resultSet.getString("id"));
                String customerName =resultSet.getString("name");
                String phone = resultSet.getString("phone");
                customerList.add(new Customer(customerId,customerName,phone));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public boolean saveOrderDetail(int customerId, int productId, int quantityProduct) {
        Connection connection = BaseRepository.getConnection();
        boolean check = false;
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER_DETAIL);
            preparedStatement.setInt(1,customerId);
            preparedStatement.setInt(2,productId);
            preparedStatement.setInt(3,quantityProduct);
            check = preparedStatement.executeUpdate() > 0;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return check;
    }

    @Override
    public List<Order> getOrder() {
        List<Order> order = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String id = resultSet.getString("id");
                order.add(new Order(id));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return order;
    }

    public boolean deleteOrder(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            boolean check = preparedStatement.executeUpdate() > 0;
            return check;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean saveOrder(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER);
            preparedStatement.setInt(1, id);
            boolean check = preparedStatement.executeUpdate() > 0;
            return check;
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }
}
