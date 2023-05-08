package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getList();

    boolean deleteProduct(String id);

    boolean saveProduct(Product product);

    boolean editProduct(Product product);
}
