package repository.order;

import model.Customer;
import model.Order;
import model.Product;

import java.util.List;

public interface IOrderRepository {
    List<Order> getAllOrder();

    List<Order> getAllOrderOrderByDate();

    boolean deleteOrder(int id);

    boolean saveOrder(int id);

    List<Customer> getCustomerList();

    List<Product> getProductList();

    List<Customer> getCustomerById(int id);

    boolean saveOrderDetail(int customerId, int productId, int quantityProduct);

    List<Order> getOrder();

}