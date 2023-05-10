package service.order.impl;

import model.Customer;
import model.Order;
import model.Product;
import repository.order.IOrderRepository;
import repository.order.impl.OrderRepository;
import service.order.IOrderService;

import java.util.List;

public class OrderService implements IOrderService {
    private final IOrderRepository orderRepository = new OrderRepository();
    public List<Order> getAllOrder() {
        return this.orderRepository.getAllOrder();
    }

    public List<Order> getAllOrderOrderByDate() {
        return this.orderRepository.getAllOrderOrderByDate();
    }

    public boolean deleteOrder(int id) {
        return this.orderRepository.deleteOrder(id);
    }

    public boolean saveOrder(Order order) {
        return this.orderRepository.saveOrder(order);
    }

    public List<Customer> getCustomerList() {
        return this.orderRepository.getCustomerList();
    }

    public List<Product> getProductList() {
        return this.orderRepository.getProductList();
    }
}
