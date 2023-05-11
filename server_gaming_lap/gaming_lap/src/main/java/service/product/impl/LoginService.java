package service.impl;

import model.Account;
import model.Role;
import repository.ILoginRepository;
import repository.impl.LoginRepository;
import service.ILoginService;

import java.util.List;

public class LoginService implements ILoginService {
 private static  ILoginRepository iLoginRepository=new LoginRepository();
    @Override
    public List<Account> getCheckRolesAccount() {
        List<Account> loginList=iLoginRepository.getCheckRolesAccount();
        return loginList;
    }

    @Override
    public boolean saveLogin(Account login) {
        return iLoginRepository.saveLogin(login);
    }

    @Override
    public Account checkLogin(String user, String pass) {
        return iLoginRepository.checkLogin(user, pass);
    }

    @Override
    public Role checkRole(String roleName) {
        return iLoginRepository.checkRole(roleName);
    }


    @Override
    public Account checkLoginExit(String user) {
        return iLoginRepository.checkLoginExit(user);
    }

    @Override
    public boolean editLogin(Account login) {
        return false;
    }


}
