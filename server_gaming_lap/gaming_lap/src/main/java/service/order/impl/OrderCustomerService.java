package service.order.impl;

import model.Customer;
import repository.order.ICustomerRepository;
import repository.order.impl.CustomerRepository;
import service.order.IOrderCustomerService;

import java.util.List;

public class OrderCustomerService implements IOrderCustomerService {
    private final ICustomerRepository customerRepository = new CustomerRepository();
    public List<Customer> getAllCustomer() {
        return this.customerRepository.getAllCustomer();
    }

    @Override
    public List<Customer> searchCustomer(String name, String phone) {
        return customerRepository.searchCustomers(name,phone);
    }
}
