package service.order;

import model.Customer;

import java.util.List;

public interface IOrderCustomerService {
    List<Customer> getAllCustomer();

    List<Customer> searchCustomer(String name, String phone);
}
