package service;

import model.Customer;
import model.Login;

import java.util.List;

public interface ILoginService {
    List<Login> getAll();
    boolean saveLogin(Login login);
    Login checkLogin(String user, String pass);
    Login checkLoginExit(String user);
    boolean editLogin ( Login login );

}
