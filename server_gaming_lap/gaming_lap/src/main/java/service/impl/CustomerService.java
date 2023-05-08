package service.impl;

import model.Customer;
import model.Login;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;
import java.util.List;

public class CustomerService implements ICustomerService {
    private static ICustomerRepository iCustomerRepository=new CustomerRepository();
    @Override
    public List<Customer> getAll() {
        List<Customer> customerList=iCustomerRepository.getAll();
        if (customerList.size()==0){
            System.out.println("NO");
            return null;
        }
        return customerList;
    }

    @Override
    public boolean saveCustomer(Customer customer) {
        return iCustomerRepository.saveCustomer(customer);
    }
    @Override
    public boolean deleteCustomer(int deleteId) {
        return iCustomerRepository.deleteCustomer(deleteId);
    }


    @Override
    public boolean editCustomer( Customer customer) {
        return iCustomerRepository.editCustomer(customer);
    }

    @Override
    public List<Customer> searchCustomer(String name, String phone) {
        return iCustomerRepository.searchCustomer(name,phone);
    }


}
