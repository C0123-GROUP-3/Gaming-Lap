package service.order;

import model.Customer;
import model.Order;
import model.Product;

import java.util.List;

public interface IOrderService {
    List<Order> getAllOrder();

    List<Order> getAllOrderOrderByDate();

    boolean deleteOrder(int var1);

    boolean saveOrder(Order var1);

    List<Customer> getCustomerList();

    List<Product> getProductList();
}
