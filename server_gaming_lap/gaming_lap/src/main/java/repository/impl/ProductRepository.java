package repository.impl;

import com.mysql.cj.xdevapi.Collection;
import model.Product;
import repository.BaseRepository;
import repository.IProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String GET_LIST = "SELECT * FROM product;";
    private static final String DELETE_PRODUCT_BY_ID = "DELETE FROM product WHERE id = ?;";
    private static final String INSERT_PRODUCT = "INSERT INTO product VALUE (?,?,?,?,?,?);";
    private static final String UPDATE_BY_ID = "UPDATE product SET name = ?, description = ?, price = ?, brand = ?, image = ? WHERE id = ?;";

    @Override
    public List<Product> getList() {
        Connection connection = BaseRepository.getConnection();
        List<Product> productList = new ArrayList<>();


        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_LIST);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                String brand = resultSet.getString("brand");
                String image = resultSet.getString("image");
                productList.add(new Product(id, name, description, price, brand, image));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return productList;
    }

    @Override
    public boolean deleteProduct(String id) {
        Connection connection = BaseRepository.getConnection();
        boolean check;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT_BY_ID);
            preparedStatement.setString(1, id);
            check = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return check;
    }

    @Override
    public boolean saveProduct(Product product) {
        Connection connection = BaseRepository.getConnection();
        boolean check;

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT);
            preparedStatement.setString(1, product.getId());
            preparedStatement.setString(2, product.getName());
            preparedStatement.setString(3, product.getDescription());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setString(5, product.getBrand());
            preparedStatement.setString(6, product.getImage());
            check = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return check;

    }

    @Override
    public boolean editProduct(Product product) {
        Connection connection = BaseRepository.getConnection();

        boolean check;

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);
            preparedStatement.setString(6, product.getId());
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDescription());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setString(4, product.getBrand());
            preparedStatement.setString(5, product.getImage());
            check = preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return check;
    }
}
