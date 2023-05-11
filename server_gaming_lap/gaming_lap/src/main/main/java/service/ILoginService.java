package service;

import model.Account;
import model.Role;

import java.util.List;

public interface ILoginService {
    List<Account> getCheckRolesAccount();
    boolean saveLogin(Account login);
    Account checkLogin(String user, String pass );
    Role checkRole(String roleName);
    Account checkLoginExit(String user);
    boolean editLogin ( Account login );

}
