package repository;

import model.Account;


import java.util.List;

public interface ILoginRepository {
    boolean saveLogin(Account login);

    Account checkLogin(String user, String pass, int role);
    Account checkLoginExit(String user);

    List<Account> getCheckRolesAccount();
}
