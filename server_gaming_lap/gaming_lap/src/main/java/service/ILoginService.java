package service;

import model.Account;
import model.Role;

import java.util.List;

public interface ILoginService {

    boolean saveLogin(Account login);
    Account checkLogin(String user, String pass, int role );

    Account checkLoginExit(String user);
    List<Account> getCheckRolesAccount();


}
