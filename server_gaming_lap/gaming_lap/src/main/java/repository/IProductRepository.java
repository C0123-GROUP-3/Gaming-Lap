package repository;

import model.Product;
import model.TypeProduct;

import java.util.List;

public interface IProductRepository {
    List<Product> getList();

    boolean deleteProduct(String id);

    boolean saveProduct(Product product);

    boolean editProduct(Product product);

    List<Product> searchList(String search);

    List<Product> getListSortByPrice();

    List<TypeProduct> getTypeProductList();
}
