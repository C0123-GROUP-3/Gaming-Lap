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

    @Override
    public List<Product> getList() {
        Connection connection = BaseRepository.getConnection();
        List<Product> productList = new ArrayList<>();


        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_LIST);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id =resultSet.getString("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                String brand = resultSet.getString("brand");
                String image = resultSet.getString("image");
                productList.add(new Product(id,name,description,price,brand,image));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return productList;
    }
}
