package repository;

import model.Product;
import model.TypeProduct;

import java.util.List;

public interface IProductRepository {
    List<Product> getList();

    boolean deleteProduct(int id);

    boolean saveProduct(Product product);

    boolean editProduct(Product product);

    List<Product> searchList(String search, int typeId);

    List<Product> getListSortByPrice();

    List<TypeProduct> getTypeProductList();

    List<Product> keyboardList();

    List<Product> laptopList();

    List<Product> headphoneList();

    List<Product> mouseList();
}
