package service.product.impl;

import model.Product;
import model.TypeProduct;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.product.IProductService;


import java.util.List;

public class ProductService implements IProductService {
    IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> getList() {
        return productRepository.getList();

    }

    @Override
    public boolean deleteProduct(int id) {
        return productRepository.deleteProduct(id);
    }

    @Override
    public boolean saveProduct(Product product) {
        return productRepository.saveProduct(product);
    }

    @Override
    public boolean editProduct(Product product) {
        return productRepository.editProduct(product);
    }

    @Override
    public List<Product> searchList(String search, int typeId) {
        return productRepository.searchList(search,typeId);
    }

    @Override
    public List<Product> getListSortByPrice() {
        return productRepository.getListSortByPrice();
    }

    @Override
    public List<TypeProduct> getTypeProductList() {
        return productRepository.getTypeProductList();
    }

    @Override
    public List<Product> getKeyboardList() {
        return productRepository.keyboardList();
    }

    @Override
    public List<Product> laptopList() {
        return productRepository.laptopList();
    }

    @Override
    public List<Product> headphoneList() {
        return productRepository.headphoneList();
    }

    @Override
    public List<Product> mouseList() {
        return productRepository.mouseList();
    }

    @Override
    public List<Product> searchName(String search) {
        return  productRepository.searchName(search);
    }
}
