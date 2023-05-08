package repository;

import model.Customer;
import model.Login;

import java.util.List;

public interface ILoginRepository {
    List<Login> getAll();
    boolean saveLogin(Login login);

    Login checkLogin(String user, String pass);
    Login checkLoginExit(String user);
    boolean editLogin ( Login login );

}
