package service.product;

import model.Product;
import model.TypeProduct;

import java.util.List;

public interface IProductService {
    List<Product> getList();

    boolean deleteProduct(int id);

    boolean saveProduct(Product product);

    boolean editProduct(Product product);

    List<Product> searchList(String search, int typeId);

    List<Product> getListSortByPrice();

    List<TypeProduct> getTypeProductList();

    List<Product> getKeyboardList();

    List<Product> laptopList();

    List<Product> headphoneList();

    List<Product> mouseList();

    List<Product> searchName(String search);
}
