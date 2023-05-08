package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> getList() {
        return productRepository.getList();

    }

    @Override
    public boolean deleteProduct(String id) {
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
}
