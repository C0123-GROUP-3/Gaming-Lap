package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> getAll();

    boolean saveCustomer(Customer customer);

    boolean deleteCustomer(int deleteId);



    boolean editCustomer( Customer customer);
    List<Customer> searchCustomer(String name,String phone);


}
