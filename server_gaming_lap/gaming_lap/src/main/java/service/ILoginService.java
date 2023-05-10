package service;

import model.Account;

import java.util.List;

public interface ILoginService {
    List<Account> getAll();
    boolean saveLogin(Account login);
    Account checkLogin(String user, String pass);
    Account checkLoginExit(String user);
    boolean editLogin ( Account login );

}
