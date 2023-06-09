package repository.order;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> getAllCustomer();

    List<Customer> searchCustomers(String name, String phone);
}
