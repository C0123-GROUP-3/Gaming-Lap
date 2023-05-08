package repository;

import model.Customer;
import model.Login;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> getAll();
    boolean saveCustomer(Customer customer);


    boolean editCustomer ( Customer customer );
    List<Customer> searchCustomer(String name,String phone);
    boolean deleteCustomer(int deleteId);

}
