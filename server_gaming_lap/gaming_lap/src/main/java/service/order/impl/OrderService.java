package service.order.impl;

import model.Customer;
import model.Order;
import model.OrderDetail;
import model.Product;
import repository.order.IOrderRepository;
import repository.order.impl.OrderRepository;
import service.order.IOrderService;

import java.util.List;

public class OrderService implements IOrderService {
    private final IOrderRepository orderRepository = new OrderRepository();
    public List<Order> getAllOrder() {
        return orderRepository.getAllOrder();
    }

    public List<Order> getAllOrderOrderByDate() {
        return orderRepository.getAllOrderOrderByDate();
    }

    public boolean deleteOrder(int id) {
        return orderRepository.deleteOrder(id);
    }

    public boolean saveOrder(int id) {
        return orderRepository.saveOrder(id);
    }

    public List<Customer> getCustomerList() {
        return this.orderRepository.getCustomerList();
    }

    public List<Product> getProductList() {
        return this.orderRepository.getProductList();
    }

    @Override
    public List<Customer> getCustomerById(int id) {
        return orderRepository.getCustomerById(id);
    }

    @Override
    public boolean saveOrderDetail(int customerId, int productId, int quantityProduct) {
        return orderRepository.saveOrderDetail(customerId,productId,quantityProduct);
    }

    @Override
    public List<Order> getOrder() {
        return orderRepository.getOrder();
    }

    @Override
    public List<Order> searchOrder(String id, String phone) {
        return orderRepository.searchOrder(id, phone);
    }

    @Override
    public List<Order> getInfoOrderById(int id) {
        return orderRepository.getInfoOrderById(id);
    }

    @Override
    public List<OrderDetail> getInfoOrderDetail(int id) {
        return orderRepository.getInfoOrderDetail(id);
    }

    @Override
    public List<Order> getTotalPrice(int id) {
        return orderRepository.getTotalPrice(id);
    }
}
