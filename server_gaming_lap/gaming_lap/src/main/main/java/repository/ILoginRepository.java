package repository;

import model.Account;
import model.Role;

import java.util.List;

public interface ILoginRepository {
    List<Account> getCheckRolesAccount();
    boolean saveLogin(Account login);

    Account checkLogin(String user, String pass);
    Account checkLoginExit(String user);
    Role checkRole(String roleName);
    boolean editLogin ( Account login );

}
