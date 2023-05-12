package repository.impl;

import model.Product;
import model.TypeProduct;
import repository.BaseRepository;
import repository.IProductRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String GET_LIST = "SELECT * FROM product AS p LEFT JOIN type_product AS TP ON TP.type_id = p.type_id;";
    private static final String GET_LAP_LIST = "SELECT * FROM product INNER JOIN type_product TP ON product.type_id = TP.type_id WHERE TP.type_id = 1;";
    private static final String GET_HEADPHONE_LIST = "SELECT * FROM product INNER JOIN type_product TP ON product.type_id = TP.type_id WHERE TP.type_id = 4;";
    private static final String GET_KEYBOARD_LIST = "SELECT * FROM product INNER JOIN type_product TP ON product.type_id = TP.type_id WHERE TP.type_id = 2;";
    private static final String GET_MOUSE_LIST = "SELECT * FROM product INNER JOIN type_product TP ON product.type_id = TP.type_id WHERE TP.type_id = 3;";

    private static final String GET_TYPE_PRODUCT = "SELECT * FROM type_product;";
    private static final String DELETE_PRODUCT_BY_ID = "DELETE FROM product WHERE id = ?;";
    private static final String INSERT_PRODUCT = "INSERT INTO product (name, description,price, brand, type_id, image) VALUE (?,?,?,?,?,?);";
    private static final String UPDATE_BY_ID = "UPDATE product SET name = ?, description = ?, price = ? , brand = ?, type_id = ?, image = ?, update_time = ? WHERE id = ?;";
    private static final String SEARCH = "SELECT  * FROM product WHERE type_id LIKE ?  AND name LIKE ?;";
    private static final String SORT_PRICE = "SELECT * FROM product ORDER BY price;";
    private static final String SEARCH_NAME = "SELECT * FROM product WHERE name LIKE ?;";


    @Override
    public List<Product> getList() {
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_LIST);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                String brand = resultSet.getString("brand");
                int typeId =resultSet.getInt("type_id");
                String typeName = resultSet.getString("type_name");
                TypeProduct typeProduct = new TypeProduct(typeId,typeName);
                String image = resultSet.getString("image");
                String createTime = resultSet.getString("create_time");
                String updateTime = resultSet.getString("update_time");
                Product product = new Product(id, name,description,price,brand,typeProduct,image,createTime,updateTime);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    @Override
    public boolean deleteProduct(int id) {
        Connection connection = BaseRepository.getConnection();
        boolean check;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT_BY_ID);
            preparedStatement.setInt(1, id);
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
            preparedStatement.setString(1,product.getName());
            preparedStatement.setString(2,product.getDescription());
            preparedStatement.setDouble(3,product.getPrice());
            preparedStatement.setString(4,product.getBrand());
            preparedStatement.setInt(5,product.getTypeProduct().getTypeId());
            preparedStatement.setString(6,product.getImage());
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
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDescription());
            preparedStatement.setDouble(3, product.getPrice());
            preparedStatement.setString(4, product.getBrand());
            preparedStatement.setInt(5, product.getTypeProduct().getTypeId());
            preparedStatement.setString(6,product.getImage());
            preparedStatement.setString(7, LocalDateTime.now().toString());
            preparedStatement.setInt(8,product.getId());
            check = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return check;
    }

    @Override
    public List<Product> searchList(String search, int typeId) {
        Connection connection = BaseRepository.getConnection();
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(2, "%" + search + "%");
            preparedStatement.setString(1,"%" + typeId + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                String brand = resultSet.getString("brand");
                int typeProductId = resultSet.getInt("type_id");
                TypeProduct typeProduct1 = new TypeProduct(typeProductId);
                String image = resultSet.getString("image");
                String createTime = resultSet.getString("create_time");
                String updateTime = resultSet.getString("update_time");
                Product product = new Product(id, name, description, price, brand, typeProduct1, image, createTime, updateTime);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    @Override
    public List<Product> getListSortByPrice() {
        Connection connection = BaseRepository.getConnection();
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_PRICE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                String brand = resultSet.getString("brand");
                String image = resultSet.getString("image");
//                Product product = new Product(id, name, description, price, brand, image);
//                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    @Override
    public List<TypeProduct> getTypeProductList() {
        List<TypeProduct> typeProductList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_TYPE_PRODUCT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("type_id");
                String name = resultSet.getString("type_name");
                TypeProduct typeProduct = new TypeProduct(id,name);
                typeProductList.add(typeProduct);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return typeProductList;
    }

    @Override
    public List<Product> keyboardList() {
        Connection connection = BaseRepository.getConnection();
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_KEYBOARD_LIST);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                String brand = resultSet.getString("brand");
                int typeProductId = resultSet.getInt("type_id");
                TypeProduct typeProduct1 = new TypeProduct(typeProductId);
                String image = resultSet.getString("image");
                String createTime = resultSet.getString("create_time");
                String updateTime = resultSet.getString("update_time");
                Product product = new Product(id, name, description, price, brand, typeProduct1, image, createTime, updateTime);
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public List<Product> laptopList() {
        Connection connection = BaseRepository.getConnection();
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_LAP_LIST);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                String brand = resultSet.getString("brand");
                int typeProductId = resultSet.getInt("type_id");
                TypeProduct typeProduct1 = new TypeProduct(typeProductId);
                String image = resultSet.getString("image");
                String createTime = resultSet.getString("create_time");
                String updateTime = resultSet.getString("update_time");
                Product product = new Product(id, name, description, price, brand, typeProduct1, image, createTime, updateTime);
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public List<Product> headphoneList() {
        Connection connection = BaseRepository.getConnection();
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_HEADPHONE_LIST);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                String brand = resultSet.getString("brand");
                int typeProductId = resultSet.getInt("type_id");
                TypeProduct typeProduct1 = new TypeProduct(typeProductId);
                String image = resultSet.getString("image");
                String createTime = resultSet.getString("create_time");
                String updateTime = resultSet.getString("update_time");
                Product product = new Product(id, name, description, price, brand, typeProduct1, image, createTime, updateTime);
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public List<Product> mouseList() {
        Connection connection = BaseRepository.getConnection();
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_MOUSE_LIST);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                String brand = resultSet.getString("brand");
                int typeProductId = resultSet.getInt("type_id");
                TypeProduct typeProduct1 = new TypeProduct(typeProductId);
                String image = resultSet.getString("image");
                String createTime = resultSet.getString("create_time");
                String updateTime = resultSet.getString("update_time");
                Product product = new Product(id, name, description, price, brand, typeProduct1, image, createTime, updateTime);
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public List<Product> searchName(String search) {
        Connection connection = BaseRepository.getConnection();
        List<Product> productList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_NAME);
            preparedStatement.setString(1,'%'+search + '%');
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                String brand = resultSet.getString("brand");
                int typeProductId = resultSet.getInt("type_id");
                TypeProduct typeProduct1 = new TypeProduct(typeProductId);
                String image = resultSet.getString("image");
                String createTime = resultSet.getString("create_time");
                String updateTime = resultSet.getString("update_time");
                Product product = new Product(id, name, description, price, brand, typeProduct1, image, createTime, updateTime);
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }
}
