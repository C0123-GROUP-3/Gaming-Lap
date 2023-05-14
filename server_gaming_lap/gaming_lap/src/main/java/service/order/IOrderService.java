package service.order;

import model.Customer;
import model.Order;
import model.OrderDetail;
import model.Product;

import java.util.List;

public interface IOrderService {
    List<Order> getAllOrder();

    List<Order> getAllOrderOrderByDate();

    boolean deleteOrder(int id);

    boolean saveOrder(int id);

    List<Customer> getCustomerList();

    List<Product> getProductList();

    List<Customer> getCustomerById(int id);

    boolean saveOrderDetail(int customerId, int productId, int quantityProduct);

    List<Order> getOrder();

    List<Order> searchOrder(int id, String phone);

    List<Order> getInfoOrderById(int id);

    List<OrderDetail> getInfoOrderDetail(int id);

    List<Order> getTotalPrice(int id);
}
