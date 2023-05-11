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
    public boolean saveLogin(Account login) {
        return iLoginRepository.saveLogin(login);
    }

    @Override
    public Account checkLogin(String user, String pass,int role) {
        return iLoginRepository.checkLogin(user, pass,role);
    }




    @Override
    public Account checkLoginExit(String user) {
        return iLoginRepository.checkLoginExit(user);
    }

    @Override
    public List<Account> getCheckRolesAccount() {
        return iLoginRepository.getCheckRolesAccount();
    }


}
