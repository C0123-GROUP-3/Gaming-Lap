package service.order.impl;

import model.Customer;
import repository.order.ICustomerRepository;
import repository.order.impl.CustomerRepository;
import service.order.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    public final ICustomerRepository customerRepository = new CustomerRepository();
    public List<Customer> getAllCustomer() {
        return this.customerRepository.getAllCustomer();
    }
}
